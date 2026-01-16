
---

# Minecraft-TPA-Datapack

---

[![Minecraft Website](https://img.shields.io/badge/Minecraft-green)](https://www.minecraft.net/)
[![License](https://img.shields.io/github/license/MCDReforged/MCDReforged.svg)](https://github.com/Xiao-tu233/Minecraft-TPA-Datapack/edit/main/LICENSE)

可选依赖: [![Carpet mod](https://img.shields.io/badge/Carpet-Mod-green)](https://modrinth.com/mod/carpet), [![Bookshelf Datapack](https://img.shields.io/badge/Book-Shelf-green)](https://github.com/mcbookshelf/bookshelf)


[English(United States)](https://github.com/Xiao-tu233/Minecraft-TPA-Datapack/blob/main/README.md) - **简体中文(中国大陆)** - [正體中文(臺灣)](https://github.com/Xiao-tu233/Minecraft-TPA-Datapack/blob/main/README_zhtw.md) - [日本語(日本)](https://github.com/Xiao-tu233/Minecraft-TPA-Datapack/blob/main/README_jp.md)


TPA 数据包是一个 Minecraft 数据包，它允许非 OP 玩家轻松互相传送，同时还提供了诸如 Back、Home、Warp、多语言支持等额外功能。

关注或加入我们的社交媒体以获取更多信息或提供建议！

[![Discord](https://img.shields.io/badge/Discord-blue)](https://discord.gg/QgkpxsFahw) · [![YouTube](https://img.shields.io/badge/YouTube-red)](https://www.youtube.com/channel/UCMOgi9XLPgVjLJRV6-YqQmg) · [![Bilibili](https://img.shields.io/badge/Bilibili-aqua)](https://www.bilibili.com/space/433412367) · [![Bilibili](https://img.shields.io/badge/Bilibili-_space-aqua)](https://space.bilibili.com/433412367) · ![QQ 群](https://img.shields.io/badge/QQ-_%E7%BE%A4-white):814709389

## 优势

* 所有选项都可以通过 `/function tpa:options` 命令进行编辑。无需担心因默认设置不当导致的体验问题。
* 安装方式非常简单: 使用数据包。数据包是最容易安装到 Minecraft 中的内容类型，无需任何扩展或加载器。
* 我们也会积极确保与其他数据包/模组/插件/资源包的兼容性。因此，即使遇到可能不是由 TPA 数据包引起的错误，您仍然可以提供完整的上下文并告诉我们如何复现问题。
* 我们提供两个版本供您选择: 完整版 版本和 轻量版 版本。完整版 版本包含我们开发的所有功能，而 轻量版 版本仅包含基本功能，以满足不同需求。

## 工作原理

自 Minecraft 1.13 起，它通过原版界面运行。

## 如何选择下载版本

请使用下表确定您的 Minecraft 版本对应的数据包文件后缀: 
**Minecraft 版本与数据包文件名后缀对应表**

| 游戏版本            |     完整版 |          轻量版 |
| :-------------- | --------: | -------------: |
| 1.13 - 1.14.4   |   +mc1.13 |   轻量版+mc1.13 |
| 1.15 - 1.20.1   |   +mc1.15 |   轻量版+mc1.13 |
| 1.20.2 - 1.20.6 | +mc1.20.2 |   轻量版+mc1.13 |
| 1.21 - 1.21.4   | +mc1.20.2 |   轻量版+mc1.21 |
| 1.21.5 -        | +mc1.20.2 | 轻量版+mc1.21.5 |

轻量版 最新版本: v2.0.6
完整版 最新版本: v2.0.6

1. 检查您当前的游戏版本。
2. 决定使用 完整版 版本还是 轻量版 版本，区别如下: 

   * 轻量版 版本仅包含基础功能: 传送和菜单。
   * 完整版 版本包含我们开发的所有功能，如 Back、Home、Warp、多语言支持（未来可能还有更多）。
3. 前往 *Releases* 页面下载。

示例: 
如果我的 Minecraft 版本是 1.20.1，并且我想使用 完整版 版本，我会选择名为 `TPA_datapack-v2.0.6+mc1.15.zip` 的文件。

## 安装方法

安装方法基本与其他数据包相同，如果您已经了解，可以跳过此段落。

### 在云端服务器上

1. 打开您托管服务器的控制台。
2. 找到并点击标有 *File Manager* 的按钮。
3. 接下来的步骤与本地服务器安装相同。

### 在本地服务器上

1. 找到包含服务器 JAR 文件的服务器文件夹。
2. 如果有 `world` 文件夹，请打开 `./world/datapacks/` 目录。
3. 如果没有，或者执行第 4 步后无效，请检查 `server.properties -> level-name` 找到正确的存档文件夹。
4. 将数据包文件放入 `datapacks` 文件夹中。
5. 进入服务器，执行 `/reload`，然后执行 `/datapack list` 确认数据包已被识别。

### 在单人世界中

1. 退出当前世界。
2. 在世界选择菜单中选择目标世界。
3. 点击左下角的 `编辑` 按钮。
4. 点击 `打开世界文件夹` 按钮，如果有该按钮，则跳过第 8 步。
5. 返回世界选择菜单，并记住游戏内标题下的灰色文本。
6. 进入主菜单，然后依次点击 `选项... -> 资源包... -> 打开资源包文件夹...`
7. 然后切换到上级文件夹（应该是 `.minecraft`），进入 `saves` 文件夹，再进入之前记住的灰色文本对应的文件夹（目录类似 `../saves/(你的世界)/datapacks`）。
8. 进入 `datapacks` 文件夹，将数据包文件放入其中。
9. 进入世界，执行 `/datapack list` 确认数据包已被识别。

### 在创建的新世界中

1. 点击 `更多 -> 数据包 -> 打开资源包文件夹`。
2. 将数据包文件放入其中。
3. 创建世界。
4. 执行 `/datapack list` 确认数据包已被识别。

## 使用方法

请参考 Wiki 获取详细用法: [wiki](https://github.com/Xiao-tu233/Minecraft-TPA-Datapack/wiki)

## 结语

感谢您使用 TPA 数据包！
最新版本: 完整版 v2.0.6，轻量版 v2.0.6
最后编辑时间: 2025 年 11 月 20 日
翻译: ChatGPT Requested by Xiao_tu233
---

