# Parent function: tpa:teleport/progress_bar/main, tpa:teleport/progress_bar/loop

execute if score #i tpa.variables <= #percentage tpa.variables run data modify storage tpa:tpa temp.progress_bar append value "§a|"
execute if score #i tpa.variables > #percentage tpa.variables run data modify storage tpa:tpa temp.progress_bar append value "§7|"

scoreboard players add #i tpa.variables 1
execute if score #i tpa.variables <= #100 tpa.variables run function tpa:teleport/progress_bar/loop