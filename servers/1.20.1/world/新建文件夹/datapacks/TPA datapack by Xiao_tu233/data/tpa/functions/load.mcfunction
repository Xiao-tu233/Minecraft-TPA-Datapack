#> tpa:load.mcfunction
execute if score #debug_mode tpa_config matches 1 run tellraw @a "[§bTPA§r] §6 Debug: §rNow executing: §atpa:load"
tellraw @a ["[§bTPA§r] §eReloading..."]
tellraw @a ["[§bTPA§r] Adding all scoreboard objectives... (0/2)"]
#the objectives
scoreboard objectives add help trigger
scoreboard objectives add tpaccept trigger
scoreboard objectives add accept dummy
scoreboard objectives add tpaccept_toggle dummy
scoreboard objectives add tpa trigger
scoreboard objectives add tp_to dummy
scoreboard objectives add cancel_req trigger
scoreboard objectives add player_id dummy
scoreboard objectives add spec dummy
scoreboard objectives add idfix trigger
scoreboard objectives add back trigger
scoreboard objectives add language trigger
scoreboard objectives add lang_menu trigger
scoreboard objectives add tpa_config dummy
scoreboard objectives add tpa_variables dummy
scoreboard objectives add tpamenu trigger
scoreboard objectives add to_mute trigger
scoreboard objectives add mute dummy
scoreboard objectives add search_id trigger
scoreboard objectives add tpahere trigger
scoreboard objectives add tp_here dummy
scoreboard objectives add timer dummy
scoreboard objectives add if_death deathCount
tellraw @a ["[§bTPA§r] Added successfully. (1/2)"]
tellraw @a ["[§bTPA§r] Initializing... (1/2)"]
scoreboard players set #global_current player_id 1
scoreboard players set @a player_id 0
scoreboard players set @a tp_to 0
scoreboard players set @a accept 0
scoreboard players set @a timer 0
scoreboard players set @a if_death 0
scoreboard players set #i tpa_variables 0
scoreboard players set #j tpa_variables 0
scoreboard players set #index tpa_variables 0
scoreboard players set #back_length tpa_variables 0
scoreboard players set #player_online tpa_variables 0
scoreboard players set #player_online_to_compare tpa_variables 0
# Default cfg:
# debugMode(debug_mode): OFF, ifStopSpectatorPlayerFromBeingTeleported(tp_spec): ON, ifRemoveOfflinePlayersId(remove_offline): OFF, 
# ifAllowPlayerToDoBack(back): ON, #time_out(tpRequestTimeOutTime): 5 min * 60 s/min * 20 tick/s = 6e3(-1 for infinity). 
execute unless score #debug_mode tpa_config matches 1 run scoreboard players set #debug_mode tpa_config 0
execute unless score #tp_spec tpa_config matches 0 run scoreboard players set #tp_spec tpa_config 1
execute unless score #remove_offline tpa_config matches 1 run scoreboard players set #remove_offline tpa_config 0
execute unless score #back tpa_config matches 0 run scoreboard players set #back tpa_config 1
execute unless score #time_out tpa_config = #time_out tpa_config run scoreboard players set #time_out tpa_config 6000
tag @a remove spec
tag @a remove to_except_being_selected
tag @a remove to_modify
tag @a remove tp_reqer
tag @a remove destin
tag @a remove searching_id
tellraw @a ["[§bTPA§r] Initialized successfully. (2/2)"]
tellraw @a ["[§bTPA§r] §aDatapack reloaded succesfully!"]
tellraw @a ["[§bTPA§r] Welcome to use TPA datapack!"]
tellraw @a "[§bTPA§r] Copyright © Xiao_tu233 2024 All rights reserved. No commercial use allowed."
tellraw @a ["[§bTPA§r] This datapack is made by §6Xiao_tu233"]
tellraw @a ["[§bTPA§r]  ",{"text":"§9Discord","hoverEvent":{"action":"show_text","value":"https://discord.gg/QgkpxsFahw"},"clickEvent":{"action":"open_url","value":"https://discord.gg/QgkpxsFahw"}}," • ",{"text":"§cYouTube","hoverEvent":{"action":"show_text","value":"https://www.youtube.com/channel/UCMOgi9XLPgVjLJRV6-YqQmg"},"clickEvent":{"action":"open_url","value":"https://www.youtube.com/channel/UCMOgi9XLPgVjLJRV6-YqQmg"}}," • ",{"text":"§bBilibili","hoverEvent":{"action":"show_text","value":"https://space.bilibili.com/433412367"},"clickEvent":{"action":"open_url","value":"https://www.bilibili.com/space/433412367"}}," • ",{"text":"§rQQ群","hoverEvent":{"action":"show_text","value":"点击复制群号: 814709389"},"clickEvent":{"action":"copy_to_clipboard","value":"814709389"}}]
tellraw @a ["[§bTPA§r] ",{"text":"§6[Settings]","clickEvent":{"action":"run_command","value":"/function tpa:options"},"hoverEvent":{"action":"show_text","value":"Click to modify datapack options "}}," ",{"text":"§6[Help]","clickEvent":{"action":"run_command","value":"/trigger help"},"hoverEvent":{"action":"show_text","value":"Click to show help."}}]

#! 超级大饼:
#22. tpamenu in written book including available tp player and also tell-menu
#23. tp certain position with xyz,yaw,pitch,Dim and also on-and-off
#24. sethome

# for-loop format:
# #> parent function:
# scoreboard players operation #i tpa_variables = <loop time variable>
# scoreboard players add #i tpa_variables 1
# execute if score #debug_mode tpa_config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §rLoop starts, times: ",{"score":{"name":"#i","objective":"tpa_variables"}}]
# function <main loop function>
# execute if score #debug_mode tpa_config matches 1 if score #i tpa_variables matches 0 run tellraw @a ["[§bTPA§r] §6 Debug: §rLoop ends."]

# #> main loop function:
# <Argument>
# # i--
# scoreboard players remove #i tpa_variables 1
# execute if score #debug_mode tpa_config matches 1 if score #i tpa_variables matches 1.. run tellraw @a ["[§bTPA§r] §6 Debug: §rRemain loop times: §a",{"score":{"name":"#i","objective":"tpa_variables"}}]
# # i>0
# execute if score #i tpa_variables matches 1.. run function <THIS>

# For future video
# function now:
# 1.teleportation between unlimited amount of player
# 2.id fix
# 3.different languages supported
# 4.search id
# 5.always-accept
# 6.mute datapack
# 7.back
# 8. tpahere
# 9.modifiable configs
# 10. debug mode
# 11. ban spec being tp-ed
# 12. remove offline players
# 13. if ban back
# 14. customable language in function file
# 15. req time out