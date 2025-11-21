#! Never forget to edit tpa:load after adding option here

scoreboard players operation #target_lang tpa.variables = #language tpa.config
function tpa:load_lang

tellraw @s [{storage: "tpa:tpa", nbt: "temp.lang.option_title_line1"}]
tellraw @s [{storage: "tpa:tpa", nbt: "temp.lang.option_title_line2"}]


execute if score #debug_mode tpa.config matches 1 run \
    tellraw @s ["  ", {storage: "tpa:tpa", nbt: "temp.lang.option_debug_mode", color: "aqua"}, ": ", {storage: "tpa:tpa", nbt: "temp.lang.option_enabled"}]
execute if score #debug_mode tpa.config matches 0 run \
    tellraw @s ["  ", {storage: "tpa:tpa", nbt: "temp.lang.option_debug_mode", color: "aqua"}, ": ", {storage: "tpa:tpa", nbt: "temp.lang.option_disabled"}]
tellraw @s ["      §6- ", \
    {storage: "tpa:tpa", nbt: "temp.lang.option_button_enable", click_event:{action:"run_command",command:"/scoreboard players set #debug_mode tpa.config 1"}},"|",\
    {storage: "tpa:tpa", nbt: "temp.lang.option_button_disable", click_event:{action:"run_command",command:"/scoreboard players set #debug_mode tpa.config 0"}}]

execute if score #tp_spec tpa.config matches 1 run \
    tellraw @s ["  ", {storage: "tpa:tpa", nbt: "temp.lang.option_tp_spec", color: "aqua"}, ": ", {storage: "tpa:tpa", nbt: "temp.lang.option_enabled"}]
execute if score #tp_spec tpa.config matches 0 run \
    tellraw @s ["  ", {storage: "tpa:tpa", nbt: "temp.lang.option_tp_spec", color: "aqua"}, ": ", {storage: "tpa:tpa", nbt: "temp.lang.option_disabled"}]
tellraw @s ["      §6- ", \
    {storage: "tpa:tpa", nbt: "temp.lang.option_button_enable", click_event:{action:"run_command",command:"/scoreboard players set #tp_spec tpa.config 1"}},"|",\
    {storage: "tpa:tpa", nbt: "temp.lang.option_button_disable", click_event:{action:"run_command",command:"/scoreboard players set #tp_spec tpa.config 0"}}]

execute if score #remove_offline tpa.config matches 1 run \
    tellraw @s ["  ", {storage: "tpa:tpa", nbt: "temp.lang.option_remove_offline", color: "aqua"}, ": ", {storage: "tpa:tpa", nbt: "temp.lang.option_enabled"}]
execute if score #remove_offline tpa.config matches 0 run \ 
    tellraw @s ["  ", {storage: "tpa:tpa", nbt: "temp.lang.option_remove_offline", color: "aqua"}, ": ", {storage: "tpa:tpa", nbt: "temp.lang.option_disabled"}]
tellraw @s ["      §6- ", \
    {storage: "tpa:tpa", nbt: "temp.lang.option_button_enable", click_event:{action:"run_command",command:"/scoreboard players set #remove_offline tpa.config 1"}},"|",\
    {storage: "tpa:tpa", nbt: "temp.lang.option_button_disable", click_event:{action:"run_command",command:"/scoreboard players set #remove_offline tpa.config 0"}}]

execute if score #carpet_fake_player_fix tpa.config matches 1 run \
    tellraw @s ["  ", {storage: "tpa:tpa", nbt: "temp.lang.option_carpet_fake_player_fix", color: "aqua"}, ": ", {storage: "tpa:tpa", nbt: "temp.lang.option_enabled"}]
execute if score #carpet_fake_player_fix tpa.config matches 0 run \
    tellraw @s ["  ", {storage: "tpa:tpa", nbt: "temp.lang.option_carpet_fake_player_fix", color: "aqua"}, ": ", {storage: "tpa:tpa", nbt: "temp.lang.option_disabled"}]
tellraw @s ["      §6- ", \
    {storage: "tpa:tpa", nbt: "temp.lang.option_button_enable", click_event:{action:"run_command",command:"/function tpa:fake_player/disable"}},"|",\
    {storage: "tpa:tpa", nbt: "temp.lang.option_button_disable", click_event:{action:"run_command",command:"/scoreboard players set #carpet_fake_player_fix tpa.config 0"}}]

execute if score #back tpa.config matches 1 run \
    tellraw @s ["  ", {storage: "tpa:tpa", nbt: "temp.lang.option_back", color: "aqua"}, ": ", {storage: "tpa:tpa", nbt: "temp.lang.option_enabled"}]
execute if score #back tpa.config matches 0 run \
    tellraw @s ["  ", {storage: "tpa:tpa", nbt: "temp.lang.option_back", color: "aqua"}, ": ", {storage: "tpa:tpa", nbt: "temp.lang.option_disabled"}]
tellraw @s ["      §6- ", \
    {storage: "tpa:tpa", nbt: "temp.lang.option_button_enable", click_event:{action:"run_command",command:"/scoreboard players set #back tpa.config 1"}},"|",\
    {storage: "tpa:tpa", nbt: "temp.lang.option_button_disable", click_event:{action:"run_command",command:"/scoreboard players set #back tpa.config 0"}}]

execute if score #search_id tpa.config matches 1 run \
    tellraw @s ["  ", {storage: "tpa:tpa", nbt: "temp.lang.option_search_id", color: "aqua"}, ": ", {storage: "tpa:tpa", nbt: "temp.lang.option_enabled"}]
execute if score #search_id tpa.config matches 0 run \
    tellraw @s ["  ", {storage: "tpa:tpa", nbt: "temp.lang.option_search_id", color: "aqua"}, ": ", {storage: "tpa:tpa", nbt: "temp.lang.option_disabled"}]
tellraw @s ["      §6- ", \
    {storage: "tpa:tpa", nbt: "temp.lang.option_button_enable", click_event:{action:"run_command",command:"/scoreboard players set #search_id tpa.config 1"}},"|",\
    {storage: "tpa:tpa", nbt: "temp.lang.option_button_disable", click_event:{action:"run_command",command:"/scoreboard players set #search_id tpa.config 0"}}]

execute if score #book tpa.config matches 1 run \
    tellraw @s ["  ", {storage: "tpa:tpa", nbt: "temp.lang.option_book", color: "aqua"}, ": ", {storage: "tpa:tpa", nbt: "temp.lang.option_enabled"}]
execute if score #book tpa.config matches 0 run \
    tellraw @s ["  ", {storage: "tpa:tpa", nbt: "temp.lang.option_book", color: "aqua"}, ": ", {storage: "tpa:tpa", nbt: "temp.lang.option_disabled"}]
tellraw @s ["      §6- ", \
    {storage: "tpa:tpa", nbt: "temp.lang.option_button_enable", click_event:{action:"run_command",command:"/scoreboard players set #book tpa.config 1"}},"|",\
    {storage: "tpa:tpa", nbt: "temp.lang.option_button_disable", click_event:{action:"run_command",command:"/scoreboard players set #book tpa.config 0"}}]

execute if score #player_lang tpa.config matches 1 run \
    tellraw @s ["  ", {storage: "tpa:tpa", nbt: "temp.lang.option_player_lang", color: "aqua"}, ": ", {storage: "tpa:tpa", nbt: "temp.lang.option_enabled"}]
execute if score #player_lang tpa.config matches 0 run \
    tellraw @s ["  ", {storage: "tpa:tpa", nbt: "temp.lang.option_player_lang", color: "aqua"}, ": ", {storage: "tpa:tpa", nbt: "temp.lang.option_disabled"}]
tellraw @s ["      §6- ", \
    {storage: "tpa:tpa", nbt: "temp.lang.option_button_enable", click_event:{action:"run_command", command:"/scoreboard players set #player_lang tpa.config 1"}},"|",\
    {storage: "tpa:tpa", nbt: "temp.lang.option_button_disable", click_event:{action:"run_command", command:"/scoreboard players set #player_lang tpa.config 0"}}]

# non-boolean values part:
tellraw @s ["  ", {storage: "tpa:tpa", nbt: "temp.lang.option_lang", color: "aqua", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "temp.lang.option_lang_hoverevent"}}}, ": ", {storage: "tpa:tpa", nbt: "temp.lang.name_display", color: "white"}]
tellraw @s ["      §6- ", \
    {storage: "tpa:tpa", nbt: "temp.lang.option_button_set", click_event:{action:"run_command",command:"/function tpa:option_lang_menu"}}]
tellraw @s ["  ", {storage: "tpa:tpa", nbt: "temp.lang.option_home", color: "aqua", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "temp.lang.option_home_hoverevent"}}}, ": ", {score:{"name":"#home","objective":"tpa.config"}, color: "white"}]
tellraw @s ["      §6- ", \
    {storage: "tpa:tpa", nbt: "temp.lang.option_button_set", click_event:{action:"suggest_command",command:"/scoreboard players set #home tpa.config "}}]
tellraw @s ["  ", {storage: "tpa:tpa", nbt: "temp.lang.option_tp_pos", color: "aqua", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "temp.lang.option_tp_pos_hoverevent"}}}, ": ", {score:{"name":"#tp_pos","objective":"tpa.config"}, color: "white"}]
tellraw @s ["      §6- ", \
    {storage: "tpa:tpa", nbt: "temp.lang.option_button_set", click_event:{action:"suggest_command",command:"/scoreboard players set #tp_pos tpa.config "}}]
tellraw @s ["  ", {storage: "tpa:tpa", nbt: "temp.lang.option_tp_pos_cooldown", color: "aqua", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "temp.lang.option_tp_pos_cooldown_hoverevent"}}}, ": ", {score:{"name":"#tp_pos_cooldown","objective":"tpa.config"}, color: "white"}]
tellraw @s ["      §6- ", \
    {storage: "tpa:tpa", nbt: "temp.lang.option_button_set", click_event:{action:"suggest_command",command:"/scoreboard players set #tp_pos_cooldown tpa.config "}}]
tellraw @s ["  ", {storage: "tpa:tpa", nbt: "temp.lang.option_time_out", color: "aqua", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "temp.lang.option_time_out_hoverevent"}}}, ": ", {score:{"name":"#time_out","objective":"tpa.config"}, color: "white"}]
tellraw @s ["      §6- ", \
    {storage: "tpa:tpa", nbt: "temp.lang.option_button_set", click_event:{action:"suggest_command",command:"/scoreboard players set #time_out tpa.config "}}]
tellraw @s ["  ", {storage: "tpa:tpa", nbt: "temp.lang.option_idfix_cooldown", color: "aqua", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "temp.lang.option_idfix_cooldown_hoverevent"}}}, ": ", {score:{"name":"#idfix_cooldown","objective":"tpa.config"}, color: "white"}]
tellraw @s ["      §6- ", \
    {storage: "tpa:tpa", nbt: "temp.lang.option_button_set", click_event:{action:"suggest_command",command:"/scoreboard players set #idfix_cooldown tpa.config "}}]
tellraw @s ["  ", {storage: "tpa:tpa", nbt: "temp.lang.option_frequency", color: "aqua", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "temp.lang.option_frequency_hoverevent"}}}, ": ", {score:{"name":"#frequency","objective":"tpa.config"}, color: "white"}]
tellraw @s ["      §6- ", \
    {text:"[§a20 Hz§r",click_event:{action:"run_command",command:"/scoreboard players set #frequency tpa.config 20"}},"|",\
    {text:"§a10 Hz§r",click_event:{action:"run_command",command:"/scoreboard players set #frequency tpa.config 10"}},"|",\
    {text:"§a5 Hz§r",click_event:{action:"run_command",command:"/scoreboard players set #frequency tpa.config 5"}},"|",\
    {text:"§a4 Hz§r", click_event: {action: "run_command", command: "/scoreboard players set #frequency tpa.config 4"}},"|",\
    {text:"§a2 Hz§r",click_event:{action:"run_command",command:"/scoreboard players set #frequency tpa.config 2"}},"|",\
    {text:"§a1 Hz§r",click_event:{action:"run_command",command:"/scoreboard players set #frequency tpa.config 1"}},"|",\
    {storage: "tpa:tpa", nbt: "temp.lang.option_button_disable",click_event:{action:"run_command",command:"/scoreboard players set #frequency tpa.config 0"}}]


tellraw @s [\
{storage: "tpa:tpa", nbt: "temp.lang.option_button_uninstall",click_event:{action:"run_command",command:"/function tpa:uninstall"},hover_event:{action:"show_text",value:{storage: "tpa:tpa", nbt: "temp.lang.option_button_uninstall_hoverevent"}}}," ", \
{storage: "tpa:tpa", nbt: "temp.lang.option_button_update",click_event:{action:"run_command",command:"/function tpa:update"},hover_event:{action:"show_text", value:{storage: "tpa:tpa", nbt: "temp.lang.option_button_update_hoverevent"}}}," ",\
{storage: "tpa:tpa", nbt: "temp.lang.option_button_license",click_event:{action:"run_command",command:"/function tpa:license"},hover_event:{action:"show_text", value:{storage: "tpa:tpa", nbt: "temp.lang.option_button_license_hoverevent"}}}, " ", \
{storage: "tpa:tpa", nbt: "temp.lang.option_button_help",click_event:{action:"run_command",command:"/function tpa:help"},hover_event:{action:"show_text", value:{storage: "tpa:tpa", nbt: "temp.lang.option_button_help_hoverevent"}}}]
tellraw @s ["====================================================="]
