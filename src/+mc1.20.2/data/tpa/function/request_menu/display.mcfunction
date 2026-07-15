# Parent function: tpa:request_menu/open

tellraw @s[predicate=tpa:output/show_chatbar] [{interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.header"}, {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_title"}]
tellraw @s[predicate=tpa:output/show_chatbar] [" ", {storage: "tpa:tpa", nbt: "temp.request_menu.display[]", interpret: true, separator: ""}]

execute if score #request_menu.direction tpa.variables matches 0 run function tpa:request_menu/display/tpa
execute if score #request_menu.direction tpa.variables matches 1 run function tpa:request_menu/display/tpahere
