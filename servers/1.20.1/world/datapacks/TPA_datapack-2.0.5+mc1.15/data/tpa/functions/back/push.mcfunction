# @Parent Function: tpa:back, tpa:teleport/cal_sim_dist
data remove storage tpa:tpa temp.back_set
execute store result storage tpa:tpa temp.back_set.id int 1 run scoreboard players get @s tpa.player_id
data modify storage tpa:tpa temp.back_set.x set from entity @s Pos[0]
data modify storage tpa:tpa temp.back_set.y set from entity @s Pos[1]
data modify storage tpa:tpa temp.back_set.z set from entity @s Pos[2]
data modify storage tpa:tpa temp.back_set.yaw set from entity @s Rotation[0]
data modify storage tpa:tpa temp.back_set.pitch set from entity @s Rotation[1]
data modify storage tpa:tpa temp.back_set.Dimension set from entity @s Dimension

# Need more confirmation if store