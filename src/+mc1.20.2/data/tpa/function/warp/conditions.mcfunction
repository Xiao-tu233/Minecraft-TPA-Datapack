scoreboard players set #error_code tpa.variables 0
execute if score #tp_spec tpa.config matches 0 if entity @s[gamemode=spectator] run scoreboard players set #error_code tpa.variables 1
execute if score #error_code tpa.variables matches 1 run function tpa:sounds/no
execute if score #error_code tpa.variables matches 1 \
    run tellraw @s[predicate=tpa:output/show_chatbar] [{interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.header"}, {interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.warp_spec"}, ". "]
execute if score #error_code tpa.variables matches 1 \
    run title @s[predicate=tpa:output/show_actionbar] actionbar [{interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.warp_spec", color:"red"}]