# Parent functin: tpa:home/menu/has_home
data modify storage tpa:tpa temp.output.button_add.brackets set value ["[", "]"]
execute store result score #home.button_add_format tpa.variables run data get storage tpa:tpa loaded_lang.home_button_add_format
scoreboard players operation #home.add_index tpa.variables = #home.max_id tpa.variables
scoreboard players add #home.add_index tpa.variables 1
execute store result storage tpa:tpa temp.output.add_index int 1 run scoreboard players get #home.add_index tpa.variables
execute store result storage tpa:tpa temp.output.add_limit int 1 run scoreboard players get #home tpa.config

data modify storage tpa:tpa temp.output.button_add.label set from storage tpa:tpa loaded_lang.home_button_add
execute if score #home.button_add_format tpa.variables matches 0 run data modify storage tpa:tpa temp.output.button_add.label insert 1 string storage tpa:tpa temp.output.add_index
execute if score #home.button_add_format tpa.variables matches 1 run data modify storage tpa:tpa temp.output.button_add.label insert 1 string storage tpa:tpa temp.output.add_limit
execute if score #home.button_add_format tpa.variables matches 0 run data modify storage tpa:tpa temp.output.button_add.label insert 3 string storage tpa:tpa temp.output.add_limit
execute if score #home.button_add_format tpa.variables matches 1 run data modify storage tpa:tpa temp.output.button_add.label insert 3 string storage tpa:tpa temp.output.add_index

data modify storage tpa:tpa temp.output.button_add.tooltip set from storage tpa:tpa loaded_lang.home_button_add_hoverevent