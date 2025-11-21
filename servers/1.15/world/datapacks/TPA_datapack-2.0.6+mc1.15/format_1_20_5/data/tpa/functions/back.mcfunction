scoreboard players set @s tpa.back 0
scoreboard players set @s back 0
function tpa:load_lang

scoreboard players set #error_code tpa.variables 0
execute store result score #error_code tpa.variables run function tpa:back/container

execute if score #error_code tpa.variables matches 1.. run function tpa:sounds/no
# error codes:
# 0 - success
# 1 - back disabled
# 2 - spec
# 3 - not exist

execute if score #error_code tpa.variables matches 1 \
    run tellraw @s[scores={tpa.output=1..2}] [{"storage":"tpa:tpa", "nbt":"temp.lang.header"}, {"storage":"tpa:tpa", "nbt":"temp.lang.back_disabled"}, ". "]
execute if score #error_code tpa.variables matches 1 \
    run title @s[scores={tpa.output=0..1}] actionbar [{"storage":"tpa:tpa", "nbt":"temp.lang.back_disabled", "color":"red"}]

execute if score #error_code tpa.variables matches 2 \
    run tellraw @s[scores={tpa.output=1..2}] [{"storage":"tpa:tpa", "nbt":"temp.lang.header"}, {"storage":"tpa:tpa", "nbt":"temp.lang.back_spec"}, ". "]
execute if score #error_code tpa.variables matches 2 \
    run title @s[scores={tpa.output=0..1}] actionbar [{"storage":"tpa:tpa", "nbt":"temp.lang.back_spec", "color":"red"}]

execute if score #error_code tpa.variables matches 3 \
    run tellraw @s[scores={tpa.output=1..2}] [{"storage":"tpa:tpa", "nbt":"temp.lang.header"}, {"storage":"tpa:tpa", "nbt":"temp.lang.back_not_exist"}, ". "]
execute if score #error_code tpa.variables matches 3 \
    run title @s[scores={tpa.output=0..1}] actionbar [{"storage":"tpa:tpa", "nbt":"temp.lang.back_not_exist", "color":"red"}]