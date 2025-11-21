# tpa.lang_temp is dummy while tpa.language is trigger
scoreboard players operation #language tpa.variables = @s tpa.language
scoreboard players set @s tpa.language 0

# If *1. server has a language chosen* and *2. player is not allowed to choose a language*, stop player from choosing a language
scoreboard players set #can_choose tpa.variables 1
execute if score #player_lang tpa.config matches 0 if score #language tpa.config matches 1.. run scoreboard players set #can_choose tpa.variables 0

# Tell player failed to choose a language
execute if score #can_choose tpa.variables matches 0 run scoreboard players operation @s tpa.lang_temp = #language tpa.config
execute if score #can_choose tpa.variables matches 0 run function tpa:load_lang
execute if score #can_choose tpa.variables matches 0 run function tpa:sounds/no
execute if score #can_choose tpa.variables matches 0 run tellraw @s[scores={tpa.output=1..2}] [{storage: "tpa:tpa", nbt: "temp.lang.header"}, {storage: "tpa:tpa", nbt: "temp.lang.lang_disabled"}]
execute if score #can_choose tpa.variables matches 0 run title @s[scores={tpa.output=0..1}] actionbar [{storage: "tpa:tpa", nbt: "temp.lang.lang_disabled", "color": "red"}]
execute if score #can_choose tpa.variables matches 0 run return 0

# Make server follow language if not set
scoreboard players set #if_follow tpa.variables 0
execute unless score #language tpa.config matches 1.. run scoreboard players set #if_follow tpa.variables 1
execute if score #if_follow tpa.variables matches 1 run scoreboard players operation #language tpa.config = #language tpa.variables
execute if score #if_follow tpa.variables matches 1 run scoreboard players operation #target_lang tpa.variables = #language tpa.variables
execute if score #if_follow tpa.variables matches 1 run function tpa:load_lang
execute if score #if_follow tpa.variables matches 1 run tellraw @a [{storage: "tpa:tpa", nbt: "temp.lang.header"}, {storage: "tpa:tpa", nbt: "temp.lang.lang_server_follow_left_part"}, {storage: "tpa:tpa", nbt: "temp.lang.name_display"}, {storage: "tpa:tpa", nbt: "temp.lang.lang_server_follow_right_part"}, "." ]

# Tell player success to choose a language
scoreboard players operation @s tpa.lang_temp = #language tpa.variables
function tpa:load_lang
function tpa:sounds/levelup
tellraw @s[scores={tpa.output=1..2}] [{storage: "tpa:tpa", nbt: "temp.lang.header"}, {storage: "tpa:tpa", nbt: "temp.lang.lang_selected_left_part"}, {storage: "tpa:tpa", nbt: "temp.lang.name_display"}, {storage: "tpa:tpa", nbt: "temp.lang.lang_selected_right_part"}, "." ]
title @s[scores={tpa.output=0..1}] actionbar [{storage: "tpa:tpa", nbt: "temp.lang.lang_selected_left_part"}, {storage: "tpa:tpa", nbt: "temp.lang.name_display"}, {storage: "tpa:tpa", nbt: "temp.lang.lang_selected_right_part"}]
