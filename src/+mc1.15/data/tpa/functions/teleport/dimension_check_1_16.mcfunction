scoreboard players set #is_not_overworld tpa.variables 1
scoreboard players set #is_not_nether tpa.variables 1
scoreboard players set #is_not_end tpa.variables 1
scoreboard players set #is_not_in_overworld tpa.variables 1
scoreboard players set #is_not_in_nether tpa.variables 1
scoreboard players set #is_not_in_end tpa.variables 1

execute unless data storage tpa:tpa temp.teleport.Rotation run data modify storage tpa:tpa temp.teleport.Rotation set value [0.0f, 0.0f]
data modify storage tpa:tpa temp.teleport.Dimensions set value ["PLACEHOLDER", "minecraft:overworld", "minecraft:the_nether", "minecraft:the_end"]
execute store result score #is_not_overworld tpa.variables run data modify storage tpa:tpa temp.teleport.Dimensions[1] set from storage tpa:tpa temp.teleport.Dimension
execute store result score #is_not_nether tpa.variables run data modify storage tpa:tpa temp.teleport.Dimensions[2] set from storage tpa:tpa temp.teleport.Dimension
execute store result score #is_not_end tpa.variables run data modify storage tpa:tpa temp.teleport.Dimensions[3] set from storage tpa:tpa temp.teleport.Dimension
execute if score #is_not_overworld tpa.variables matches 0 run scoreboard players set #target_dimension tpa.variables 0
execute if score #is_not_nether tpa.variables matches 0 run scoreboard players set #target_dimension tpa.variables -1
execute if score #is_not_end tpa.variables matches 0 run scoreboard players set #target_dimension tpa.variables 1

data modify storage tpa:tpa temp.teleport.Dimensions set value ["PLACEHOLDER", "minecraft:overworld", "minecraft:the_nether", "minecraft:the_end"]
execute store result score #is_not_in_overworld tpa.variables run data modify storage tpa:tpa temp.teleport.Dimensions[1] set from entity @s Dimension
execute store result score #is_not_in_nether tpa.variables run data modify storage tpa:tpa temp.teleport.Dimensions[2] set from entity @s Dimension
execute store result score #is_not_in_end tpa.variables run data modify storage tpa:tpa temp.teleport.Dimensions[3] set from entity @s Dimension
execute if score #is_not_overworld tpa.variables matches 0 run scoreboard players set #current_dimension tpa.variables 0
execute if score #is_not_nether tpa.variables matches 0 run scoreboard players set #current_dimension tpa.variables -1
execute if score #is_not_end tpa.variables matches 0 run scoreboard players set #current_dimension tpa.variables 1