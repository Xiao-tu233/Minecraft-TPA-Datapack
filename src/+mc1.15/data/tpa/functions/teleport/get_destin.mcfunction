# Parent function: tpa:teleport/next_node(teleport_state==2)
tp @p[tag=tpa.teleport] @e[sort=nearest, limit=1, tag=tpa.teleport_destin_anchor]
scoreboard players set #is_teleporting_executing tpa.variables 0