scoreboard players set #error_code tpa.variables 0
execute if score #tp_spec tpa.config matches 0 if entity @s[gamemode=spectator] run scoreboard players set #error_code tpa.variables 1
execute if score #home tpa.config matches 0 run scoreboard players set #error_code tpa.variables 2
execute if score #error_code tpa.variables matches 1..2 run function tpa:sounds/no
execute if score #error_code tpa.variables matches 1 \
    run tellraw @s[scores={tpa.output=1..2}] [{storage:"tpa:tpa", nbt:"temp.lang.header"}, {storage:"tpa:tpa", nbt:"temp.lang.home_spec"}, ". "]
execute if score #error_code tpa.variables matches 1 \
    run title @s[scores={tpa.output=0..1}] actionbar [{storage:"tpa:tpa", nbt:"temp.lang.home_spec", color:"red"}]
execute if score #error_code tpa.variables matches 2 \
    run tellraw @s[scores={tpa.output=1..2}] [{storage:"tpa:tpa", nbt:"temp.lang.header"}, {storage:"tpa:tpa", nbt:"temp.lang.home_disabled"}, ". "]
execute if score #error_code tpa.variables matches 2 \
    run title @s[scores={tpa.output=0..1}] actionbar [{storage:"tpa:tpa", nbt:"temp.lang.home_disabled", color:"red"}]