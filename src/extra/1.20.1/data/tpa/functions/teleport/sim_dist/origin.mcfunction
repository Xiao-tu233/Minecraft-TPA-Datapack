# Parent function: tpa:teleport/sim_dist/approach

function tpa:teleport/summon_anchor
tag @e[sort=nearest, limit=1, tag=tpa.teleport_anchor] add tpa.teleport_anchor_origin
tag @e[sort=nearest, limit=1, tag=tpa.teleport_anchor_origin] remove tpa.teleport_anchor
data modify entity @e[sort=nearest, limit=1, tag=tpa.teleport_anchor_origin] Rotation set from entity @p[tag=tpa.teleport] Rotation
data modify entity @e[sort=nearest, limit=1, tag=tpa.teleport_anchor_origin] Dimension set from entity @p[tag=tpa.teleport] Dimension
data modify entity @e[sort=nearest, limit=1, tag=tpa.teleport_anchor_origin] Pos set from entity @p[tag=tpa.teleport] Pos
scoreboard players set #teleport_origin_anchor_summoned tpa.variables 1

execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §rOrigin anchor has been summoned @ ", {"entity": "@e[sort=nearest, limit=1, tag=tpa.teleport_anchor_origin]", "nbt": "Pos"}]