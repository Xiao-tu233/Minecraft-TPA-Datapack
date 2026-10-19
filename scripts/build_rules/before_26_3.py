"""Downgrade predicate and advancement conditions for Minecraft before 26.3."""

from __future__ import annotations

import json
from pathlib import Path
from typing import Any


CONDITION_TYPES = {
    "all_of",
    "any_of",
    "entity_properties",
    "entity_scores",
    "inverted",
    "int_value_check",
    "location_check",
    "match_block",
}
ADVANCEMENT_CONDITION_FIELDS = {
    "block",
    "damage",
    "entity",
    "item",
    "killing_blow",
    "location",
    "player",
    "source",
    "victim",
}


def _condition_name(value: Any) -> str | None:
    if not isinstance(value, str):
        return None
    return value.rsplit(":", 1)[-1]


def _downgrade_condition_nodes(value: Any) -> Any:
    if isinstance(value, list):
        return [_downgrade_condition_nodes(item) for item in value]
    if not isinstance(value, dict):
        return value

    converted = {
        key: _downgrade_condition_nodes(item)
        for key, item in value.items()
    }
    condition_type = _condition_name(converted.get("type"))
    if condition_type == "int_value_check":
        converted["type"] = converted["type"].replace("int_value_check", "value_check")
        if "test" in converted:
            converted["range"] = converted.pop("test")
    elif condition_type == "match_block":
        converted["type"] = converted["type"].replace("match_block", "block_state_property")
        block_predicate = converted.pop("predicate", {})
        if isinstance(block_predicate, dict) and "blocks" in block_predicate:
            converted["block"] = block_predicate.pop("blocks")
            if block_predicate:
                converted["state"] = block_predicate
    if condition_type in CONDITION_TYPES:
        converted["condition"] = converted.pop("type")
    return converted


def _downgrade_advancement_conditions(document: dict[str, Any]) -> None:
    for criterion in document.get("criteria", {}).values():
        if not isinstance(criterion, dict):
            continue
        conditions = criterion.get("conditions")
        if not isinstance(conditions, dict):
            continue

        for field in ADVANCEMENT_CONDITION_FIELDS:
            condition = conditions.get(field)
            if not isinstance(condition, dict):
                continue

            condition_type = condition.get("type", condition.get("condition"))
            if _condition_name(condition_type) == "all_of":
                terms = condition.get("terms")
                if isinstance(terms, list):
                    conditions[field] = terms
                    continue
            conditions[field] = [condition]


def downgrade_condition_schema(document: dict[str, Any], *, advancement: bool) -> dict[str, Any]:
    converted = _downgrade_condition_nodes(document)
    if advancement:
        _downgrade_advancement_conditions(converted)
    return converted


def upgrade_condition_schema(document: dict[str, Any], *, advancement: bool) -> dict[str, Any]:
    """Convert pre-26.3 condition fields and advancement lists to the 26.3 form."""

    converted = document
    if advancement:
        for criterion in converted.get("criteria", {}).values():
            if not isinstance(criterion, dict):
                continue
            conditions = criterion.get("conditions")
            if not isinstance(conditions, dict):
                continue
            for field in ADVANCEMENT_CONDITION_FIELDS:
                condition_list = conditions.get(field)
                if isinstance(condition_list, list):
                    conditions[field] = {
                        "condition": "minecraft:all_of",
                        "terms": condition_list,
                    }

    def rename_condition_key(value: Any) -> Any:
        if isinstance(value, list):
            return [rename_condition_key(item) for item in value]
        if not isinstance(value, dict):
            return value
        result = {key: rename_condition_key(item) for key, item in value.items()}
        if "condition" in result:
            result["type"] = result.pop("condition")
        condition_type = _condition_name(result.get("type"))
        if condition_type == "value_check":
            result["type"] = "minecraft:int_value_check"
            if "range" in result:
                result["test"] = result.pop("range")
        elif condition_type == "block_state_property":
            result["type"] = "minecraft:match_block"
            block = result.pop("block", None)
            if block is not None:
                result["predicate"] = {"blocks": block}
        return result

    return rename_condition_key(converted)


def downgrade_26_3_conditions(data_root: Path) -> int:
    """Restore the pre-26.3 schema in predicate and advancement JSON resources."""

    changed_files = 0
    for directory in ("predicate", "predicates", "advancement", "advancements"):
        for path in data_root.glob(f"*/{directory}/**/*.json"):
            original = path.read_text(encoding="utf-8")
            document = json.loads(original)

            converted = downgrade_condition_schema(
                document,
                advancement=directory in {"advancement", "advancements"},
            )
            rendered = json.dumps(converted, ensure_ascii=False, indent=4) + "\n"
            if rendered != original:
                path.write_text(rendered, encoding="utf-8", newline="")
                changed_files += 1
    return changed_files
