# Parent function: tpa:teleport/sim_dist/approach_anchor ("in case teleport state is 4.5", I mean the Test Anchor has been removed outta the sim dist 1 chunks away)

scoreboard players set #teleport_state tpa.variables 5
execute unless entity @e[sort=nearest, limit=1, tag=tpa.teleport_anchor] run tp @s ~16 336 ~
execute unless entity @e[sort=nearest, limit=1, tag=tpa.teleport_anchor] run kill @e[tag=tpa.teleport_anchor]