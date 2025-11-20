# Called by: (Player) Any Operator
#! Never forget to edit tpa:initialize after adding option here

scoreboard players operation #target_lang tpa.variables = #language tpa.config
function tpa:load_lang

# Show warning messages if options is called by server terminal by showing visual item entity's name
summon item ~ ~ ~ {Item: {id: "stone", count: 1, components: {custom_data: {isOptionServerCallingItem: 1b}}}, PickupDelay: 32767s, Age: -32768s, Health: 0, NoGravity: true}
summon minecraft:text_display ~ ~ ~ {alignment:"center", Tags: ["tpa.text_display"]}
data modify entity @e[sort=nearest, limit=1, tag=tpa.text_display] text set value '["[TPA] ", {"storage": "tpa:tpa", "nbt": "loaded_lang.option_server_calling"}]'
data modify entity @e[sort=nearest, limit=1, nbt={Item: {components: {"minecraft:custom_data": {isOptionServerCallingItem: 1b}}}}] CustomName set from entity @e[sort=nearest, limit=1, tag=tpa.text_display] text 
kill @e[tag=tpa.text_display]
execute unless entity @s run say @e[sort=nearest, limit=1, nbt={Item: {components: {"minecraft:custom_data": {isOptionServerCallingItem: 1b}}}}]
execute unless entity @s run say Please modify configs in Client instead of Server terminal.
kill @e[nbt={Item: {components: {"minecraft:custom_data": {isOptionServerCallingItem: 1b}}}}]

tellraw @s [{"storage": "tpa:tpa", "nbt": "loaded_lang.option_title_line1"}]
tellraw @s [{"storage": "tpa:tpa", "nbt": "loaded_lang.option_title_line2"}]

tellraw @s ["  ", {"storage": "tpa:tpa", "nbt": "loaded_lang.option_version", "color": "aqua"}, ": ", {"storage": "tpa:tpa", "nbt": "option.version", "color": "green"}]
tellraw @s ["  ", {"storage": "tpa:tpa", "nbt": "loaded_lang.option_game_version", "color": "aqua"}, ": ", {"storage": "tpa:tpa", "nbt": "option.version_range", "color": "green"}]
tellraw @s ["  ", {"storage": "tpa:tpa", "nbt": "loaded_lang.option_current_game_version", "color": "aqua"}, ": ", {"storage": "tpa:tpa", "nbt": "option.game_version", "color": "green"}]

execute if score #debug_mode tpa.config matches 1 run \
    tellraw @s ["  ", {"storage": "tpa:tpa", "nbt": "loaded_lang.option_debug_mode", "color": "aqua"}, ": ", {"storage": "tpa:tpa", "nbt": "loaded_lang.option_enabled"}]
execute if score #debug_mode tpa.config matches 0 run \
    tellraw @s ["  ", {"storage": "tpa:tpa", "nbt": "loaded_lang.option_debug_mode", "color": "aqua"}, ": ", {"storage": "tpa:tpa", "nbt": "loaded_lang.option_disabled"}]
tellraw @s ["      §6- ", \
    {"storage": "tpa:tpa", "nbt": "loaded_lang.option_button_enable", "clickEvent":{"action":"run_command","value":"/scoreboard players set #debug_mode tpa.config 1"}},"|",\
    {"storage": "tpa:tpa", "nbt": "loaded_lang.option_button_disable", "clickEvent":{"action":"run_command","value":"/scoreboard players set #debug_mode tpa.config 0"}}]

execute if score #tp_spec tpa.config matches 1 run \
    tellraw @s ["  ", {"storage": "tpa:tpa", "nbt": "loaded_lang.option_tp_spec", "color": "aqua"}, ": ", {"storage": "tpa:tpa", "nbt": "loaded_lang.option_enabled"}]
execute if score #tp_spec tpa.config matches 0 run \
    tellraw @s ["  ", {"storage": "tpa:tpa", "nbt": "loaded_lang.option_tp_spec", "color": "aqua"}, ": ", {"storage": "tpa:tpa", "nbt": "loaded_lang.option_disabled"}]
tellraw @s ["      §6- ", \
    {"storage": "tpa:tpa", "nbt": "loaded_lang.option_button_enable", "clickEvent":{"action":"run_command","value":"/scoreboard players set #tp_spec tpa.config 1"}},"|",\
    {"storage": "tpa:tpa", "nbt": "loaded_lang.option_button_disable", "clickEvent":{"action":"run_command","value":"/scoreboard players set #tp_spec tpa.config 0"}}]

execute if score #compact_ids tpa.config matches 1 run \
    tellraw @s ["  ", {"storage": "tpa:tpa", "nbt": "loaded_lang.option_compact_ids", "color": "aqua"}, ": ", {"storage": "tpa:tpa", "nbt": "loaded_lang.option_enabled"}]
execute if score #compact_ids tpa.config matches 0 run \ 
    tellraw @s ["  ", {"storage": "tpa:tpa", "nbt": "loaded_lang.option_compact_ids", "color": "aqua"}, ": ", {"storage": "tpa:tpa", "nbt": "loaded_lang.option_disabled"}]
tellraw @s ["      §6- ", \
    {"storage": "tpa:tpa", "nbt": "loaded_lang.option_button_enable", "clickEvent":{"action":"run_command","value":"/scoreboard players set #compact_ids tpa.config 1"}},"|",\
    {"storage": "tpa:tpa", "nbt": "loaded_lang.option_button_disable", "clickEvent":{"action":"run_command","value":"/scoreboard players set #compact_ids tpa.config 0"}}]

execute if score #carpet_fake_player_fix tpa.config matches 1 run \
    tellraw @s ["  ", {"storage": "tpa:tpa", "nbt": "loaded_lang.option_carpet_fake_player_fix", "color": "aqua"}, ": ", {"storage": "tpa:tpa", "nbt": "loaded_lang.option_enabled"}]
execute if score #carpet_fake_player_fix tpa.config matches 0 run \
    tellraw @s ["  ", {"storage": "tpa:tpa", "nbt": "loaded_lang.option_carpet_fake_player_fix", "color": "aqua"}, ": ", {"storage": "tpa:tpa", "nbt": "loaded_lang.option_disabled"}]
tellraw @s ["      §6- ", \
    {"storage": "tpa:tpa", "nbt": "loaded_lang.option_button_enable", "clickEvent":{"action":"run_command","value":"/function tpa:fake_player_fix/enable"}},"|",\
    {"storage": "tpa:tpa", "nbt": "loaded_lang.option_button_disable", "clickEvent":{"action":"run_command","value":"/scoreboard players set #carpet_fake_player_fix tpa.config 0"}}]

execute if score #back tpa.config matches 1 run \
    tellraw @s ["  ", {"storage": "tpa:tpa", "nbt": "loaded_lang.option_back", "color": "aqua"}, ": ", {"storage": "tpa:tpa", "nbt": "loaded_lang.option_enabled"}]
execute if score #back tpa.config matches 0 run \
    tellraw @s ["  ", {"storage": "tpa:tpa", "nbt": "loaded_lang.option_back", "color": "aqua"}, ": ", {"storage": "tpa:tpa", "nbt": "loaded_lang.option_disabled"}]
tellraw @s ["      §6- ", \
    {"storage": "tpa:tpa", "nbt": "loaded_lang.option_button_enable", "clickEvent":{"action":"run_command","value":"/scoreboard players set #back tpa.config 1"}},"|",\
    {"storage": "tpa:tpa", "nbt": "loaded_lang.option_button_disable", "clickEvent":{"action":"run_command","value":"/scoreboard players set #back tpa.config 0"}}]

execute if score #search_id tpa.config matches 1 run \
    tellraw @s ["  ", {"storage": "tpa:tpa", "nbt": "loaded_lang.option_search_id", "color": "aqua"}, ": ", {"storage": "tpa:tpa", "nbt": "loaded_lang.option_enabled"}]
execute if score #search_id tpa.config matches 0 run \
    tellraw @s ["  ", {"storage": "tpa:tpa", "nbt": "loaded_lang.option_search_id", "color": "aqua"}, ": ", {"storage": "tpa:tpa", "nbt": "loaded_lang.option_disabled"}]
tellraw @s ["      §6- ", \
    {"storage": "tpa:tpa", "nbt": "loaded_lang.option_button_enable", "clickEvent":{"action":"run_command","value":"/scoreboard players set #search_id tpa.config 1"}},"|",\
    {"storage": "tpa:tpa", "nbt": "loaded_lang.option_button_disable", "clickEvent":{"action":"run_command","value":"/scoreboard players set #search_id tpa.config 0"}}]

execute if score #book tpa.config matches 1 run \
    tellraw @s ["  ", {"storage": "tpa:tpa", "nbt": "loaded_lang.option_book", "color": "aqua"}, ": ", {"storage": "tpa:tpa", "nbt": "loaded_lang.option_enabled"}]
execute if score #book tpa.config matches 0 run \
    tellraw @s ["  ", {"storage": "tpa:tpa", "nbt": "loaded_lang.option_book", "color": "aqua"}, ": ", {"storage": "tpa:tpa", "nbt": "loaded_lang.option_disabled"}]
tellraw @s ["      §6- ", \
    {"storage": "tpa:tpa", "nbt": "loaded_lang.option_button_enable", "clickEvent":{"action":"run_command","value":"/scoreboard players set #book tpa.config 1"}},"|",\
    {"storage": "tpa:tpa", "nbt": "loaded_lang.option_button_disable", "clickEvent":{"action":"run_command","value":"/scoreboard players set #book tpa.config 0"}}]

execute if score #player_lang tpa.config matches 1 run \
    tellraw @s ["  ", {"storage": "tpa:tpa", "nbt": "loaded_lang.option_player_lang", "color": "aqua"}, ": ", {"storage": "tpa:tpa", "nbt": "loaded_lang.option_enabled"}]
execute if score #player_lang tpa.config matches 0 run \
    tellraw @s ["  ", {"storage": "tpa:tpa", "nbt": "loaded_lang.option_player_lang", "color": "aqua"}, ": ", {"storage": "tpa:tpa", "nbt": "loaded_lang.option_disabled"}]
tellraw @s ["      §6- ", \
    {"storage": "tpa:tpa", "nbt": "loaded_lang.option_button_enable", "clickEvent":{"action":"run_command","value":"/scoreboard players set #player_lang tpa.config 1"}},"|",\
    {"storage": "tpa:tpa", "nbt": "loaded_lang.option_button_disable", "clickEvent":{"action":"run_command","value":"/scoreboard players set #player_lang tpa.config 0"}}]

execute if score #stricter_book_check tpa.config matches 1 run \
    tellraw @s ["  ", {"storage": "tpa:tpa", "nbt": "loaded_lang.option_stricter_book_check", "color": "aqua"}, ": ", {"storage": "tpa:tpa", "nbt": "loaded_lang.option_enabled"}]
execute if score #stricter_book_check tpa.config matches 0 run \
    tellraw @s ["  ", {"storage": "tpa:tpa", "nbt": "loaded_lang.option_stricter_book_check", "color": "aqua"}, ": ", {"storage": "tpa:tpa", "nbt": "loaded_lang.option_disabled"}]
tellraw @s ["      §6- ", \
    {"storage": "tpa:tpa", "nbt": "loaded_lang.option_button_enable", "clickEvent":{"action":"run_command","value":"/function tpa:book/track/enable"}},"|",\
    {"storage": "tpa:tpa", "nbt": "loaded_lang.option_button_disable", "clickEvent":{"action":"run_command","value":"/scoreboard players set #stricter_book_check tpa.config 0"}}]

# non-boolean values part:
tellraw @s ["  ", {"storage": "tpa:tpa", "nbt": "loaded_lang.option_lang", "color": "aqua", "hoverEvent": {"action": "show_text", "value": {"storage": "tpa:tpa", "nbt": "loaded_lang.option_lang_hoverevent"}}}, ": ", {"storage": "tpa:tpa", "nbt": "loaded_lang.name_display", "color": "white"}]
tellraw @s ["      §6- ", \
    {"storage": "tpa:tpa", "nbt": "loaded_lang.option_button_set", "clickEvent":{"action":"run_command","value":"/function tpa:option_lang_menu"}}]
tellraw @s ["  ", {"storage": "tpa:tpa", "nbt": "loaded_lang.option_home", "color": "aqua", "hoverEvent": {"action": "show_text", "value": {"storage": "tpa:tpa", "nbt": "loaded_lang.option_home_hoverevent"}}}, ": ", {"score":{"name":"#home","objective":"tpa.config"}, "color": "white"}]
tellraw @s ["      §6- ", \
    {"storage": "tpa:tpa", "nbt": "loaded_lang.option_button_set", "clickEvent":{"action":"suggest_command","value":"/scoreboard players set #home tpa.config "}}]
tellraw @s ["  ", {"storage": "tpa:tpa", "nbt": "loaded_lang.option_tp_pos", "color": "aqua", "hoverEvent": {"action": "show_text", "value": {"storage": "tpa:tpa", "nbt": "loaded_lang.option_tp_pos_hoverevent"}}}, ": ", {"score":{"name":"#tp_pos","objective":"tpa.config"}, "color": "white"}]
tellraw @s ["      §6- ", \
    {"storage": "tpa:tpa", "nbt": "loaded_lang.option_button_set", "clickEvent":{"action":"suggest_command","value":"/scoreboard players set #tp_pos tpa.config "}}]
tellraw @s ["  ", {"storage": "tpa:tpa", "nbt": "loaded_lang.option_tp_pos_cooldown", "color": "aqua", "hoverEvent": {"action": "show_text", "value": {"storage": "tpa:tpa", "nbt": "loaded_lang.option_tp_pos_cooldown_hoverevent"}}}, ": ", {"score":{"name":"#tp_pos_cooldown","objective":"tpa.config"}, "color": "white"}]
tellraw @s ["      §6- ", \
    {"storage": "tpa:tpa", "nbt": "loaded_lang.option_button_set", "clickEvent":{"action":"suggest_command","value":"/scoreboard players set #tp_pos_cooldown tpa.config "}}]
tellraw @s ["  ", {"storage": "tpa:tpa", "nbt": "loaded_lang.option_time_out", "color": "aqua", "hoverEvent": {"action": "show_text", "value": {"storage": "tpa:tpa", "nbt": "loaded_lang.option_time_out_hoverevent"}}}, ": ", {"score":{"name":"#time_out","objective":"tpa.config"}, "color": "white"}]
tellraw @s ["      §6- ", \
    {"storage": "tpa:tpa", "nbt": "loaded_lang.option_button_set", "clickEvent":{"action":"suggest_command","value":"/scoreboard players set #time_out tpa.config "}}]
tellraw @s ["  ", {"storage": "tpa:tpa", "nbt": "loaded_lang.option_idfix_cooldown", "color": "aqua", "hoverEvent": {"action": "show_text", "value": {"storage": "tpa:tpa", "nbt": "loaded_lang.option_idfix_cooldown_hoverevent"}}}, ": ", {"score":{"name":"#idfix_cooldown","objective":"tpa.config"}, "color": "white"}]
tellraw @s ["      §6- ", \
    {"storage": "tpa:tpa", "nbt": "loaded_lang.option_button_set", "clickEvent":{"action":"suggest_command","value":"/scoreboard players set #idfix_cooldown tpa.config "}}]
tellraw @s ["  ", {"storage": "tpa:tpa", "nbt": "loaded_lang.option_warp", "color": "aqua", "hoverEvent": {"action": "show_text", "value": {"storage": "tpa:tpa", "nbt": "loaded_lang.option_warp_hoverevent"}}}, ": ", {"score":{"name":"#warp","objective":"tpa.config"}, "color": "white", "hoverEvent": {"action": "show_text", "value": [{"storage": "tpa:tpa", "nbt": "loaded_lang.option_warp_number_hoverevent_leftpart"}, {"score":{"name":"#warp","objective":"tpa.config"}, "color": "white"}, {"storage": "tpa:tpa", "nbt": "loaded_lang.option_warp_number_hoverevent_rightpart"}]}}]
tellraw @s ["      §6- ", \
    {"storage": "tpa:tpa", "nbt": "loaded_lang.option_button_set", "clickEvent":{"action":"run_command","value":"/function tpa:warp/option"}}]
tellraw @s ["  ", {"storage": "tpa:tpa", "nbt": "loaded_lang.option_frequency", "color": "aqua", "hoverEvent": {"action": "show_text", "value": {"storage": "tpa:tpa", "nbt": "loaded_lang.option_frequency_hoverevent"}}}, ": ", {"score":{"name":"#frequency","objective":"tpa.config"}, "color": "white"}]
tellraw @s ["      §6- ", \
    {"text":"[§a20 Hz§r","clickEvent":{"action":"run_command","value":"/scoreboard players set #frequency tpa.config 20"}},"|",\
    {"text":"§a10 Hz§r","clickEvent":{"action":"run_command","value":"/scoreboard players set #frequency tpa.config 10"}},"|",\
    {"text":"§a5 Hz§r","clickEvent":{"action":"run_command","value":"/scoreboard players set #frequency tpa.config 5"}},"|",\
    {"text":"§a4 Hz§r", "clickEvent": {"action": "run_command", "value": "/scoreboard players set #frequency tpa.config 4"}},"|",\
    {"text":"§a2 Hz§r","clickEvent":{"action":"run_command","value":"/scoreboard players set #frequency tpa.config 2"}},"|",\
    {"text":"§a1 Hz§r","clickEvent":{"action":"run_command","value":"/scoreboard players set #frequency tpa.config 1"}},"|",\
    {"storage": "tpa:tpa", "nbt": "loaded_lang.option_button_disable","clickEvent":{"action":"run_command","value":"/scoreboard players set #frequency tpa.config 0"}}]

execute if score #debug_mode tpa.config matches 0 run tellraw @s ["  ", {"storage": "tpa:tpa", "nbt": "loaded_lang.option_advenced_tip"}]
execute if score #debug_mode tpa.config matches 1 run function tpa:options_advenced

tellraw @s [\
    "", \
    {"storage": "tpa:tpa", "nbt": "loaded_lang.option_button_uninstall","clickEvent":{"action":"run_command","value":"/function tpa:uninstall"},"hoverEvent":{"action":"show_text","value":{"storage": "tpa:tpa", "nbt": "loaded_lang.option_button_uninstall_hoverevent"}}}," ", \
    {"storage": "tpa:tpa", "nbt": "loaded_lang.option_button_update","clickEvent":{"action":"run_command","value":"/function tpa:update"},"hoverEvent":{"action":"show_text","value":{"storage": "tpa:tpa", "nbt": "loaded_lang.option_button_update_hoverevent"}}}," ",\
    {"storage": "tpa:tpa", "nbt": "loaded_lang.option_button_license","clickEvent":{"action":"run_command","value":"/function tpa:license"},"hoverEvent":{"action":"show_text","value":{"storage": "tpa:tpa", "nbt": "loaded_lang.option_button_license_hoverevent"}}}, " ", \
    {"storage": "tpa:tpa", "nbt": "loaded_lang.option_button_help","clickEvent":{"action":"run_command","value":"/function tpa:help"},"hoverEvent":{"action":"show_text","value":{"storage": "tpa:tpa", "nbt": "loaded_lang.option_button_help_hoverevent"}}}, " ", \
    {"storage": "tpa:tpa", "nbt": "loaded_lang.option_button_notworking","clickEvent":{"action":"run_command","value":"/function tpa:tick_not_working"},"hoverEvent":{"action":"show_text","value":{"storage": "tpa:tpa", "nbt": "loaded_lang.option_button_notworking_hoverevent"}}}\
]
tellraw @s ["====================================================="]