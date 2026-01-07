# Parent function: tpa:teleport/sim_dist/approach

function tpa:teleport/summon_anchor
tag @e[sort=nearest, limit=1, tag=tpa.teleport_anchor] add tpa.teleport_anchor_origin
tag @e[sort=nearest, limit=1, tag=tpa.teleport_anchor_origin] remove tpa.teleport_anchor
scoreboard players set #teleport_origin_anchor_summoned tpa.variables 1