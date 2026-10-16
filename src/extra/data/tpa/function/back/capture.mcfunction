# Parent function: tpa:back/act
# init storage
data modify storage tpa:tpa temp.back_candidate set value {}

data modify storage tpa:tpa temp.back_candidate.x set from entity @s Pos[0]
data modify storage tpa:tpa temp.back_candidate.y set from entity @s Pos[1]
data modify storage tpa:tpa temp.back_candidate.z set from entity @s Pos[2]
data modify storage tpa:tpa temp.back_candidate.yaw set from entity @s Rotation[0]
data modify storage tpa:tpa temp.back_candidate.pitch set from entity @s Rotation[1]
data modify storage tpa:tpa temp.back_candidate.Dimension set from entity @s Dimension
execute store result storage tpa:tpa temp.back_candidate.uid int 1 run scoreboard players get @s tpa.uid