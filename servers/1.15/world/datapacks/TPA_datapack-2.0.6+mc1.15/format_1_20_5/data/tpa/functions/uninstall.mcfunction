#> tpa:uninstall.mcfunction
tellraw @a ["[§bTPA§r] 正在卸载... (0/2)"]

tellraw @a ["[§bTPA§r] 移除所有记分项.. (0/2)"]
#remove all objectives
scoreboard objectives remove tpa
scoreboard objectives remove back
scoreboard objectives remove tpaccept
scoreboard objectives remove tpa.help
scoreboard objectives remove tpa.tpaccept
scoreboard objectives remove tpa.tpaccept_toggle
scoreboard objectives remove tpa.tpa
scoreboard objectives remove tpa.tp_to
scoreboard objectives remove tpa.tpahere
scoreboard objectives remove tpa.tp_here
scoreboard objectives remove tpa.cancel_req
scoreboard objectives remove tpa.player_id
scoreboard objectives remove tpa.player_id_temp
scoreboard objectives remove tpa.is_online
scoreboard objectives remove tpa.spec
scoreboard objectives remove tpa.idfix
scoreboard objectives remove tpa.idfix_cd
scoreboard objectives remove tpa.back
scoreboard objectives remove tpa.config
scoreboard objectives remove tpa.variables
scoreboard objectives remove tpa.extended_menu
scoreboard objectives remove tpa.mute
scoreboard objectives remove tpa.search_id
scoreboard objectives remove tpa.req_timer
scoreboard objectives remove tpa.if_death
scoreboard objectives remove tpa.if_online
scoreboard objectives remove tpa.book
scoreboard objectives remove tpa.pos
scoreboard objectives remove tpa.pos.x
scoreboard objectives remove tpa.pos.y
scoreboard objectives remove tpa.pos.z
scoreboard objectives remove tpa.pos.x_temp
scoreboard objectives remove tpa.pos.y_temp
scoreboard objectives remove tpa.pos.z_temp
scoreboard objectives remove tpa.pos_cd
scoreboard objectives remove tpa.here
scoreboard objectives remove tpa.sethome
scoreboard objectives remove tpa.home
scoreboard objectives remove home
scoreboard objectives remove tpa.removehome
scoreboard objectives remove tpa.output
scoreboard objectives remove tpa.simple_menu
scoreboard objectives remove tpa.language
scoreboard objectives remove tpa.lang_temp
tellraw @a ["[§bTPA§r] 成功移除. (1/2)"]
tellraw @a ["[§bTPA§r] 正在移除所有标签... (1/2)"]
tag @a remove TPA_user
tag @a remove to_except_being_selected
tag @a remove to_modify
tag @a remove tp_reqer
tag @a remove searching_id
tag @a remove tpa_book
tag @a remove have_placeholder
data remove storage tpa:tpa back
data remove storage tpa:tpa extended_menu
data remove storage tpa:tpa search_id
data remove storage tpa:tpa book
data remove storage tpa:tpa pos
data remove storage tpa:tpa temp
data remove storage tpa:tpa home
tellraw @a ["[§bTPA§r] 成功移除. (2/2)"]
function tpa:update_disable
tellraw @a ["[§bTPA§r] §a成功卸载. 使用 ", {"text":"§n/datapack enable \"file/TPA_datapack-2.0.5+mc1.20.2\"","clickEvent": {"action": "run_command","value": "/datapack enable \"file/TPA_datapack-2.0.5+mc1.20.2\""},"hoverEvent": {"action": "show_text","value": "点击运行命令"}},"来再次启用."]