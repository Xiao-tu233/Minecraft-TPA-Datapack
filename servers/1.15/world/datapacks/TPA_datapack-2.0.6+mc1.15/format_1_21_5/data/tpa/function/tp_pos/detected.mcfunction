function tpa:load_lang

scoreboard players set #error_code tpa.variables 0
execute if score #tp_pos tpa.config matches 0 run scoreboard players set #error_code tpa.variables 1
execute if score #tp_pos_cooldown tpa.config matches ..-1 run scoreboard players set #error_code tpa.variables 1
execute if score @s tpa.pos_cd matches 1.. run scoreboard players set #error_code tpa.variables 2
execute if score #tp_spec tpa.config matches 0 if entity @s[gamemode=spectator] run scoreboard players set #error_code tpa.variables 3

execute if score #error_code tpa.variables matches 1..3 run function tpa:sounds/no
execute if score #error_code tpa.variables matches 1 run tellraw @s[scores={tpa.output=1..2}] [\
    {storage: "tpa:tpa", nbt: "temp.lang.header"}, \
    {storage: "tpa:tpa", nbt: "temp.lang.tp_pos_disabled"}, "." \
]
execute if score #error_code tpa.variables matches 1 run title @s[scores={tpa.output=0..1}] actionbar [{storage: "tpa:tpa", nbt: "temp.lang.tp_pos_disabled", color: "red"}]
execute if score #error_code tpa.variables matches 2 run tellraw @s[scores={tpa.output=1..2}] [\
    {storage: "tpa:tpa", nbt: "temp.lang.header"}, \
    {storage: "tpa:tpa", nbt: "temp.lang.tp_pos_cooldown"}, "." \
]
execute if score #error_code tpa.variables matches 2 run title @s[scores={tpa.output=0..1}] actionbar [{storage: "tpa:tpa", nbt: "temp.lang.tp_pos_cooldown", color: "red"}]

execute if score #error_code tpa.variables matches 3 run tellraw @s[scores={tpa.output=1..2}] [\
    {storage: "tpa:tpa", nbt: "temp.lang.header"}, \
    {storage: "tpa:tpa", nbt: "temp.lang.tp_pos_spec"}, "." \
]
execute if score #error_code tpa.variables matches 3 run title @s[scores={tpa.output=0..1}] actionbar [{storage: "tpa:tpa", nbt: "temp.lang.tp_pos_spec", color: "red"}]
execute if score #error_code tpa.variables matches 1..3 run return 0


data modify storage tpa:tpa temp.args.self set from storage tpa:tpa temp.key_commands[-1].commands[1]
execute store result score #name_len tpa.variables run data get storage tpa:tpa temp.args.self
scoreboard players set #j tpa.variables 0
data modify storage tpa:tpa temp.string_map set value {\
    1: 1b, 2: 1b, 3: 1b, 4: 1b, 5: 1b, 6: 1b, 7: 1b, 8: 1b, 9: 1b, 0: 1b, .: 1b, -:1b \
}
execute store result score #has_illegal_char tpa.variables run function tpa:char_loop

execute if score #has_illegal_char tpa.variables matches 1 run scoreboard players set #error_code tpa.variables 5

data modify storage tpa:tpa temp.args.self set from storage tpa:tpa temp.key_commands[-1].commands[2]
execute store result score #name_len tpa.variables run data get storage tpa:tpa temp.args.self
scoreboard players set #j tpa.variables 0
execute store result score #has_illegal_char tpa.variables run function tpa:char_loop
execute if score #has_illegal_char tpa.variables matches 1 run scoreboard players set #error_code tpa.variables 5

data modify storage tpa:tpa temp.args.self set from storage tpa:tpa temp.key_commands[-1].commands[3]
execute store result score #name_len tpa.variables run data get storage tpa:tpa temp.args.self
scoreboard players set #j tpa.variables 0
execute store result score #has_illegal_char tpa.variables run function tpa:char_loop
execute if score #has_illegal_char tpa.variables matches 1 run scoreboard players set #error_code tpa.variables 5
execute if score #error_code tpa.variables matches 5 run function tpa:sounds/no
execute if score #error_code tpa.variables matches 5 run tellraw @s[scores={tpa.output=1..2}] [\
    {storage: "tpa:tpa", nbt: "temp.lang.header"}, \
    {storage: "tpa:tpa", nbt: "temp.lang.tp_pos_throw_on_invalid_char"}, "." \
]
execute if score #error_code tpa.variables matches 5 run title @s[scores={tpa.output=0..1}] actionbar [{storage: "tpa:tpa", nbt: "temp.lang.tp_pos_throw_on_invalid_char", color: "red"}]
execute if score #error_code tpa.variables matches 5 run return 0

execute store result score #x tpa.variables run data get storage tpa:tpa temp.key_commands[-1].commands[1]
execute store result score #y tpa.variables run data get storage tpa:tpa temp.key_commands[-1].commands[2]
execute store result score #z tpa.variables run data get storage tpa:tpa temp.key_commands[-1].commands[3]

execute store result score #x0 tpa.variables run data get entity @s Pos[0]
execute store result score #y0 tpa.variables run data get entity @s Pos[1]
execute store result score #z0 tpa.variables run data get entity @s Pos[2]

scoreboard players set #radius tpa.variables 0

scoreboard players operation #dx tpa.variables = #x tpa.variables
scoreboard players operation #dx tpa.variables -= #x0 tpa.variables
scoreboard players operation #dx tpa.variables *= #dx tpa.variables
scoreboard players operation #dy tpa.variables = #y tpa.variables
scoreboard players operation #dy tpa.variables -= #y0 tpa.variables
scoreboard players operation #dy tpa.variables *= #dy tpa.variables
scoreboard players operation #dz tpa.variables = #z tpa.variables
scoreboard players operation #dz tpa.variables -= #z0 tpa.variables
scoreboard players operation #dz tpa.variables *= #dz tpa.variables

scoreboard players operation #radius tpa.variables += #dx tpa.variables
scoreboard players operation #radius tpa.variables += #dy tpa.variables
scoreboard players operation #radius tpa.variables += #dz tpa.variables

scoreboard players operation #radius_compare tpa.variables = #tp_pos tpa.config
scoreboard players operation #radius_compare tpa.variables *= #tp_pos tpa.config
# Skip the radius compare if the radius is negative
execute if score #tp_pos tpa.config matches ..-1 run scoreboard players operation #radius tpa.variables = #radius_compare tpa.variables

execute if score #radius tpa.variables > #radius_compare tpa.variables run scoreboard players set #error_code tpa.variables 4 

execute if score #error_code tpa.variables matches 4 run function tpa:sounds/no
execute if score #error_code tpa.variables matches 4 run tellraw @s[scores={tpa.output=1..2}] [\
    {storage: "tpa:tpa", nbt: "temp.lang.header"}, \
    {storage: "tpa:tpa", nbt: "temp.lang.tp_pos_out_of_range"}, "." \
]
execute if score #error_code tpa.variables matches 4 run title @s[scores={tpa.output=0..1}] actionbar [{storage: "tpa:tpa", nbt: "temp.lang.tp_pos_out_of_range", color: "red"}]
execute if score #error_code tpa.variables matches 4 run return 0

data modify storage tpa:tpa temp.args.x set from storage tpa:tpa temp.key_commands[-1].commands[1]
data modify storage tpa:tpa temp.args.y set from storage tpa:tpa temp.key_commands[-1].commands[2]
data modify storage tpa:tpa temp.args.z set from storage tpa:tpa temp.key_commands[-1].commands[3]
function tpa:tp_pos/act with storage tpa:tpa temp.args
