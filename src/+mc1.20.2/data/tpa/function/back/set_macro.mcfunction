# Parent Function: tpa:back/set
# @macro: {uid: int}

$data remove storage tpa:tpa back.$(uid)
$data modify storage tpa:tpa back.$(uid).x set from entity @s Pos[0]
$data modify storage tpa:tpa back.$(uid).y set from entity @s Pos[1]
$data modify storage tpa:tpa back.$(uid).z set from entity @s Pos[2]
$data modify storage tpa:tpa back.$(uid).yaw set from entity @s Rotation[0]
$data modify storage tpa:tpa back.$(uid).pitch set from entity @s Rotation[1]
$data modify storage tpa:tpa back.$(uid).Dimension set from entity @s Dimension

$execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug§r: ", {selector: "@s", color: "green"}, " set BACK with ", {storage:"tpa:tpa", nbt:"back.$(uid))"}]