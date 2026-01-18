---

# Minecraft-TPA-Datapack

---

[![Minecraft Website](https://img.shields.io/badge/Minecraft-green)](https://www.minecraft.net/)
[![License](https://img.shields.io/github/license/MCDReforged/MCDReforged.svg)](https://github.com/Xiao-tu233/Minecraft-TPA-Datapack/edit/main/LICENSE)

可選依賴: [![Carpet mod](https://img.shields.io/badge/Carpet-Mod-green)](https://modrinth.com/mod/carpet), [![Bookshelf Datapack](https://img.shields.io/badge/Book-Shelf-green)](https://github.com/mcbookshelf/bookshelf)


[English(United States)](https://github.com/Xiao-tu233/Minecraft-TPA-Datapack/blob/main/README.md) · [简体中文(中国大陆)](https://github.com/Xiao-tu233/Minecraft-TPA-Datapack/blob/main/README_zhcn.md) · [正體中文(臺灣)](https://github.com/Xiao-tu233/Minecraft-TPA-Datapack/blob/main/README_zhtw.md) · [日本語(日本)](https://github.com/Xiao-tu233/Minecraft-TPA-Datapack/blob/main/README_jp.md) · [更多語言](https://github.com/Xiao-tu233/Minecraft-TPA-Datapack/blob/main/languages.md) 


TPA 資料包是一個 Minecraft 資料包，讓非 OP 玩家可以輕鬆互相傳送，同時提供額外功能，例如 Back、Home、Warp、多語言支援等。

歡迎關注或加入我哋嘅社交平台，以獲取更多資訊或者提供建議！

[![Discord](https://img.shields.io/badge/Discord-blue)](https://discord.gg/QgkpxsFahw) · [![YouTube](https://img.shields.io/badge/YouTube-red)](https://www.youtube.com/channel/UCMOgi9XLPgVjLJRV6-YqQmg) · [![Bilibili](https://img.shields.io/badge/Bilibili-aqua)](https://www.bilibili.com/space/433412367) · [![Bilibili](https://img.shields.io/badge/Bilibili-_space-aqua)](https://space.bilibili.com/433412367) · ![QQ 群](https://img.shields.io/badge/QQ-_%E7%BE%A4-white):814709389

## 優點

* 所有設定都可以透過 `/function tpa:options` 指令編輯，無需擔心因預設設定唔啱而影響遊戲體驗。
* 安裝方式極為簡單：使用資料包。資料包係 Minecraft 最容易安裝嘅內容類型，唔需要任何額外模組或載入器。
* 我哋會積極確保同其他資料包／模組／插件／資源包嘅相容性。就算你遇到嘅問題未必由 TPA 資料包引起，你仍然可以提供完整資訊，我哋會盡力協助重現同處理。
* 我哋提供兩個版本畀你選擇：**完整版**同**輕量版**。完整版包含所有功能，而輕量版只包含基礎功能，以配合唔同玩家需要。

## 運作原理

自 Minecraft 1.13 起，透過原版介面運作。

## 如何選擇下載版本

請參考下表，確認你嘅 Minecraft 版本對應嘅資料包檔名後綴：  
**Minecraft 版本與資料包檔名後綴對照表**

| 遊戲版本 | 完整版 | 輕量版 |
| :-- | --: | --: |
| 1.13 - 1.14.4 | +mc1.13 | light+mc1.13 |
| 1.15 - 1.20.1 | +mc1.15 | light+mc1.13 |
| 1.20.2 - 1.20.6 | +mc1.20.2 | light+mc1.13 |
| 1.21 - 1.21.4 | +mc1.20.2 | light+mc1.21 |
| 1.21.5 - | +mc1.20.2 | light+mc1.21.5 |

輕量版最新版本：v2.0.6  
完整版最新版本：v2.0.6  

1. 檢查你目前嘅遊戲版本。  
2. 選擇使用完整版定輕量版，分別如下：  

   * 輕量版只包含基礎功能：傳送同選單。  
   * 完整版包含我哋開發嘅所有功能，例如 Back、Home、Warp、多語言支援（未來可能加入更多）。  
3. 前往 *Releases* 頁面下載。

例子：  
如果我嘅 Minecraft 版本係 1.20.1，而且想用完整版，我會下載名為 `TPA_datapack-v2.0.6+mc1.15.zip` 嘅檔案。

## 安裝方法

安裝方式同一般資料包大致相同，如果你已經識點裝，可以直接跳過。

### 於雲端伺服器

1. 開啟你託管伺服器嘅控制台。  
2. 搵到並點擊 *File Manager*（檔案管理）。  
3. 之後步驟同「本地伺服器」一樣。

### 於本地伺服器

1. 搵到包含伺服器 JAR 檔案嘅資料夾。  
2. 如果見到 `world` 資料夾，請進入 `./world/datapacks/`。  
3. 如果冇或者第 4 步無效，請檢查 `server.properties -> level-name` 以確認正確存檔資料夾。  
4. 將資料包檔案放入 `datapacks` 資料夾。  
5. 進入伺服器，輸入 `/reload`，再用 `/datapack list` 確認已成功載入。

### 於單人世界

1. 退出當前世界。  
2. 於世界選單選擇目標世界。  
3. 點擊左下角嘅「編輯」。  
4. 點擊「開啟世界資料夾」，如果有此按鈕可跳至第 8 步。  
5. 返回選單，記低世界名稱下方嘅灰色文字。  
6. 進入主選單 → `選項... -> 資源包... -> 開啟資源包資料夾...`  
7. 返回上一層（通常係 `.minecraft`），進入 `saves`，再進入剛才記住嘅世界資料夾（路徑類似 `../saves/(你的世界)/datapacks`）。  
8. 進入 `datapacks`，放入資料包檔案。  
9. 進入世界，使用 `/datapack list` 確認。

### 於新建世界

1. 點擊 `更多 -> 資料包 -> 開啟資源包資料夾`。  
2. 放入資料包檔案。  
3. 建立世界。  
4. 使用 `/datapack list` 確認。

## 使用方法

詳細用法請參考 Wiki：[wiki](https://github.com/Xiao-tu233/Minecraft-TPA-Datapack/wiki)

## 結語

多謝你使用 TPA 資料包！  
最新版本：完整版 v2.0.6，輕量版 v2.0.6  
最後編輯時間：2026 年 1 月 16 日  
翻譯：ChatGPT Requested by Xiao_tu233  
---