# Parent Function: tpa:home/within_range

# Build the flat-list candidate. The identity is always the pair (uid, id).
data remove storage tpa:tpa temp.home_candidate
data modify storage tpa:tpa temp.home_candidate set value {}
execute store result storage tpa:tpa temp.home_candidate.uid int 1 run scoreboard players get @s tpa.uid
execute store result storage tpa:tpa temp.home_candidate.id int 1 run scoreboard players get #home tpa.variables
execute store result storage tpa:tpa temp.home_candidate.x int 1 run data get entity @s Pos[0]
execute store result storage tpa:tpa temp.home_candidate.y int 1 run data get entity @s Pos[1]
execute store result storage tpa:tpa temp.home_candidate.z int 1 run data get entity @s Pos[2]
data modify storage tpa:tpa temp.args.id set from entity @s Dimension
function tpa:dimension/get
data modify storage tpa:tpa temp.home_candidate.dimension set from storage tpa:tpa temp.dimension.namespaceid

data remove storage tpa:tpa temp.home_result
scoreboard players set #home.match_all tpa.variables 0
scoreboard players set #home.store_result tpa.variables 0
scoreboard players set #home.remove_current tpa.variables 0
scoreboard players set #home.replace_current tpa.variables 1
scoreboard players operation #uid tpa.variables = @s tpa.uid
function tpa:home/scan

# Insert if this UID+id pair did not exist; otherwise scan replaced it.
execute unless score #home.match_found tpa.variables matches 1 run data modify storage tpa:tpa home append from storage tpa:tpa temp.home_candidate

# Keep the human-readable values needed by the confirmation output.
data remove storage tpa:tpa temp.home
data modify storage tpa:tpa temp.home set from storage tpa:tpa temp.home_candidate
execute store result storage tpa:tpa temp.home.x int 1 run data get entity @s Pos[0]
execute store result storage tpa:tpa temp.home.y int 1 run data get entity @s Pos[1]
execute store result storage tpa:tpa temp.home.z int 1 run data get entity @s Pos[2]
data modify storage tpa:tpa temp.home.x set string storage tpa:tpa temp.home.x
data modify storage tpa:tpa temp.home.y set string storage tpa:tpa temp.home.y
data modify storage tpa:tpa temp.home.z set string storage tpa:tpa temp.home.z
data modify storage tpa:tpa temp.home.dimension set from storage tpa:tpa temp.dimension.name

function tpa:home/set_done
function tpa:home/menu
