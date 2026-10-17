scoreboard players set #error_code tpa.variables 0
execute if score #tp_spec tpa.config matches 0 if entity @s[gamemode=spectator] run scoreboard players set #error_code tpa.variables 1
execute if score #home tpa.config matches 0 run scoreboard players set #error_code tpa.variables 2
execute if score #home tpa.variables > #home tpa.config unless score #home tpa.config matches ..-1 run scoreboard players set #error_code tpa.variables 3
execute if score #error_code tpa.variables matches 1..3 run function tpa:sounds/no
execute if score #error_code tpa.variables matches 1 run tellraw @s[predicate=tpa:output/show_chatbar] [{"storage":"tpa:tpa", "nbt":"loaded_lang.header"}, {"storage":"tpa:tpa", "nbt":"loaded_lang.home_spec"}, ". "]
execute if score #error_code tpa.variables matches 1 run title @s[predicate=tpa:output/show_actionbar] actionbar [{"storage":"tpa:tpa", "nbt":"loaded_lang.home_spec", "color":"red"}]
execute if score #error_code tpa.variables matches 2 run tellraw @s[predicate=tpa:output/show_chatbar] [{"storage":"tpa:tpa", "nbt":"loaded_lang.header"}, {"storage":"tpa:tpa", "nbt":"loaded_lang.home_disabled"}, ". "]
execute if score #error_code tpa.variables matches 2 run title @s[predicate=tpa:output/show_actionbar] actionbar [{"storage":"tpa:tpa", "nbt":"loaded_lang.home_disabled", "color":"red"}]
execute if score #error_code tpa.variables matches 3 run tellraw @s[predicate=tpa:output/show_chatbar] [{"storage":"tpa:tpa", "nbt":"loaded_lang.header"}, {"storage":"tpa:tpa", "nbt":"loaded_lang.home_out_of_range_left_part"}, {"score":{"name": "#home", "objective": "tpa.variables"}}, {"storage":"tpa:tpa", "nbt":"loaded_lang.home_out_of_range_right_part"}, ". " ]
execute if score #error_code tpa.variables matches 3 run title @s[predicate=tpa:output/show_actionbar] actionbar [ {"storage":"tpa:tpa", "nbt":"loaded_lang.home_out_of_range_left_part", "color": "red"}, {"score":{"name": "#home", "objective": "tpa.variables"}, "color": "red"}, {"storage":"tpa:tpa", "nbt":"loaded_lang.home_out_of_range_right_part", "color": "red"} ]

# #error_code:
# 0 - no error so far
# 1 - player is spectator
# 2 - home is disabled
# 3 - player is out of range of home