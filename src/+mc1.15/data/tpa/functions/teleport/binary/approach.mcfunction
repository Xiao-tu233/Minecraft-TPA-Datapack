# Parent function: tpa:telepot/next_node (teleport_state == 3)

# Binary Teleports
execute store result score #x tpa.variables run data get entity @s Pos[0]
execute store result score #x_dist tpa.variables run data get storage tpa:tpa temp.teleport.Pos[0]
scoreboard players operation #x_dist tpa.variables -= #x tpa.variables
execute store result score #z tpa.variables run data get entity @s Pos[2]
execute store result score #z_dist tpa.variables run data get storage tpa:tpa temp.teleport.Pos[2]
scoreboard players operation #z_dist tpa.variables -= #z tpa.variables

# 16,777,216 = 2^24
# Stops here because 8 block is even shorter than a chunk's length, we use anchor teleport for the last step, same for Z and negatives
execute if score #x_dist tpa.variables matches 8.. at @s run function tpa:teleport/binary/approach/positive_x
execute if score #x_dist tpa.variables matches ..-8 at @s run function tpa:teleport/binary/approach/negative_x
execute if score #z_dist tpa.variables matches 8.. at @s run function tpa:teleport/binary/approach/positive_z
execute if score #z_dist tpa.variables matches ..-8 at @s run function tpa:teleport/binary/approach/negative_z

# Calc dists
scoreboard players set #dist tpa.variables 0
execute if score #x_dist tpa.variables matches 1.. run scoreboard players operation #dist tpa.variables += #x_dist tpa.variables
execute if score #x_dist tpa.variables matches ..0 run scoreboard players operation #dist tpa.variables -= #x_dist tpa.variables
execute if score #z_dist tpa.variables matches 1.. run scoreboard players operation #dist tpa.variables += #z_dist tpa.variables
execute if score #z_dist tpa.variables matches ..0 run scoreboard players operation #dist tpa.variables -= #z_dist tpa.variables

execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug§r: Binary Teleport approached once: ", {"score":{"objective":"tpa.variables","name":"#dist"}, "color": "green"}, "/", {"score":{"objective":"tpa.variables","name":"#original_distance"}}]

execute if entity @e[sort=nearest, limit=1, tag=tpa.teleport_destin_anchor] run scoreboard players set #teleport_state tpa.variables 2