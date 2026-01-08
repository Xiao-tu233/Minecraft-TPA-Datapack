# Parent function: tpa:teleport/main

function tpa:teleport/summon_anchor
tag @e[sort=nearest, limit=1, tag=tpa.teleport_anchor] add tpa.teleport_destin_anchor

data modify entity @e[sort=nearest, limit=1, tag=tpa.teleport_destin_anchor] Rotation set from storage tpa:tpa temp.teleport.Rotation
data modify entity @e[sort=nearest, limit=1, tag=tpa.teleport_destin_anchor] Dimension set from storage tpa:tpa temp.teleport.Dimension
data modify entity @e[sort=nearest, limit=1, tag=tpa.teleport_destin_anchor] Pos set from storage tpa:tpa temp.teleport.Pos