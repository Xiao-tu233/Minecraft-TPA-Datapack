# Parent Function: tpa:sethome
# @macro: {name: str, id: int}
# {x: int, y: int, z: int, dim: 
$data remove storage tpa:tpa home.$(name).$(id)
$execute store result storage tpa:tpa home.$(name).$(id).x int 1 run data get entity @s Pos[0]
$execute store result storage tpa:tpa home.$(name).$(id).y int 1 run data get entity @s Pos[1]
$execute store result storage tpa:tpa home.$(name).$(id).z int 1 run data get entity @s Pos[2]
execute store result storage tpa:tpa temp.home.x int 1 run data get entity @s Pos[0]
execute store result storage tpa:tpa temp.home.y int 1 run data get entity @s Pos[1]
execute store result storage tpa:tpa temp.home.z int 1 run data get entity @s Pos[2]
data modify storage tpa:tpa temp.home.x set string storage tpa:tpa temp.home.x
data modify storage tpa:tpa temp.home.y set string storage tpa:tpa temp.home.y
data modify storage tpa:tpa temp.home.z set string storage tpa:tpa temp.home.z

data modify storage tpa:tpa temp.home.id set from storage tpa:tpa temp.args.id
data modify storage tpa:tpa temp.args.id set from entity @s Dimension
function tpa:dimension/get
$data modify storage tpa:tpa home.$(name).$(id).dim set from storage tpa:tpa temp.dimension.namespaceid
data modify storage tpa:tpa temp.home.dimension set from storage tpa:tpa temp.dimension.name

data modify storage tpa:tpa temp.home_ set from storage tpa:tpa temp.home
function tpa:home/menu
data modify storage tpa:tpa temp.home set from storage tpa:tpa temp.home_
data remove storage tpa:tpa temp.home_

function tpa:home/set_done
