# Parent functin: tpa:home/menu/has_home
data modify storage tpa:tpa temp.output.button_add.brackets set value ["[", "]"]

data modify storage tpa:tpa temp.output.button_add.label set value []
data modify storage tpa:tpa temp.output.button_add.label append from storage tpa:tpa loaded_lang.home_button_add[0]
scoreboard players operation #home.add_index tpa.variables = #home.max_id tpa.variables
scoreboard players add #home.add_index tpa.variables 1
execute store result storage tpa:tpa temp.output.add_index int 1 run scoreboard players get #home.add_index tpa.variables
data modify storage tpa:tpa temp.output.button_add.label append string storage tpa:tpa temp.output.add_index
execute if score #home tpa.config matches 1.. run function tpa:home/menu/prepare_add_button/limit
data modify storage tpa:tpa temp.output.button_add.label append from storage tpa:tpa loaded_lang.home_button_add[1]

data modify storage tpa:tpa temp.output.button_add.tooltip set from storage tpa:tpa loaded_lang.home_button_add_hoverevent