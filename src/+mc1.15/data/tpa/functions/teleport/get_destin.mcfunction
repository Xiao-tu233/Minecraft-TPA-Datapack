# Parent function: tpa:teleport/next_node(teleport_state==2)
tp @p[tag=tpa.teleport] @e[sort=nearest, limit=1, tag=tpa.teleport_destin_anchor]
scoreboard players set #is_teleport_executing tpa.variables 0
execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §aSuccessfully teleported §r", {"selector": "@p[tag=tpa.teleport]"}, " to ", {"entity": "@p[tag=tpa.teleport]", "nbt": "Pos"}, " in ", {"entity": "@p[tag=tpa.teleport]", "nbt": "Dimension"}, " rotated ", {"entity": "@p[tag=tpa.teleport]", "nbt": "Rotation"}]
kill @e[tag=tpa.teleport_destin_anchor]
tag @p[tag=tpa.teleport] remove tpa.teleport