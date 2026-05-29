# Parent function: tpa:teleport/anchor/approach

scoreboard players operation #z tpa.variables -= #sim_dist tpa.variables
execute store result score #x tpa.variables run data get storage tpa:tpa temp.teleport.Pos[0]