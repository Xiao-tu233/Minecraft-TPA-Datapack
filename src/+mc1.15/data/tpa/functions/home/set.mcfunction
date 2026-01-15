# Parent function: tpa:sethome

# Build new home object with current position
data modify storage tpa:tpa temp.home set value {}
execute store result storage tpa:tpa temp.home.x int 1 run data get entity @s Pos[0]
execute store result storage tpa:tpa temp.home.y int 1 run data get entity @s Pos[1]
execute store result storage tpa:tpa temp.home.z int 1 run data get entity @s Pos[2]
data modify storage tpa:tpa temp.home.dim set from entity @s Dimension
execute store result storage tpa:tpa temp.home.uid int 1 run scoreboard players get #uid tpa.variables
execute store result storage tpa:tpa temp.home.number int 1 run scoreboard players get #home tpa.variables

scoreboard players set #op tpa.variables 1
function tpa:home/iterator/main

execute if score #home_editted tpa.variables matches 0 run data modify storage tpa:tpa home append from storage tpa:tpa temp.home