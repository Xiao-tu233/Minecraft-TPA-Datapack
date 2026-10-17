# Parent function: tpa:initialize
scoreboard players set #is_1_16 tpa.variables 0
scoreboard players set #is_1_17 tpa.variables 0
execute store result score #is_1_16 tpa.variables run summon item ~ ~ ~ {Item: {id: "target", Count: 1}, PickupDelay: 32767s, Age: -32768s, Health: 0, NoGravity: true, Tags:["tpa.visual_item"]}
execute store result score #is_1_17 tpa.variables run summon item ~ ~ ~ {Item: {id: "spyglass", Count: 1}, PickupDelay: 32767s, Age: -32768s, Health: 0, NoGravity: true, Tags:["tpa.visual_item"]}
scoreboard players set #game_version tpa.config 115
execute if score #is_1_16 tpa.variables matches 1 run scoreboard players add #game_version tpa.config 1
execute if score #is_1_17 tpa.variables matches 1 run scoreboard players add #game_version tpa.config 1
execute if score #game_version tpa.config matches 115 run data modify storage tpa:tpa option.game_version set value "1.15 - 1.15.2"
execute if score #game_version tpa.config matches 116 run data modify storage tpa:tpa option.game_version set value "1.16 - 1.16.5"
execute if score #game_version tpa.config matches 117 run data modify storage tpa:tpa option.game_version set value "1.17 - 1.20.1"
kill @e[tag=tpa.visual_item]