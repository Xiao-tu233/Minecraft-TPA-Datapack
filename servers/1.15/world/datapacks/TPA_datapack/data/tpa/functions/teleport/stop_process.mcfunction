scoreboard players set #is_teleport_executing tpa.variables 0
execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §4After ", {"score": {"name": "#teleport_summon_retried", "objective": "tpa.variables"}}, " retries, the anchor was still not found, the teleport process (", {"selector": "@p[tag=teleport]"}, " -> ", {"storage": "tpa:tpa", "nbt": "temp.teleport.Pos[0]"}, " ", {"storage": "tpa:tpa", "nbt": "temp.teleport.Pos[1]"}, " ", {"storage": "tpa:tpa", "nbt": "temp.teleport.Pos[2]"}, ") Has been stopped. §rThe player was abandoned at ", {"entity": "@p[tag=teleport]", "nbt": "Pos[0]"}, " ", {"entity": "@p[tag=teleport]", "nbt": "Pos[1]"}, " ", {"entity": "@p[tag=teleport]", "nbt": "Pos[2]"}, ". "]
scoreboard players set #teleport_load_awaits tpa.variables 0
scoreboard players set #teleport_summon_retried tpa.variables 0
scoreboard players set #if_accuate_tp tpa.variables 0
tag @a remove teleport