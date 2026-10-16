# init players' options
execute unless score @s tpa.tpaccept_toggle = @s tpa.tpaccept_toggle run scoreboard players set @s tpa.tpaccept_toggle 0
execute unless score @s tpa.mute = @s tpa.mute run scoreboard players set @s tpa.mute 0
execute unless score @s tpa.output = @s tpa.output run scoreboard players set @s tpa.output 0
execute unless score @s tpa.selected_language matches 1.. run scoreboard players operation @s tpa.selected_language = #language tpa.config
function tpa:load_lang

scoreboard players set #can_choose tpa.variables 1
execute if score #player_lang tpa.config matches 0 if score #language tpa.config matches 1.. run scoreboard players set #can_choose tpa.variables 0

execute if score #can_choose tpa.variables matches 1 run tellraw @s {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.lang_button",click_event:{action:"run_command",command:"/trigger tpa.language set -1"},hover_event:{action:"show_text",value:{interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.lang_button_hoverevent"}}}

# Use default language 1:chinese if lang is not selected
function tpa:get_name
function tpa:home/clear with storage tpa:tpa temp

scoreboard players operation @s tpa.uid = #global_current tpa.uid
scoreboard players add #global_current tpa.uid 1
execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: ", {storage: "tpa:tpa", nbt: "temp.name", color: "aqua", interpret: true}, " was given with the UID of ", {score: {name: "@s", objective: "tpa.uid"}}]

data modify storage tpa:tpa users append from storage tpa:tpa temp.name