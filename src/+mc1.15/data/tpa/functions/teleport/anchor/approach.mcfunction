# Parent function: tpa:teleport/next_node(teleport_state==0)

data modify storage tpa:tpa temp.teleport.next_node set value []
function tpa:teleport/anchor/calc_node
execute if score #dir tpa.variables matches 0 run function tpa:teleport/anchor/last_approach
execute if score #dir tpa.variables matches 1  run function tpa:teleport/anchor/approach/east
execute if score #dir tpa.variables matches 2 run function tpa:teleport/anchor/approach/south_east
execute if score #dir tpa.variables matches 3  run function tpa:teleport/anchor/approach/south
execute if score #dir tpa.variables matches 4  run function tpa:teleport/anchor/approach/south_west
execute if score #dir tpa.variables matches 5  run function tpa:teleport/anchor/approach/west
execute if score #dir tpa.variables matches 6  run function tpa:teleport/anchor/approach/north_west
execute if score #dir tpa.variables matches 7  run function tpa:teleport/anchor/approach/north
execute if score #dir tpa.variables matches 8  run function tpa:teleport/anchor/approach/north_east
execute store result storage tpa:tpa temp.teleport.next_node_x double 1 run scoreboard players get #x tpa.variables
execute store result storage tpa:tpa temp.teleport.next_node_z double 1 run scoreboard players get #z tpa.variables
data modify storage tpa:tpa temp.teleport.next_node append from storage tpa:tpa temp.teleport.next_node_x
data modify storage tpa:tpa temp.teleport.next_node append value 336.0d
data modify storage tpa:tpa temp.teleport.next_node append from storage tpa:tpa temp.teleport.next_node_z

execute if score #dir tpa.variables matches 1..8 run function tpa:teleport/summon_anchor
data modify entity @e[sort=nearest, limit=1, tag=tpa.teleport_anchor] Pos set from storage tpa:tpa temp.teleport.next_node
