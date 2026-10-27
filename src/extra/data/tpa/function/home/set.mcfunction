# Parent Function: tpa:home/within_range
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


# Parent function: tpa:warp/commit

data remove storage tpa:tpa temp.warp_result
scoreboard players set #warp.store_result tpa.variables 0
scoreboard players set #warp.remove_current tpa.variables 0
scoreboard players set #warp.replace_current tpa.variables 1
scoreboard players set #warp.scan_count tpa.variables 1
function tpa:warp/scan

execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug§r: Warp set: set ", {storage: "tpa:tpa", nbt: "temp.warp_candidate"}, " for ", {selector: "@s"}, {translate: "(UID:§a%s§r)", with: [{score: {name: "#uid", objective: "tpa.variables"}}]}]