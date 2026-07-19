# Parent function: tpa:request_menu/display/tpa, tpa:request_menu/display/tpahere

execute if data storage tpa:tpa loaded_lang.tpa_menu_no_available_player run tellraw @s[predicate=tpa:output/show_chatbar] [" ", {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_no_available_player", color: "gray"}]
execute unless data storage tpa:tpa loaded_lang.tpa_menu_no_available_player run tellraw @s[predicate=tpa:output/show_chatbar] [" ", {text: "没有可用的玩家ID", color: "gray"}]
