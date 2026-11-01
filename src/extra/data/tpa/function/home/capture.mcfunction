# Parent function: tpa:home/set
#! Prepare the canonical Home candidate without modifying home[].
# The identity of a Home is the pair (uid, id).

data modify storage tpa:tpa temp.home_candidate set value {}
execute store result storage tpa:tpa temp.home_candidate.uid int 1 run scoreboard players get @s tpa.uid
execute store result storage tpa:tpa temp.home_candidate.id int 1 run scoreboard players get #home tpa.variables
execute store result storage tpa:tpa temp.home_candidate.x int 1 run data get entity @s Pos[0]
execute store result storage tpa:tpa temp.home_candidate.y int 1 run data get entity @s Pos[1]
execute store result storage tpa:tpa temp.home_candidate.z int 1 run data get entity @s Pos[2]

data modify storage tpa:tpa temp.args.id set from entity @s Dimension
function tpa:dimension/get
data modify storage tpa:tpa temp.home_candidate.dimension set from storage tpa:tpa temp.dimension.namespaceid
