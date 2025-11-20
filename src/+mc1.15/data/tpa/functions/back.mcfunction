scoreboard players set @s tpa.back 0
scoreboard players set @s back 0

function tpa:load_lang

scoreboard players set #error_code tpa.variables 0
execute if score #back tpa.config matches 1 run scoreboard players set #error_code tpa.variables 1
execute if score #tp_spec tpa.config matches 0 if entity @s[gamemode=spectator] run scoreboard players set #error_code tpa.variables 2

execute if score #error_code tpa.variables matches 0 run function tpa:back/pop
execute unless data storage tpa:tpa temp.back_got run scoreboard players set #error_code tpa.variables 3

execute if score #error_code tpa.variables matches 1..3 run function tpa:sounds/no

execute if score #error_code tpa.variables matches 0 run function tpa:back/act
execute if score #error_code tpa.variables matches 1 run tellraw @s[scores={tpa.output=1..2}] [{"storage":"tpa:tpa", "nbt":"temp.lang.header"}, {"storage":"tpa:tpa", "nbt":"temp.lang.back_disabled"}, ". "]
execute if score #error_code tpa.variables matches 1 run title @s[scores={tpa.output=0..1}] actionbar [{"storage":"tpa:tpa", "nbt":"temp.lang.back_disabled", "color":"red"}]
execute if score #error_code tpa.variables matches 2 run tellraw @s[scores={tpa.output=1..2}] [{"storage":"tpa:tpa", "nbt":"temp.lang.header"}, {"storage":"tpa:tpa", "nbt":"temp.lang.back_spec"}, ". "]
execute if score #error_code tpa.variables matches 2 run title @s[scores={tpa.output=0..1}] actionbar [{"storage":"tpa:tpa", "nbt":"temp.lang.back_spec", "color":"red"}]
execute if score #error_code tpa.variables matches 3 run tellraw @s[scores={tpa.output=1..2}] [{"storage":"tpa:tpa", "nbt":"temp.lang.header"}, {"storage":"tpa:tpa", "nbt":"temp.lang.back_not_exist"}, ". "]
execute if score #error_code tpa.variables matches 3 run title @s[scores={tpa.output=0..1}] actionbar [{"storage":"tpa:tpa", "nbt":"temp.lang.back_not_exist", "color":"red"}]

# function tpa:back/push_confirm
# data get storage tpa:tpa back