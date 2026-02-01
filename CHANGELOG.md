## 2.0.6

This is a major update focusing on **codebase refactoring, stability improvements, and feature completeness**.

### ⚠️ Important Notes
- This version introduces significant internal changes.
- Server owners are recommended to **review options after updating**.

---

### 🧱 Major Changes
- Reworked the internal code structure for better maintainability.
- Add option of "Use /schedule command to call the Tick function" as an alternative option in case that tick function is not working
- Switched from player tags to **UID-based identification**.
- Reduced storage pollution and optimized data initialization logic.
- Replaced long target selectors with predicates.
- Advanced technical options are now hidden by default unless debug mode is enabled.

---

### ✨ New Features
- Added **Public Warp System**, supporting:
  - Custom names and descriptions
  - Dimension awareness
  - Warp list ordering (move up / down)
  - Custom dimension support
- Added Stricter TPA book detection:
  - Import the module raycast from datapack of bookshelf as an optional dependency for this feature
  - Detects placement into containers (including Ender Chests)
  - Detects dropped items on player death
  - Supports re-acquiring from offhand
- Improved language system:
  - Update & uninstall process now supports localization
  - Standardized terminology for Chinese-like languages
- Added contextual buttons to guide users when features are disabled.

---

### ⚡ Improvements
- Fixed home menu may not show existing homes (1.21.6+).
- Improved menu usability with automatic reopening after edits.
- Added Quick Action of Dialog with key **G** supporting for opening the TPA menu.
- Default output mode is now `chatbar` + `actionbar`.
- Added datapack version and release time (UTC) display.
- Improved license reading UI.
- Improved teleport behavior on Minecraft 1.15.

---

### 🐛 Fixes
- Fixed an issue where players could send TPA requests to themselves.
- Fixed incorrect position broadcast color in the End dimension.
- Improved Carpet fake player detection and stability.
- Fixed ID values growing indefinitely and added a new hybrid ID mode.
- Server console now returns clear warnings when invoking certain functions incorrectly.
- Ensured timer frequency defaults to 20 ticks when misconfigured.

