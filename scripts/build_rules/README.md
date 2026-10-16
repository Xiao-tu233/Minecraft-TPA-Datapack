# Build Rules

This package contains automatic, mechanical conversions applied to copied
build outputs. It does not change files under `src/`.

## Adding a version rule

Create a module named `before_<version>.py` for a format change introduced in
that Minecraft version. Its conversion should turn the newer source form into
the form accepted by earlier game versions and expose a function that accepts
the output `data/` directory and returns the number of changed files.

Register the conversion in `RULES` in `__init__.py` with a four-part version
tuple. For example, `before_1_21_5.py` would register `(1, 21, 5, 0)`. Rules
apply only when the output target is older than their `introduced_in` version.
Multiple applicable rules run newest-first, reversing successive format
changes in order. The filename denotes the game version where a new format was
introduced, not the newest version that needs conversion.

Keep each rule idempotent and restrict it to the resources and syntax it owns.
Use structured parsers for JSON/NBT-derived text where possible; do not rewrite
files with broad textual substitutions when a structured conversion is
available.

## Current rules

- `before_1_20_2.py`: removes a trailing backslash, the following newline, and
  the next line's indentation from `.mcfunction` files. This makes continued
  commands readable by versions through 1.20.1.

Version-specific gameplay or data-model changes that cannot be mechanically
derived belong in the corresponding source overlay under `src/extra/`, not in
these rules.
