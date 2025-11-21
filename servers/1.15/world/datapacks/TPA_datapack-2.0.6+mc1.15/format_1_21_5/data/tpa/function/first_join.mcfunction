# init players' options
execute unless score @s tpa.tpaccept_toggle = @s tpa.tpaccept_toggle run scoreboard players set @s tpa.tpaccept_toggle 0
execute unless score @s tpa.mute = @s tpa.mute run scoreboard players set @s tpa.mute 0
execute unless score @s tpa.req_timer = @s tpa.req_timer run scoreboard players set @s tpa.req_timer 0
execute unless score @s tpa.idfix_cd = @s tpa.idfix_cd run scoreboard players set @s tpa.idfix_cd 0
scoreboard players set @s tpa.output 1
execute unless score @s tpa.lang_temp matches 1.. run scoreboard players operation @s tpa.lang_temp = #language tpa.config
function tpa:load_lang

scoreboard players set #can_choose tpa.variables 1
execute if score #player_lang tpa.config matches 0 if score #language tpa.config matches 1.. run scoreboard players set #can_choose tpa.variables 0

execute if score #can_choose tpa.variables matches 1 run tellraw @s {storage: "tpa:tpa",nbt: "temp.lang.lang_button",click_event:{action:"run_command", command:"/trigger tpa.language set -1"},hover_event:{"action":"show_text","value":{storage: "tpa:tpa", nbt: "temp.lang.lang_button_hoverevent"}}}

# Use default language 1:chinese if lang is not selected
function tpa:get_id
function tpa:home/clear with storage tpa:tpa temp
tag @s add TPA_user