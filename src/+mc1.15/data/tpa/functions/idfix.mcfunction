scoreboard players set @s tpa.idfix 0
scoreboard players set #condition tpa.variables 0

execute if score #idfix_cooldown tpa.config matches -1 run scoreboard players set #condition tpa.variables 1
execute if score @s tpa.idfix_cd matches 1.. run scoreboard players set #condition tpa.variables 2

function tpa:load_lang

execute if score #condition tpa.variables matches 1 run function tpa:sounds/no
execute if score #condition tpa.variables matches 1 run tellraw @s[scores={tpa.output=1..2}] [{"storage":"tpa:tpa", "nbt":"temp.lang.header"}, {"storage":"tpa:tpa", "nbt":"temp.lang.idfix_disabled"}, ". "]
execute if score #condition tpa.variables matches 1 run title @s[scores={tpa.output=0..1}] actionbar [{"storage":"tpa:tpa", "nbt":"temp.lang.idfix_disabled", "color":"red"}]

execute if score #condition tpa.variables matches 2 run function tpa:sounds/no
execute if score #condition tpa.variables matches 2 run tellraw @s[scores={tpa.output=1..2}] [{"storage":"tpa:tpa", "nbt":"temp.lang.header"}, {"storage":"tpa:tpa", "nbt":"temp.lang.idfix_cooldown"}, ". "]
execute if score #condition tpa.variables matches 2 run title @s[scores={tpa.output=0..1}] actionbar [{"storage":"tpa:tpa", "nbt":"temp.lang.idfix_cooldown", "color":"red"}]

execute if score #condition tpa.variables matches 0 run function tpa:idfix/main