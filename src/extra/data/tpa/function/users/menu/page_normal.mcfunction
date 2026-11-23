# Parent function: tpa:users/menu

execute store result score #users.selector_index_format tpa.variables run data get storage tpa:tpa loaded_lang.users_selector_index_format

data modify storage tpa:tpa temp.output.menu.body.contents append from storage tpa:tpa loaded_lang.users_selector_index[0]
execute if score #users.selector_index_format tpa.variables matches 0 run function tpa:users/menu/menu_index_parser/arg_1
execute if score #users.selector_index_format tpa.variables matches 1 run function tpa:users/menu/menu_index_parser/arg_2
data modify storage tpa:tpa temp.output.menu.body.contents append from storage tpa:tpa loaded_lang.users_selector_index[1]
execute if score #users.selector_index_format tpa.variables matches 0 run function tpa:users/menu/menu_index_parser/arg_2
execute if score #users.selector_index_format tpa.variables matches 1 run function tpa:users/menu/menu_index_parser/arg_1
data modify storage tpa:tpa temp.output.menu.body.contents append from storage tpa:tpa loaded_lang.users_selector_index[2]