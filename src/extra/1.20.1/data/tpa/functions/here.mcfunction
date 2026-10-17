scoreboard players set @s tpa.here 0

function tpa:load_lang

scoreboard players set #error_code tpa.variables 0
execute if score #tp_spec tpa.config matches 0 if entity @s[gamemode=spectator] run scoreboard players set #error_code tpa.variables 1

execute if score #error_code tpa.variables matches 1 run function tpa:sounds/no
execute if score #error_code tpa.variables matches 1 run tellraw @s[scores={tpa.output=1..2}] [{"storage":"tpa:tpa", "nbt":"temp.lang.header"}, {"storage":"tpa:tpa", "nbt":"temp.lang.here_spec"}, ". "]
execute if score #error_code tpa.variables matches 1 run title @s[scores={tpa.output=0..1}] actionbar [{"storage":"tpa:tpa", "nbt":"temp.lang.here_spec", "color":"red"}]

execute if score #error_code tpa.variables matches 0 run function tpa:here/main
