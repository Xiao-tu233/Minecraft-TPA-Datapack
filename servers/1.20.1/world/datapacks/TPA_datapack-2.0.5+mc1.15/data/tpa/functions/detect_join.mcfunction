# Set default language to server language if lang is set before player first join
execute unless score @s tpa.lang_temp matches 1.. run scoreboard players operation @s tpa.lang_temp = #language tpa.config
function tpa:load_lang
execute unless score #language tpa.config matches 1.. run tellraw @s [{"storage": "tpa:tpa", "nbt": "temp.lang.header"}, "检测到默认语言未设置, 请点击下方设置TPA数据包的服务器默认语言 | Detected Default language is not set, please click below to set default server language of TPA datapack:  ", {"text": "[§a设置 | Set§r]", "clickEvent": {"action": "run_command", "value": "/trigger tpa.language set -1"}}]

scoreboard players set @s tpa.tp_to 0
scoreboard players set @s tpa.tp_here 0
scoreboard players set @s tpa.tpaccept 0
scoreboard players set @s tpa.req_timer 0
scoreboard players set @s tpa.if_death 0
scoreboard players set @s tpa.pos 0
scoreboard players set @s tpa.pos.x 0
scoreboard players set @s tpa.pos.y 0
scoreboard players set @s tpa.pos.z 0
scoreboard players reset @s tpa.pos.x_temp
scoreboard players reset @s tpa.pos.y_temp
scoreboard players reset @s tpa.pos.z_temp

scoreboard players set @s tpa.is_online 1
execute as @s[tag=!TPA_user] run function tpa:first_join

tellraw @s[scores={tpa.output=1..2}] [{"storage":"tpa:tpa", "nbt":"temp.lang.reqer_first_join", "clickEvent": {"action": "run_command", "value": "/trigger tpa"}}]
