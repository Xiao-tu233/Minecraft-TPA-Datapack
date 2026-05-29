# TPA load function: run when datapack loads

scoreboard objectives remove tpa.variables
scoreboard objectives add tpa.variables dummy
scoreboard objectives add tpa.config dummy
execute unless score #version tpa.config matches 206 run function tpa:initialize

# Load language file
scoreboard players operation #target_lang tpa.variables = #language tpa.config
function tpa:load_lang

tellraw @a ["[§bTPA§r] §e重载中..."]

tellraw @a ["[§bTPA§r] 正在添加46个记分项... (1/6)"]
scoreboard objectives add tpa trigger "TPA菜单/传送请求目标"
scoreboard objectives add back trigger "返回上一位置"
scoreboard objectives add tpaccept trigger "接受请求/自动接受"
scoreboard objectives add tpa.help trigger "帮助"
scoreboard objectives add tpa.tpaccept trigger "接受请求"
scoreboard objectives add tpa.tpaccept_tgl trigger "自动接受"
scoreboard objectives add tpa.tpa trigger "传送请求目标"
scoreboard objectives add tpa.tpahere trigger "传送此处请求目标"
scoreboard objectives add tpa.simple_menu trigger "简易菜单"
scoreboard objectives add tpa.cancel_req trigger "取消请求"
scoreboard objectives add tpa.idfix trigger "ID修复"
scoreboard objectives add tpa.back trigger "返回上一位置"
scoreboard objectives add tpa.ext_menu trigger "展开菜单"
scoreboard objectives add tpa.mute trigger "静音"
scoreboard objectives add tpa.output trigger "输出位置"
scoreboard objectives add tpa.search_id trigger "搜索ID"
scoreboard objectives add tpa.book trigger "传送书"
scoreboard objectives add tpa.pos trigger "传送坐标输入状态"
scoreboard objectives add tpa.pos.x trigger "传送坐标目标X坐标"
scoreboard objectives add tpa.pos.y trigger "传送坐标目标Y坐标"
scoreboard objectives add tpa.pos.z trigger "传送坐标目标Z坐标"
scoreboard objectives add tpa.here trigger "广播位置"
scoreboard objectives add tpa.sethome trigger "设置传送点"
scoreboard objectives add tpa.home trigger "传送传送点"
scoreboard objectives add home trigger "传送传送点"
scoreboard objectives add tpa.removehome trigger "移除传送点"
scoreboard objectives add tpa.language trigger "语言"
scoreboard objectives add tpa.tp_to dummy
scoreboard objectives add tpa.tp_here dummy
scoreboard objectives remove tpa.player_id
scoreboard objectives add tpa.player_id dummy
scoreboard objectives add tpa.uid dummy
scoreboard objectives add tpa.is_online dummy
scoreboard objectives add tpa.spec dummy
scoreboard objectives add tpa.idfix_cd dummy
scoreboard objectives add tpa.search_id.cl dummy
scoreboard objectives add tpa.req_timer dummy
scoreboard objectives add tpa.if_death deathCount
scoreboard objectives add tpa.if_online dummy
scoreboard objectives add tpa.pos.x_temp dummy
scoreboard objectives add tpa.pos.y_temp dummy
scoreboard objectives add tpa.pos.z_temp dummy
scoreboard objectives add tpa.pos_cd dummy
scoreboard objectives add tpa.lang_temp dummy
scoreboard objectives add tpa.warp trigger
# For only 1.20.4-
scoreboard objectives add tpa.available dummy
# For only 1.20.2-
scoreboard objectives add tpa.output_ dummy
scoreboard objectives add tpa.dialog trigger
# scoreboard objectives add tpa.head_gestures dummy
# scoreboard objectives add tpa.yaw dummy
# scoreboard objectives add tpa.pitch dummy
# scoreboard objectives add tpa.yaw.origin dummy
# scoreboard objectives add tpa.pitch.origin dummy
# scoreboard objectives add tpa.first_extreme dummy
# scoreboard objectives add tpa.second_extreme dummy
# scoreboard objectives add tpa.hg.interval_timer dummy
# scoreboard objectives add tpa.hg.sequence_timer dummy
tellraw @a ["[§bTPA§r] 已成功地添加记分项... (2/6)"]
tellraw @a ["[§bTPA§r] 正在重设在线玩家分数... (2/6)"]
scoreboard players set #global_current tpa.player_id 2
execute unless score #global_current tpa.uid = #global_current tpa.uid run scoreboard players set #global_current tpa.uid 2
execute if score #compact_ids tpa.config matches 0 run scoreboard players set @a tpa.player_id 1
scoreboard players set @a tpa.tp_to 0
scoreboard players set @a tpa.tp_here 0
scoreboard players set @a tpa.tpaccept 0
scoreboard players set @a tpa.req_timer 0
scoreboard players set @a tpa.if_death 0
scoreboard players set @a tpa.pos 0
scoreboard players set @a tpa.search_id.ky 0
scoreboard players set @a tpa.search_id.cl 0
tellraw @a ["[§bTPA§r] 已成功重设在线玩家分数... (3/6)"]

tellraw @a ["[§bTPA§r] ", {"text": "正在初始化相关命令存储... (3/6)"}]

tellraw @a ["[§bTPA§r] 已成功初始化相关命令存储... (4/6)"]

tellraw @a ["[§bTPA§r] 正在移除标签... (4/6)"]
tag @a remove not_match
tag @a remove to_modify
tag @a remove id
execute if score #game_version tpa.variables matches 117.. run kill @e[tag=tpa.license_displayer]
tellraw @a ["[§bTPA§r] 已成功移除标签... (5/6)"]

tellraw @a ["[§bTPA§r] 正在初始化变量... (5/6)"]
# constants
scoreboard players set #-1 tpa.variables -1
scoreboard players set #2 tpa.variables 2
scoreboard players set #3 tpa.variables 3
scoreboard players set #4 tpa.variables 4
scoreboard players set #5 tpa.variables 5
scoreboard players set #9 tpa.variables 9
scoreboard players set #14 tpa.variables 14
scoreboard players set #16 tpa.variables 16
scoreboard players set #20 tpa.variables 20
scoreboard players set #100 tpa.variables 100
# Variables initializations
scoreboard players set #commands_not_match tpa.variables 0
scoreboard players set #debug_mode tpa.config 0
execute if score #carpet_fake_player_fix tpa.config matches 0 run tag @a remove tpa.fake_player
tellraw @a ["[§bTPA§r] 已成功初始化变量... (6/6)"]

tellraw @a ["[§bTPA§r] §a数据包重载完成: 1.13 - 1.14.4 完整版 ", {"text": "2.0.6", "hoverEvent":{"action":"show_text","value":"§b这是TPA数据包的版本, 而不是Minecraft版本."}}]

# Show the publish date, with local format
tellraw @a ["[§bTPA§r] ", "目前版本发布于2026年2月1日(UTC+8), 请注意更新"]
tellraw @a ["[§bTPA§r] 欢迎使用TPA数据包! "]
tellraw @a ["[§bTPA§r] Copyright © 2024-2026 Xiao_tu233.    本数据包遵循 GPL-3.0 开源协议, 为开源项目, 但作者不建议将其用于商业化服务器.     点击下方“[协议]”查看协议原文. "]
tellraw @a ["[§bTPA§r] 此数据包由§6Xiao_tu233§r制作. "]
tellraw @a ["[§bTPA§r] ", " ", {"text":"§9Discord","hoverEvent":{"action":"show_text", "value":"https://discord.gg/QgkpxsFahw"},"clickEvent":{"action":"open_url","value":"https://discord.gg/QgkpxsFahw"}}," • ",{"text":"§cYouTube","hoverEvent":{"action":"show_text", "value":"https://www.youtube.com/channel/UCMOgi9XLPgVjLJRV6-YqQmg"},"clickEvent":{"action":"open_url","value":"https://www.youtube.com/channel/UCMOgi9XLPgVjLJRV6-YqQmg"}}," • ",{"text":"§bBilibili","hoverEvent":{"action":"show_text", "value":"https://space.bilibili.com/433412367"},"clickEvent":{"action":"open_url","value":"https://www.bilibili.com/space/433412367"}}," • ",{"text":"§rQQ群","hoverEvent":{"action":"show_text", "value":"点击复制群号: 814709389"},"clickEvent":{"action":"copy_to_clipboard","value":"814709389"}}, " • ", {"text":"§0Github","hoverEvent":{"action":"show_text", "value":"https://github.com/Xiao-tu233/Minecraft-TPA-Datapack"},"clickEvent":{"action":"open_url","value":"https://github.com/Xiao-tu233/Minecraft-TPA-Datapack"}}]
tellraw @a ["[§bTPA§r] ", {"text": "[设置]", "color": "gold", "clickEvent":{"action":"run_command","value":"/function tpa:options"},"hoverEvent":{"action":"show_text","value":{"text": "点击更改数据包配置"}}}," ",{"text": "[帮助]", "color": "gold", "clickEvent":{"action":"run_command","value":"/function tpa:help"},"hoverEvent":{"action":"show_text","value":"点击查看帮助"}}," ",{"text": "[更新]", "color": "gold", "clickEvent":{"action":"run_command","value":"/function tpa:update"},"hoverEvent":{"action":"show_text","value":"点击开始数据包的更新导引"}}," ",{"text": "[协议]", "color": "gold", "clickEvent":{"action":"run_command","value":"/function tpa:license"},"hoverEvent":{"action":"show_text","value":"§b使用 TPA 数据包时请遵循我们在 GitHub 上开源协议. §b同时, 作者§l§n不建议§r§b将本数据包用于§l§n商业用途§r§b的服务器. §b为避免误解, 请您在使用前仔细阅读并理解完整协议内容. "}}]

execute unless score #language tpa.config matches 1.. run tellraw @a ["[§bTPA§r] ", "检测到默认语言未设置, 请点击下方设置TPA数据包的服务器默认语言 | Detected Default language is not set, please click below to set default server language of TPA datapack:  ", {"text": "[§a设置 | Set§r]", "clickEvent": {"action": "run_command", "value": "/function tpa:option_lang_menu"}}]
function tpa:dimension/refresh
tellraw @a[scores={tpa.output_=1..2}] [{"text": "[§6点我打开TPA菜单§r]", "clickEvent": {"action": "run_command", "value": "/trigger tpa"}}]
function tpa:warp/cancel

# Call the tick function if the option is enabled
execute if score #uses_tick_scheduling tpa.config matches 1 run function tpa:tick