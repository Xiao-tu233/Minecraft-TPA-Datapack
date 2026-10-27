from __future__ import annotations

import json
import tempfile
import unittest
from pathlib import Path
from unittest.mock import patch

from scripts.build_rules import apply_build_rules, convert_relative_path
from scripts.build_rules.before_1_20_2 import remove_function_line_continuations
from scripts.build_rules.before_26_3 import downgrade_condition_schema


class BuildRulesTests(unittest.TestCase):
    def test_resource_directory_names_follow_target_version(self) -> None:
        source = Path(
            "data/minecraft/tags/function/tpa.mcfunction"
        )
        self.assertEqual(
            convert_relative_path(source, (1, 20, 6, 0)),
            Path("data/minecraft/tags/functions/tpa.mcfunction"),
        )
        self.assertEqual(
            convert_relative_path(
                Path("data/tpa/predicate/available.json"),
                (1, 20, 6, 0),
            ),
            Path("data/tpa/predicates/available.json"),
        )
        self.assertEqual(
            convert_relative_path(
                Path("data/tpa/advancement/book.json"),
                (1, 20, 6, 0),
            ),
            Path("data/tpa/advancements/book.json"),
        )
        self.assertEqual(
            convert_relative_path(source, (1, 21, 0, 0)),
            source,
        )

    def test_removes_continuations_and_preserves_other_lines(self) -> None:
        with tempfile.TemporaryDirectory() as directory:
            data_root = Path(directory)
            function = data_root / "tpa" / "functions" / "example.mcfunction"
            function.parent.mkdir(parents=True)
            function.write_bytes(
                b"execute if entity @a \\\r\n"
                b"    run say first \\\r\n"
                b"        run say second\r\n"
                b"say untouched\r\n"
            )
            json_file = data_root / "tpa" / "predicate.json"
            json_file.write_text('"\\\\\\n"\n', encoding="utf-8")

            changed = remove_function_line_continuations(data_root)

            self.assertEqual(changed, 1)
            self.assertEqual(
                function.read_bytes(),
                b"execute if entity @a run say first run say second\r\n"
                b"say untouched\r\n",
            )
            self.assertEqual(json_file.read_text(encoding="utf-8"), '"\\\\\\n"\n')

    def test_rule_only_runs_for_versions_before_1_20_2(self) -> None:
        with tempfile.TemporaryDirectory() as directory:
            data_root = Path(directory)
            function = data_root / "example.mcfunction"
            function.write_text(
                "execute if entity @a \\\n    run say test\n",
                encoding="utf-8",
            )

            changed = apply_build_rules(data_root, (1, 20, 2, 0))
            self.assertEqual(changed, 0)
            self.assertIn("\\\n", function.read_text(encoding="utf-8"))

            changed = apply_build_rules(data_root, (1, 20, 1, 0))
            self.assertEqual(changed, 1)
            self.assertEqual(
                function.read_text(encoding="utf-8"),
                "execute if entity @a run say test\n",
            )

    def test_26_3_conditions_downgrade_to_26_2_schema(self) -> None:
        advancement = {
            "criteria": {
                "interact": {
                    "trigger": "minecraft:any_block_use",
                    "conditions": {
                        "player": {
                            "type": "minecraft:all_of",
                            "terms": [
                                {
                                    "type": "minecraft:entity_scores",
                                    "entity": "this",
                                    "scores": {"tpa.book": 2},
                                }
                            ],
                        }
                    },
                }
            }
        }
        predicate = {
            "type": "minecraft:any_of",
            "terms": [
                {
                    "type": "minecraft:int_value_check",
                    "value": {"type": "minecraft:storage", "storage": "tpa:tpa", "path": "option.x"},
                    "test": 1,
                }
            ],
        }
        advancement["criteria"]["interact"]["conditions"]["location"] = {
            "type": "minecraft:match_block",
            "predicate": {"blocks": "minecraft:chest"},
        }

        downgraded_advancement = downgrade_condition_schema(advancement, advancement=True)
        downgraded_predicate = downgrade_condition_schema(predicate, advancement=False)

        self.assertEqual(
            downgraded_advancement["criteria"]["interact"]["conditions"]["player"],
            [{
                "condition": "minecraft:entity_scores",
                "entity": "this",
                "scores": {"tpa.book": 2},
            }],
        )
        downgraded_block = downgraded_advancement["criteria"]["interact"]["conditions"]["location"][0]
        self.assertEqual(downgraded_block["condition"], "minecraft:block_state_property")
        self.assertEqual(downgraded_block["block"], "minecraft:chest")
        self.assertEqual(downgraded_predicate["condition"], "minecraft:any_of")
        value_check = downgraded_predicate["terms"][0]
        self.assertEqual(value_check["condition"], "minecraft:value_check")
        self.assertEqual(value_check["range"], 1)
        self.assertEqual(
            value_check["value"]["type"],
            "minecraft:storage",
        )

    def test_26_3_rule_applies_only_to_older_build_targets(self) -> None:
        with tempfile.TemporaryDirectory() as directory:
            data_root = Path(directory)
            predicate_dir = data_root / "tpa" / "predicate"
            advancement_dir = data_root / "tpa" / "advancement"
            predicate_dir.mkdir(parents=True)
            advancement_dir.mkdir(parents=True)
            predicate = predicate_dir / "available.json"
            advancement = advancement_dir / "book.json"
            predicate.write_text(
                '{"type":"minecraft:any_of","terms":[{"type":"minecraft:entity_scores","scores":{"x":1}}]}',
                encoding="utf-8",
            )
            advancement.write_text(
                '{"criteria":{"use":{"conditions":{"player":{"type":"minecraft:all_of","terms":[{"type":"minecraft:entity_scores","scores":{"x":1}}]}}}}}',
                encoding="utf-8",
            )

            self.assertEqual(apply_build_rules(data_root, (26, 3, 0, 0)), 0)
            self.assertIn('"type"', predicate.read_text(encoding="utf-8"))

            self.assertEqual(apply_build_rules(data_root, (26, 2, 0, 0)), 2)
            predicate_json = json.loads(predicate.read_text(encoding="utf-8"))
            advancement_json = json.loads(advancement.read_text(encoding="utf-8"))
            self.assertEqual(predicate_json["condition"], "minecraft:any_of")
            self.assertEqual(
                advancement_json["criteria"]["use"]["conditions"]["player"][0]["condition"],
                "minecraft:entity_scores",
            )

    def test_overlay_build_has_converted_base_resources(self) -> None:
        """A legacy overlay must override incompatible base resources."""
        from scripts import build as build_script

        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            source = root / "source"
            target = root / "artifact"
            (source / "data" / "tpa" / "predicate").mkdir(parents=True)
            (source / "data" / "tpa" / "predicate" / "available.json").write_text(
                json.dumps(
                    {
                        "type": "minecraft:any_of",
                        "terms": [
                            {
                                "type": "minecraft:int_value_check",
                                "value": {
                                    "type": "minecraft:storage",
                                    "storage": "tpa:tpa",
                                    "path": "option.x",
                                },
                                "test": 1,
                            }
                        ],
                    }
                ),
                encoding="utf-8",
            )

            build_script.copy_data_tree(
                source / "data",
                target,
                (26, 2, 0, 0),
            )
            build_script.apply_build_rules(target / "data", (26, 2, 0, 0))

            converted = json.loads(
                (target / "data" / "tpa" / "predicate" / "available.json").read_text(
                    encoding="utf-8"
                )
            )
            self.assertEqual(converted["condition"], "minecraft:any_of")
            self.assertEqual(converted["terms"][0]["condition"], "minecraft:value_check")

    def test_26_2_overlay_covers_the_server_pack_format(self) -> None:
        from scripts import build as build_script

        profile = next(
            item for item in build_script.PROFILES if item.suffix == "+mc1.20.2"
        )
        metadata = build_script.make_pack_meta(
            {"version": "test"},
            profile,
            [build_script.version("26.2")],
            modern=True,
        )
        entry = metadata["overlays"]["entries"][0]
        self.assertEqual(metadata["pack"]["pack_format"], 107)
        self.assertEqual(entry["formats"], [16, 107])
        self.assertEqual(entry["min_format"], [16, 0])
        self.assertEqual(entry["max_format"], [107, 1])

    def test_modern_overlay_contains_only_converted_files_without_source_data(self) -> None:
        from scripts import build as build_script

        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            extra = root / "extra"
            artifact = root / "artifact"
            pack_image = root / "pack.png"
            pack_image.write_bytes(b"png")

            (extra / "data" / "tpa" / "predicate").mkdir(parents=True)
            (extra / "data" / "tpa" / "predicate" / "available.json").write_text(
                '{"type":"minecraft:any_of","terms":[]}',
                encoding="utf-8",
            )
            (extra / "data" / "tpa" / "function").mkdir(parents=True)
            (extra / "data" / "tpa" / "function" / "unchanged.mcfunction").write_text(
                "say unchanged\n",
                encoding="utf-8",
            )
            artifact.mkdir()

            profile = next(
                item for item in build_script.PROFILES if item.suffix == "+mc1.20.2"
            )
            with patch.object(build_script, "EXTRA", extra), patch.object(
                build_script, "PACK_IMAGE", pack_image
            ):
                build_script.build_modern(profile, artifact)

            overlay = artifact / "format_26_2" / "data"
            self.assertTrue(
                (overlay / "tpa" / "predicate" / "available.json").is_file()
            )
            self.assertFalse(
                (overlay / "tpa" / "function" / "unchanged.mcfunction").exists()
            )
            self.assertTrue((artifact / "format_26_2").is_dir())

    def test_required_overlay_is_generated_without_version_data_directory(self) -> None:
        from scripts import build as build_script

        with tempfile.TemporaryDirectory() as directory:
            extra = Path(directory) / "extra"
            (extra / "data").mkdir(parents=True)
            with patch.object(build_script, "EXTRA", extra):
                overlays = build_script.discover_overlays()

            self.assertEqual([item[0].text for item in overlays], ["26.2"])
            self.assertFalse(overlays[0][1].exists())

    def test_build_language_sync_is_explicit(self) -> None:
        from scripts import build as build_script

        with patch(
            "scripts.lang.sync_lang.synchronize_sources",
            return_value={},
        ) as synchronize_sources:
            with patch(
                "scripts.lang.sync_lang.generate_language_targets",
                return_value=((), ()),
            ):
                build_script.synchronize_languages(check=True)
                synchronize_sources.assert_called_once_with(check=True)

                synchronize_sources.reset_mock()
                build_script.synchronize_languages(check=False)
                synchronize_sources.assert_called_once_with(check=False)


if __name__ == "__main__":
    unittest.main()
