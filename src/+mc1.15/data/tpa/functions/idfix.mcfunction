scoreboard players set @s tpa.idfix 0
function tpa:load_lang

scoreboard players set #error_code tpa.variables 0
execute if score #idfix_cooldown tpa.config matches -1 run function tpa:sounds/no
execute if score #idfix_cooldown tpa.config matches -1 run tellraw @s[predicate=tpa:output/show_chatbar] [{"storage":"tpa:tpa", "nbt":"loaded_lang.header"}, {"storage":"tpa:tpa", "nbt":"loaded_lang.idfix_disabled"}, ". "]
execute if score #idfix_cooldown tpa.config matches -1 run title @s[predicate=tpa:output/show_actionbar] actionbar [{"storage":"tpa:tpa", "nbt":"loaded_lang.idfix_disabled", "color":"red"}]
execute if score #idfix_cooldown tpa.config matches -1 run scoreboard players set #error_code tpa.variables 1

execute if score @s tpa.idfix_cd matches 1.. run function tpa:sounds/no
execute if score @s tpa.idfix_cd matches 1.. run tellraw @s[predicate=tpa:output/show_chatbar] [{"storage":"tpa:tpa", "nbt":"loaded_lang.header"}, {"storage":"tpa:tpa", "nbt":"loaded_lang.idfix_cooldown"}, ". "]
execute if score @s tpa.idfix_cd matches 1.. run title @s[predicate=tpa:output/show_actionbar] actionbar [{"storage":"tpa:tpa", "nbt":"loaded_lang.idfix_cooldown", "color":"red"}]
execute if score @s tpa.idfix_cd matches 1.. run scoreboard players set #error_code tpa.variables 1

execute if score #error_code tpa.variables matches 0 run function tpa:idfix/main