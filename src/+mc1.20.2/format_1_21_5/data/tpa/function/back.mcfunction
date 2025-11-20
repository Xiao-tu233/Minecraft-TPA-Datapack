scoreboard players set @s tpa.back 0
scoreboard players set @s back 0
function tpa:load_lang

scoreboard players set #error_code tpa.variables 0
execute if score #back tpa.config matches 1 run scoreboard players set #error_code tpa.variables 1
execute if score #tp_spec tpa.config matches 0 if entity @s[gamemode=spectator] run scoreboard players set #error_code tpa.variables 2

# temp.back = back[@s.player_id]
function tpa:back/get

execute unless score #flag tpa.variables matches 1 run scoreboard players set #error_code tpa.variables 3

execute if score #error_code tpa.variables matches 0 run function tpa:back/set
execute if score #error_code tpa.variables matches 0 run function tpa:back/act with storage tpa:tpa temp.back

execute if score #debug_mode tpa.config matches 0 run data remove storage tpa:tpa temp.back
execute if score #debug_mode tpa.config matches 0 run scoreboard players set #flag tpa.variables 0

execute if score #error_code tpa.variables matches 1.. run function tpa:sounds/no

# error codes:
# 0 - success
# 1 - back disabled
# 2 - spec
# 3 - not exist

execute if score #error_code tpa.variables matches 1 \
    run tellraw @s[predicate=tpa:output/show_chatbar] [{storage:"tpa:tpa", nbt:"loaded_lang.header"}, {storage:"tpa:tpa", nbt:"loaded_lang.back_disabled"}, ". "]
execute if score #error_code tpa.variables matches 1 \
    run title @s[predicate=tpa:output/show_actionbar] actionbar [{storage:"tpa:tpa", nbt:"loaded_lang.back_disabled", color:"red"}]

execute if score #error_code tpa.variables matches 2 \
    run tellraw @s[predicate=tpa:output/show_chatbar] [{storage:"tpa:tpa", nbt:"loaded_lang.header"}, {storage:"tpa:tpa", nbt:"loaded_lang.back_spec"}, ". "]
execute if score #error_code tpa.variables matches 2 \
    run title @s[predicate=tpa:output/show_actionbar] actionbar [{storage:"tpa:tpa", nbt:"loaded_lang.back_spec", color:"red"}]

execute if score #error_code tpa.variables matches 3 \
    run tellraw @s[predicate=tpa:output/show_chatbar] [{storage:"tpa:tpa", nbt:"loaded_lang.header"}, {storage:"tpa:tpa", nbt:"loaded_lang.back_not_exist"}, ". "]
execute if score #error_code tpa.variables matches 3 \
    run title @s[predicate=tpa:output/show_actionbar] actionbar [{storage:"tpa:tpa", nbt:"loaded_lang.back_not_exist", color:"red"}]