
scoreboard players set #is_not_in_overworld tpa.variables 1
scoreboard players set #is_not_in_nether tpa.variables 1
scoreboard players set #is_not_in_end tpa.variables 1
data modify storage tpa:tpa temp.teleport.Dimensions set value ["PLACEHOLDER", "minecraft:overworld", "minecraft:the_nether", "minecraft:the_end"]
execute store result score #is_not_in_overworld tpa.variables run data modify storage tpa:tpa temp.teleport.Dimensions[1] set from entity @s Dimension
execute store result score #is_not_in_nether tpa.variables run data modify storage tpa:tpa temp.teleport.Dimensions[2] set from entity @s Dimension
execute store result score #is_not_in_end tpa.variables run data modify storage tpa:tpa temp.teleport.Dimensions[3] set from entity @s Dimension
execute if score #is_not_in_overworld tpa.variables matches 0 run scoreboard players set #dim_num tpa.variables 0
execute if score #is_not_in_nether tpa.variables matches 0 run scoreboard players set #dim_num tpa.variables -1
execute if score #is_not_in_end tpa.variables matches 0 run scoreboard players set #dim_num tpa.variables 1