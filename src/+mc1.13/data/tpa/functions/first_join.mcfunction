# init players' options
execute unless score @s tpa.tpaccept_tgl = @s tpa.tpaccept_tgl run scoreboard players set @s tpa.tpaccept_tgl 0
execute unless score @s tpa.mute = @s tpa.mute run scoreboard players set @s tpa.mute 0
execute unless score @s tpa.req_timer = @s tpa.req_timer run scoreboard players set @s tpa.req_timer 0
execute unless score @s tpa.idfix_cd = @s tpa.idfix_cd run scoreboard players set @s tpa.idfix_cd 0
execute unless score @s tpa.output = @s tpa.output run scoreboard players set @s tpa.output 0
execute unless score @s tpa.lang_temp matches 1.. run scoreboard players operation @s tpa.lang_temp = #language tpa.config
function tpa:load_lang

scoreboard players set #can_choose tpa.variables 1
execute if score #player_lang tpa.config matches 0 if score #language tpa.config matches 1.. run scoreboard players set #can_choose tpa.variables 0

execute if score #can_choose tpa.variables matches 1 run tellraw @s {"text": "[§6点击这里选择语言§r]","clickEvent":{"action":"run_command","value":"/trigger tpa.language set -1"},"hoverEvent":{"action":"show_text","value":"§b点击查看语言菜单"}}

scoreboard players operation @s tpa.uid = #global_current tpa.uid
scoreboard players add #global_current tpa.uid 1
