
---

# Minecraft-TPA-Datapack

---

[![Minecraft Website](https://img.shields.io/badge/Minecraft-green)](https://www.minecraft.net/)
[![License](https://img.shields.io/github/license/MCDReforged/MCDReforged.svg)](https://github.com/Xiao-tu233/Minecraft-TPA-Datapack/edit/main/LICENSE)

可選依賴: [![Carpet mod](https://img.shields.io/badge/Carpet-Mod-green)](https://modrinth.com/mod/carpet), [![Bookshelf Datapack](https://img.shields.io/badge/Book-Shelf-green)](https://github.com/mcbookshelf/bookshelf)


[English(United States)](https://github.com/Xiao-tu233/Minecraft-TPA-Datapack/blob/main/README.md) · [简体中文(中国大陆)](https://github.com/Xiao-tu233/Minecraft-TPA-Datapack/blob/main/README_zhcn.md) · **正體中文(臺灣)** · [日本語(日本)](https://github.com/Xiao-tu233/Minecraft-TPA-Datapack/blob/main/README_jp.md) · [更多語言](https://github.com/Xiao-tu233/Minecraft-TPA-Datapack/blob/main/languages.md) 


TPA 資料包是一個 Minecraft 資料包，允許非 OP 玩家輕鬆互相傳送，同時提供額外功能，如 Back、Home、Warp、多語言支援等。

關注或加入我們的社群，以獲取更多資訊或提供建議！

[![Discord](https://img.shields.io/badge/Discord-blue)](https://discord.gg/QgkpxsFahw) · [![YouTube](https://img.shields.io/badge/YouTube-red)](https://www.youtube.com/channel/UCMOgi9XLPgVjLJRV6-YqQmg) · [![Bilibili](https://img.shields.io/badge/Bilibili-aqua)](https://www.bilibili.com/space/433412367) · [![Bilibili](https://img.shields.io/badge/Bilibili-_space-aqua)](https://space.bilibili.com/433412367) · ![QQ 群](https://img.shields.io/badge/QQ-_%E7%BE%A4-white):814709389

## 優勢

* 所有選項都可以透過 `/function tpa:options` 指令進行編輯。無需擔心因預設設定不當導致的使用體驗問題。
* 安裝方式非常簡單：使用資料包。資料包是最容易安裝到 Minecraft 的內容類型，無需任何擴充或載入器。
* 我們也會積極確保與其他資料包/模組/外掛/資源包的相容性。因此，即使遇到可能不是由 TPA 資料包引起的錯誤，您仍然可以提供完整上下文，並告訴我們如何重現問題。
* 我們提供兩個版本供您選擇：**完整版**與**輕量版**。完整版包含我們開發的所有功能，而輕量版僅包含基本功能，以滿足不同需求。

## 工作原理

自 Minecraft 1.13 起，它透過原版介面運作。

## 如何選擇下載版本

請使用下表確認您的 Minecraft 版本對應的資料包檔名後綴：
**Minecraft 版本與資料包檔名後綴對照表**

| 遊戲版本            |       完整版 |            輕量版 |
| :-------------- | --------: | -------------: |
| 1.13 - 1.14.4   |   +mc1.13 |   light+mc1.13 |
| 1.15 - 1.20.1   |   +mc1.15 |   light+mc1.13 |
| 1.20.2 - 1.20.6 | +mc1.20.2 |   light+mc1.13 |
| 1.21 - 1.21.4   | +mc1.20.2 |   light+mc1.21 |
| 1.21.5 -        | +mc1.20.2 | light+mc1.21.5 |

輕量版最新版本：v2.0.6
完整版最新版本：v2.0.6

1. 檢查您目前的遊戲版本。
2. 決定使用完整版或輕量版，差異如下：

   * 輕量版僅包含基本功能：傳送和選單。
   * 完整版包含所有開發功能，如 Back、Home、Warp、多語言支援（未來可能還會增加更多）。
3. 前往 *Releases* 頁面下載。

範例：
如果我的 Minecraft 版本是 1.20.1，並且我想使用完整版，我會選擇名為 `TPA_datapack-v2.0.6+mc1.15.zip` 的檔案。

## 安裝方法

安裝方式與其他資料包基本相同，如果您已經了解，可以跳過此段落。

### 在雲端伺服器上

1. 開啟您托管伺服器的控制台。
2. 找到並點擊標示為 *File Manager* 的按鈕。
3. 接下來的步驟與本地伺服器安裝相同。

### 在本地伺服器上

1. 找到包含伺服器 JAR 檔案的伺服器資料夾。
2. 如果有 `world` 資料夾，請打開 `./world/datapacks/` 目錄。
3. 如果沒有，或第 4 步無效，請檢查 `server.properties -> level-name`，找到正確的存檔資料夾。
4. 將資料包檔案放入 `datapacks` 資料夾中。
5. 進入伺服器，執行 `/reload`，然後執行 `/datapack list` 確認資料包已被識別。

### 在單人世界中

1. 退出當前世界。
2. 在世界選單中選擇目標世界。
3. 點擊左下角的 `編輯` 按鈕。
4. 點擊 `開啟世界資料夾` 按鈕，如果有此按鈕，則跳過第 8 步。
5. 返回世界選單，並記住遊戲內標題下方的灰色文字。
6. 進入主選單，依序點擊 `選項... -> 資源包... -> 開啟資源包資料夾...`
7. 然後切換到上層資料夾（應該是 `.minecraft`），進入 `saves` 資料夾，再進入剛記住的灰色文字對應的資料夾（路徑類似 `../saves/(你的世界)/datapacks`）。
8. 進入 `datapacks` 資料夾，將資料包檔案放入其中。
9. 進入世界，執行 `/datapack list` 確認資料包已被識別。

### 在建立的新世界中

1. 點擊 `更多 -> 資料包 -> 開啟資源包資料夾`。
2. 將資料包檔案放入其中。
3. 建立世界。
4. 執行 `/datapack list` 確認資料包已被識別。

## 使用方法

請參考 Wiki 取得詳細用法：[wiki](https://github.com/Xiao-tu233/Minecraft-TPA-Datapack/wiki)

## 結語

感謝您使用 TPA 資料包！
最新版本：完整版 v2.0.6，輕量版 v2.0.6
最後編輯時間：2025 年(民國 114年) 11 月 11 日
翻譯：ChatGPT Requested by Xiao_tu233
---
