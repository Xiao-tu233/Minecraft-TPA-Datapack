# Parent function: tpa:teleport/cal_sim_dist, tpa:teleport/sim_dist/loop(loop)

tp @e[sort=nearest, limit=1, tag=tpa.teleport_anchor] ~16 ~ ~

execute if entity @e[sort=nearest, limit=1, tag=tpa.teleport_anchor] run scoreboard players add #sim_dist tpa.config 1

execute if entity @e[sort=nearest, limit=1, tag=tpa.teleport_anchor] run function tpa:teleport/sim_dist/loop