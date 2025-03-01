# Minecraft-TPA-Datapack
--------
[![Minecraft Website](https://img.shields.io/badge/Minecraft-green)](https://www.minecraft.net/)
[![License](https://img.shields.io/github/license/MCDReforged/MCDReforged.svg)](https://github.com/Xiao-tu233/Minecraft-TPA-Datapack/edit/main/LICENSE)

软依赖: [![Carpet mod](https://img.shields.io/badge/Carpet-Mod-green)](https://modrinth.com/mod/carpet)

[English](https://github.com/Xiao-tu233/Minecraft-TPA-Datapack/blob/main/README.md) | **简体中文** | [繁體中文](https://github.com/Xiao-tu233/Minecraft-TPA-Datapack/blob/main/README_zhtw.md)

TPA数据包是一个Minecraft数据包，允许玩家在没有OP权限的情况下相互传送. 与其他具有这些功能的mods/插件相比，这个数据包支持许多不同的语言，并且可以简单的通过/function tpa:options来调整设置，几乎所有功能都可以禁用. 我们也愿意听取用户提供的每一条建议，希望您喜欢这个数据包。

加入或关注我们的社交媒体来获取更多信息或提供一些鬼点子！

[![Discord](https://img.shields.io/badge/Discord-blue)](https://discord.gg/QgkpxsFahw) | [![YouTube](https://img.shields.io/badge/YouTube-red)](https://www.youtube.com/channel/UCMOgi9XLPgVjLJRV6-YqQmg) | [![Bilibili](https://img.shields.io/badge/Bilibili-aqua)]([https://www.bilibili.com/space/433412367](https://space.bilibili.com/433412367)) | [![Bilibili](https://img.shields.io/badge/Bilibili-_space-aqua)](https://space.bilibili.com/433412367) | ![QQ group](https://img.shields.io/badge/QQ-_%E7%BE%A4-white):814709389

## 优点

- 它正在服务器上运行。它根本不需要修改服务器，这会让一切保持原样. 
- 多平台/服务器兼容性。支持Linux/Windows上的Vanilla, Paper, BungeeCord等. 

## 咋工作的?

凭借1.13以来内置的数据包，我们通过编写一个包含函数文件的数据包来实现该功能. 

## 我该挑哪个下啊?

1. 确认你的Minecraft游戏版本, 并选择相对应的版本. 
2. 选择轻量版和完整版:
   相比完整版, 轻量版支持比较基础的功能 效果就好像是两个好友之间联机时使用/tp指令， 请求一发就会执行传送.
   而完整版则支持比如返回上一位置, 它的效果可以参考某些插件里的/back功能

## 咋安装啊?

1. 根据你的需要下载数据包文件, 如果你不知道下哪个请看上面.
2. 解压数据包文件
3. 把数据包放到文件夹里. (路径: 服务器是"/world/datapacks/" , 局域网联机是".minecraft/saves/(Your world name)/datapacks")
4. 在游戏里/reload

## 咋用啊?

更多信息: [wiki](https://github.com/Xiao-tu233/Minecraft-TPA-Datapack/wiki)

## 功能

1. 使用 /trigger tpa 来发送你的传送请求和设置选项
2. 在tpa界面中调整back, 自动接受, 语言和ID修复. (仅extra版)
3. 对于操作员(OP), 使用 /function tpa:options 来更改配置. (仅extra版)
4. 如果你遇到两个相同玩家拥有同一id的问题,你可以尝试id修复, 此修复会重置所有玩家的id. 
5. 如果你想知道某人的数据包id但你只知道他的游戏id, 在tpa菜单中使用寻找id. (仅游戏版本>=1.20.2的extra版)
6. 如果你想返回你上次传送的位置, 使用/trigger back (仅游戏版本>=1.20.2的extra版)
7. 如果你觉得数据包音效有点烦, 你可以在tpa菜单里静音数据包 (仅extra版)
8. 点击下方的"...展开"来查看更多玩家的id. (仅游戏版本>=1.20.2的extra版)
9. 如果你想要某个人传送到你这里, 使用/trigger tpahere (仅extra版)
10. 如果你使用的是数据包不支持的语言，您可以在langtell文件夹中对其进行修改。其实啊，为了避免数据包使用者的这么巨大的工作量，我们计划为它制作一个插件，以确保每个人都可以用他们的语言使用数据包！ (仅extra版)

## 结尾

非常感谢您使用由Xiao_tu233制作的TPA 数据包!
最新版本: v2.0.2 extra version, v2.0.1 light version 
上次编辑: 2025/3/1
