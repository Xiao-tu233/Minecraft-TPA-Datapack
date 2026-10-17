# Parent function: tpa:teleport/anchor/main, tpa:teleport/anchor/approach

# Calc node count
execute store result score #x tpa.variables run data get entity @s Pos[0]
scoreboard players operation #x tpa.variables /= #16 tpa.variables
scoreboard players operation #x tpa.variables *= #16 tpa.variables
execute store result score #dx tpa.variables run data get storage tpa:tpa temp.teleport.Pos[0]
scoreboard players operation #dx tpa.variables -= #x tpa.variables
execute store result score #z tpa.variables run data get entity @s Pos[2]
scoreboard players operation #z tpa.variables /= #16 tpa.variables
scoreboard players operation #z tpa.variables *= #16 tpa.variables
execute store result score #dz tpa.variables run data get storage tpa:tpa temp.teleport.Pos[2]
scoreboard players operation #dz tpa.variables -= #z tpa.variables
scoreboard players operation #node_count_x tpa.variables = #dx tpa.variables
scoreboard players operation #node_count_x tpa.variables /= #sim_dist tpa.variables
scoreboard players operation #node_count_z tpa.variables = #dz tpa.variables
scoreboard players operation #node_count_z tpa.variables /= #sim_dist tpa.variables


# Direction encoding (clockwise from East)
# 0 = Stay
# 1 = East
# 2 = SouthEast
# 3 = South
# 4 = SouthWest
# 5 = West
# 6 = NorthWest
# 7 = North
# 8 = NorthEast

# Reset dir
scoreboard players set #dir tpa.variables 0

# 0: Stay (dx ~= 0, dz ~= 0)
execute if score #dx tpa.variables < #sim_dist tpa.variables if score #dx tpa.variables > #negative_sim_dist tpa.variables if score #dz tpa.variables < #sim_dist tpa.variables if score #dz tpa.variables > #negative_sim_dist tpa.variables run scoreboard players set #dir tpa.variables 0

# 1: East (dx >= +, dz ~= 0)
execute if score #dx tpa.variables >= #sim_dist tpa.variables if score #dz tpa.variables < #sim_dist tpa.variables if score #dz tpa.variables > #negative_sim_dist tpa.variables run scoreboard players set #dir tpa.variables 1

# 2: SouthEast (dx >= +, dz >= +)
execute if score #dx tpa.variables >= #sim_dist tpa.variables if score #dz tpa.variables >= #sim_dist tpa.variables run scoreboard players set #dir tpa.variables 2

# 3: South (dx ~= 0, dz >= +)
execute if score #dx tpa.variables < #sim_dist tpa.variables if score #dx tpa.variables > #negative_sim_dist tpa.variables if score #dz tpa.variables >= #sim_dist tpa.variables run scoreboard players set #dir tpa.variables 3

# 4: SouthWest (dx <= -, dz >= +)
execute if score #dx tpa.variables <= #negative_sim_dist tpa.variables if score #dz tpa.variables >= #sim_dist tpa.variables run scoreboard players set #dir tpa.variables 4

# 5: West (dx <= -, dz ~= 0)
execute if score #dx tpa.variables <= #negative_sim_dist tpa.variables if score #dz tpa.variables < #sim_dist tpa.variables if score #dz tpa.variables > #negative_sim_dist tpa.variables run scoreboard players set #dir tpa.variables 5

# 6: NorthWest (dx <= -, dz <= -)
execute if score #dx tpa.variables <= #negative_sim_dist tpa.variables if score #dz tpa.variables <= #negative_sim_dist tpa.variables run scoreboard players set #dir tpa.variables 6

# 7: North (dx ~= 0, dz <= -)
execute if score #dx tpa.variables < #sim_dist tpa.variables if score #dx tpa.variables > #negative_sim_dist tpa.variables if score #dz tpa.variables <= #negative_sim_dist tpa.variables run scoreboard players set #dir tpa.variables 7

# 8: NorthEast (dx >= +, dz <= -)
execute if score #dx tpa.variables >= #sim_dist tpa.variables if score #dz tpa.variables <= #negative_sim_dist tpa.variables run scoreboard players set #dir tpa.variables 8