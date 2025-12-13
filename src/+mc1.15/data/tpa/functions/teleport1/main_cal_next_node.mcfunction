
# if target position is not in sim dist, tp player one sim dist closer but according to direction
execute if score #target_x tpa.variables < #x_range_from tpa.variables run scoreboard players operation #x_next_node tpa.variables = #x_range_from tpa.variables
execute if score #target_x tpa.variables > #x_range_to tpa.variables run scoreboard players operation #x_next_node tpa.variables = #x_range_to tpa.variables
execute if score #target_z tpa.variables < #z_range_from tpa.variables run scoreboard players operation #z_next_node tpa.variables = #z_range_from tpa.variables
execute if score #target_z tpa.variables > #z_range_to tpa.variables run scoreboard players operation #z_next_node tpa.variables = #z_range_to tpa.variables
execute if score #target_x tpa.variables >= #x_range_from tpa.variables if score #target_x tpa.variables <= #x_range_to tpa.variables run scoreboard players operation #x_next_node tpa.variables = #x tpa.variables
execute if score #target_z tpa.variables >= #z_range_from tpa.variables if score #target_z tpa.variables <= #z_range_to tpa.variables run scoreboard players operation #z_next_node tpa.variables = #z tpa.variables

# Debugs
execute if score #debug_mode tpa.config matches 1 if score #target_x tpa.variables < #x_range_from tpa.variables run tellraw @a ["[§bTPA§r] §6 Debug: §r Target hasn't been reachable yet, who's at West(X-). Set anchor's X to ", {"score":{"name": "#x_next_node", "objective": "tpa.variables"}}]
execute if score #debug_mode tpa.config matches 1 if score #target_x tpa.variables > #x_range_to tpa.variables run tellraw @a ["[§bTPA§r] §6 Debug: §r Target hasn't been reachable yet, who's at East(X+). Set anchor's X to ", {"score":{"name": "#x_next_node", "objective": "tpa.variables"}}]
execute if score #debug_mode tpa.config matches 1 if score #target_z tpa.variables < #z_range_from tpa.variables run tellraw @a ["[§bTPA§r] §6 Debug: §r Target hasn't been reachable yet, who's at North(Z-). Set anchor's Z to ", {"score":{"name": "#z_next_node", "objective": "tpa.variables"}}]
execute if score #debug_mode tpa.config matches 1 if score #target_z tpa.variables > #z_range_to tpa.variables run tellraw @a ["[§bTPA§r] §6 Debug: §r Target hasn't been reachable yet, who's at South(Z+). Set anchor's Z to ", {"score":{"name": "#z_next_node", "objective": "tpa.variables"}}]
execute if score #debug_mode tpa.config matches 1 if score #target_x tpa.variables >= #x_range_from tpa.variables if score #target_x tpa.variables <= #x_range_to tpa.variables run tellraw @a ["[§bTPA§r] §6 Debug: §r Target's reachable in X.", {"score":{"name": "#x_next_node", "objective": "tpa.variables"}}]
execute if score #debug_mode tpa.config matches 1 if score #target_z tpa.variables >= #z_range_from tpa.variables if score #target_z tpa.variables <= #z_range_to tpa.variables run tellraw @a ["[§bTPA§r] §6 Debug: §r Target's reachable in Z.", {"score":{"name": "#z_next_node", "objective": "tpa.variables"}}]

data remove storage tpa:tpa temp.teleport.next_node
data modify storage tpa:tpa temp.teleport.next_node set from entity @s Pos
execute store result storage tpa:tpa temp.teleport.next_node[0] double 1 run scoreboard players get #x_next_node tpa.variables
data modify storage tpa:tpa temp.teleport.next_node[1] set value 336.0d
execute store result storage tpa:tpa temp.teleport.next_node[2] double 1 run scoreboard players get #z_next_node tpa.variables