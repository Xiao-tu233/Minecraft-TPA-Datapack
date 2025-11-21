#> tpa:uninstall.mcfunction

tellraw @a ["[§bTPA§r] Uninstalling... (0/2)"]

tellraw @a ["[§bTPA§r] Removing all scoreboard objectives... (0/2)"]
#remove all objectives
scoreboard objectives remove help
scoreboard objectives remove tpaccept
scoreboard objectives remove accept
scoreboard objectives remove tpaccept_toggle
scoreboard objectives remove tpa
scoreboard objectives remove tp_to
scoreboard objectives remove cancel_req
scoreboard objectives remove player_id
scoreboard objectives remove spec
scoreboard objectives remove idfix
scoreboard objectives remove back
scoreboard objectives remove language
scoreboard objectives remove lang_menu
scoreboard objectives remove tpa_config
scoreboard objectives remove tpa_variables
scoreboard objectives remove tpamenu
scoreboard objectives remove to_mute
scoreboard objectives remove search_id
scoreboard objectives remove mute
scoreboard objectives remove tpahere
scoreboard objectives remove tp_here
scoreboard objectives remove timer
scoreboard objectives remove if_death
tellraw @a ["[§bTPA§r] Removed successfully. (1/2)"]
tellraw @a ["[§bTPA§r] Removing all tags... (1/2)"]
tag @a remove spec
tag @a remove to_except_being_selected
tag @a remove to_modify
tag @a remove tp_reqer
tag @a remove destin
tag @a remove self
tag @a remove searching_id
tellraw @a ["[§bTPA§r] Removed successfully. (2/2)"]

datapack disable "file/TPA datapack by Xiao_tu233.zip"
datapack disable "file/TPA datapack by Xiao_tu233"
tellraw @a ["[§bTPA§r] §eUninstall successfully.\n Use /datapack enable \"file/TPA datapack by Xiao_tu233.zip\" to enable again."]