# Parent function: tpa:warp

scoreboard players set #error_code tpa.variables 0
execute if score #tp_spec tpa.config matches 0 if entity @s[gamemode=spectator] run scoreboard players set #error_code tpa.variables 1

execute if score #warp tpa.variables > #warp tpa.config unless score #warp tpa.config matches ..-1 run scoreboard players set #error_code tpa.variables 2

execute if score #error_code tpa.variables matches 1.. run function tpa:sounds/no

execute if score #error_code tpa.variables matches 1 run tellraw @s[predicate=tpa:output/show_chatbar] [{"storage":"tpa:tpa", "nbt":"loaded_lang.header"}, {"storage":"tpa:tpa", "nbt":"loaded_lang.warp_spec"}, ". "]
execute if score #error_code tpa.variables matches 1 run title @s[predicate=tpa:output/show_actionbar] actionbar [{"storage":"tpa:tpa", "nbt":"loaded_lang.warp_spec", "color":"red"}]

# Check if warp is in range
execute if score #error_code tpa.variables matches 2 run tellraw @s[predicate=tpa:output/show_chatbar] [{"storage":"tpa:tpa", "nbt":"loaded_lang.header"}, {"storage":"tpa:tpa", "nbt":"loaded_lang.warp_out_of_range"}, ". " ]
execute if score #error_code tpa.variables matches 2 run title @s[predicate=tpa:output/show_actionbar] actionbar [ {"storage":"tpa:tpa", "nbt":"loaded_lang.warp_out_of_range", "color": "red"} ]