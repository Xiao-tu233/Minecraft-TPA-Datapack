# 1. @ tpa:main:14
execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §rAn anchor has been found. "]
scoreboard players set #teleport_load_awaits tpa.variables 0
scoreboard players set #teleport_summon_retried tpa.variables -1
execute store result score #x tpa.variables run data get entity @s Pos[0]
execute store result score #z tpa.variables run data get entity @s Pos[2]

# x range = [x//16*16-sim_dist*16, x//16*16+15+sim_dist*16]
scoreboard players operation #x_range_from tpa.variables = #x tpa.variables
scoreboard players operation #x_range_from tpa.variables /= #16 tpa.variables
scoreboard players operation #x_range_from tpa.variables *= #16 tpa.variables
scoreboard players operation #x_range_to tpa.variables = #x_range_from tpa.variables
scoreboard players operation #x_range_from tpa.variables -= #sim_dist tpa.variables
scoreboard players add #x_range_to tpa.variables 15
scoreboard players operation #x_range_to tpa.variables += #sim_dist tpa.variables

execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §rCalculated reachable math interval X: [", {"score":{"name": "#x_range_from", "objective": "tpa.variables"}}, ", ", {"score":{"name": "#x_range_to", "objective": "tpa.variables"}}, "]"]

scoreboard players operation #z_range_from tpa.variables = #z tpa.variables
scoreboard players operation #z_range_from tpa.variables /= #16 tpa.variables
scoreboard players operation #z_range_from tpa.variables *= #16 tpa.variables
scoreboard players operation #z_range_to tpa.variables = #z_range_from tpa.variables
scoreboard players operation #z_range_from tpa.variables -= #sim_dist tpa.variables
scoreboard players add #z_range_to tpa.variables 15
scoreboard players operation #z_range_to tpa.variables += #sim_dist tpa.variables

execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §rCalculated reachable math interval Z: [", {"score":{"name": "#z_range_from", "objective": "tpa.variables"}}, ", ", {"score":{"name": "#z_range_to", "objective": "tpa.variables"}}, "]"]

# This function is always called twice so we have the 2-times-executed detection here
execute if score #target_x tpa.variables >= #x_range_from tpa.variables if score #target_x tpa.variables <= #x_range_to tpa.variables if score #target_z tpa.variables >= #z_range_from tpa.variables if score #target_z tpa.variables <= #z_range_to tpa.variables run scoreboard players add #if_accuate_tp tpa.variables 1

execute if score #if_accuate_tp tpa.variables matches 1 run data modify storage tpa:tpa temp.teleport.next_node set from storage tpa:tpa temp.teleport.Pos
execute if score #if_accuate_tp tpa.variables matches 0 run function tpa:teleport/main_cal_next_node

execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §r ",{"selector": "@s"}," -> Anchor @ ", {"storage": "tpa:tpa", "nbt": "temp.teleport.next_node"}]
kill @e[nbt={Item:{tag:{isTeleportAnchor: 1b}}}]
summon item ~ ~ ~ {Item: {id: "stone", Count: 1b, tag: {isTeleportAnchor: 1b, Dimension: 1}}, PickupDelay: 32767s, Age: -32768s, Health: 0, NoGravity: true}
execute if score #target_dimension tpa.variables matches 0 in minecraft:overworld run tp @e[nbt={Item:{tag:{isTeleportAnchor: 1b}}}, limit=1, sort=nearest] ~ ~ ~
execute if score #target_dimension tpa.variables matches 1 in minecraft:the_end run tp @e[nbt={Item:{tag:{isTeleportAnchor: 1b}}}, limit=1, sort=nearest] ~ ~ ~
execute if score #target_dimension tpa.variables matches -1 in minecraft:the_nether run tp @e[nbt={Item:{tag:{isTeleportAnchor: 1b}}}, limit=1, sort=nearest] ~ ~ ~
data modify entity @e[nbt={Item:{tag:{isTeleportAnchor: 1b}}}, limit=1, sort=nearest] Pos set from storage tpa:tpa temp.teleport.next_node
data modify entity @e[nbt={Item:{tag:{isTeleportAnchor: 1b}}}, limit=1, sort=nearest] Rotation set from storage tpa:tpa temp.teleport.Rotation
tp @s @e[nbt={Item:{tag:{isTeleportAnchor: 1b}}}, limit=1, sort=nearest]
