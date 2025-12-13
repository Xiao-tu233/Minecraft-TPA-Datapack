scoreboard players set #is_teleport_executing tpa.variables 0
scoreboard players set #if_accuate_tp tpa.variables 0
execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: A teleport process has been completed: §r", {"selector": "@s"}, " -> ", {"storage": "tpa:tpa", "nbt": "temp.teleport.Pos[0]"}, " ", {"storage": "tpa:tpa", "nbt": "temp.teleport.Pos[1]"}, " ", {"storage": "tpa:tpa", "nbt": "temp.teleport.Pos[2]"}]
kill @e[nbt={Item:{tag:{isTeleportAnchor: 1b}}}]
tag @a remove teleport