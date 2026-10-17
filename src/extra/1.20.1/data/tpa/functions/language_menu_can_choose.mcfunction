# Parent function: tpa:language_menu
# Show title
execute unless score #is_server_selecting tpa.variables matches 1 run tellraw @s[predicate=tpa:output/show_chatbar] [{"storage": "tpa:tpa", "nbt": "loaded_lang.header"}, {"storage": "tpa:tpa", "nbt": "loaded_lang.lang_menu_title"}, "\n", {"storage": "tpa:tpa", "nbt": "loaded_lang.lang_menu_select_button","clickEvent": {"action": "suggest_command", "value": "/trigger tpa.language set " }, "hoverEvent": {"action": "show_text", "value": {"storage": "tpa:tpa", "nbt": "loaded_lang.lang_menu_cancel_button_hoverevent"} } } ]
execute if score #is_server_selecting tpa.variables matches 1 run tellraw @s [{"storage": "tpa:tpa", "nbt": "loaded_lang.header"}, {"storage": "tpa:tpa", "nbt": "loaded_lang.lang_menu_title"}, "\n", {"storage": "tpa:tpa", "nbt": "loaded_lang.lang_button_server","clickEvent": {"action": "suggest_command", "value": "/scoreboard players set #language tpa.config " }, "hoverEvent": {"action": "show_text", "value": {"storage": "tpa:tpa", "nbt": "loaded_lang.lang_menu_select_button_hoverevent"} } } ]

# Init enum vars
scoreboard players set #i tpa.variables 0
data remove storage tpa:tpa loaded_language
data modify storage tpa:tpa loaded_language set from storage tpa:tpa lang
execute store result score #langs_installed tpa.variables run data get storage tpa:tpa lang

# Remove language 0, cuz which was designed to be unchoosable
data remove storage tpa:tpa loaded_language[0]

# Call loop function
function tpa:language_menu_loop