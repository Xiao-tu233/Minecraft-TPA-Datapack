# Parent function: tpa:teleport/next_node (in case #teleport_state == 4)

# Set origin anchor
execute if score #teleport_origin_anchor_summoned tpa.variables matches 0 as @p[tag=tpa.teleport] at @s run function tpa:teleport/anchor/origin

execute as @e[sort=nearest, limit=1, tag=tpa.teleport_anchor] at @s run tp ~16 ~ ~
execute if entity @e[sort=nearest, limit=1, tag=tpa.teleport_anchor] run scoreboard players add #sim_dist tpa.config 1
execute unless entity @e[sort=nearest, limit=1, tag=tpa.teleport_anchor] run function tpa:teleport/sim_dist/kill_anchor