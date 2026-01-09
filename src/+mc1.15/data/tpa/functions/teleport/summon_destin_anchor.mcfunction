# Parent function: tpa:teleport/main

function tpa:teleport/summon_anchor
tag @e[sort=nearest, limit=1, tag=tpa.teleport_anchor] add tpa.teleport_destin_anchor

data modify entity @e[sort=nearest, limit=1, tag=tpa.teleport_destin_anchor] Rotation set from storage tpa:tpa temp.teleport.Rotation
data modify storage tpa:tpa temp.args.id set from storage tpa:tpa temp.teleport.Dimension
function tpa:dimension/get
execute store result score #destin_dimension tpa.variables run data get storage tpa:tpa temp.dimension.id
execute if score #destin_dimension tpa.variables matches 0 in minecraft:overworld as @e[sort=nearest, limit=1, tag=tpa.teleport_anchor] at @s run tp ~ ~ ~
execute if score #destin_dimension tpa.variables matches -1 in minecraft:the_nether as @e[sort=nearest, limit=1, tag=tpa.teleport_anchor] at @s run tp ~ ~ ~
execute if score #destin_dimension tpa.variables matches 1 in minecraft:the_end as @e[sort=nearest, limit=1, tag=tpa.teleport_anchor] at @s run tp ~ ~ ~

data modify entity @e[sort=nearest, limit=1, tag=tpa.teleport_destin_anchor] Pos set from storage tpa:tpa temp.teleport.Pos

#! Bug: cannot via dimensions
#  Here may need multiple tick delay to ensure player in target dimension and able to load destin anchor