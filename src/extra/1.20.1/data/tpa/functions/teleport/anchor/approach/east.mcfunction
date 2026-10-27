# Parent function: tpa:teleport/anchor/approach

scoreboard players operation #x tpa.variables += #sim_dist tpa.variables
execute store result score #z tpa.variables run data get storage tpa:tpa temp.teleport.Pos[2]