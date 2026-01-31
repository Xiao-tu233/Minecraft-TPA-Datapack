# Parent function: tpa:options

tellraw @s {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.option_advenced_warn"}

execute if score #uses_tick_scheduling tpa.config matches 1 run \
    tellraw @s ["  ", {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.option_uses_tick_scheduling", color: "aqua"}, ": ", {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.option_enabled"}]
execute if score #uses_tick_scheduling tpa.config matches 0 run \
    tellraw @s ["  ", {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.option_uses_tick_scheduling", color: "aqua"}, ": ", {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.option_disabled"}]
tellraw @s ["      §6- ", \
    {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.option_button_enable", click_event:{action:"run_command",command:"/scoreboard players set #uses_tick_scheduling tpa.config 1"}},"|",\
    {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.option_button_disable", click_event:{action:"run_command",command:"/scoreboard players set #uses_tick_scheduling tpa.config 0"}}]

execute if score #uses_string_dimension tpa.config matches 1 run \
    tellraw @s ["  ", {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.option_uses_string_dimension", color: "aqua", hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.option_option_uses_string_dimension_hoverevent"}}}, ": ", {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.option_enabled"}]
execute if score #uses_string_dimension tpa.config matches 0 run \
    tellraw @s ["  ", {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.option_uses_string_dimension", color: "aqua", hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.option_option_uses_string_dimension_hoverevent"}}}, ": ", {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.option_disabled"}]
tellraw @s ["      §6- ", \
    {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.option_button_enable", click_event:{action:"run_command",command:"/scoreboard players set #uses_string_dimension tpa.config 1"}},"|",\
    {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.option_button_disable", click_event:{action:"run_command",command:"/scoreboard players set #uses_string_dimension tpa.config 0"}}]

tellraw @s ["  ", {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.option_dimension", color: "aqua", hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.option_dimension_hoverevent"}}}, ": ", {score:{name:"#dimension",objective:"tpa.config"}, color: "white", hover_event: {action: "show_text", value: [{interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.option_dimension_number_hoverevent_leftpart"}, {score:{name:"#dimension",objective:"tpa.config"}, color: "white"}, {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.option_dimension_number_hoverevent_rightpart"}]}}]
tellraw @s ["      §6- ", \
    {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.option_button_set", click_event:{action:"run_command",command:"/function tpa:dimension/menu"}}]

execute if score #uses_binary_teleport tpa.config matches 1 run \
    tellraw @s ["  ", {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.option_uses_binary_teleport", color: "aqua", hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.option_option_uses_binary_teleport_hoverevent"}}}, ": ", {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.option_enabled"}]
execute if score #uses_binary_teleport tpa.config matches 0 run \
    tellraw @s ["  ", {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.option_uses_binary_teleport", color: "aqua", hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.option_option_uses_binary_teleport_hoverevent"}}}, ": ", {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.option_disabled"}]
tellraw @s ["      §6- ", \
    {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.option_button_enable", click_event:{action:"run_command",command:"/scoreboard players set #uses_binary_teleport tpa.config 1"}},"|",\
    {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.option_button_disable", click_event:{action:"run_command",command:"/scoreboard players set #uses_binary_teleport tpa.config 0"}}]

tellraw @s ["  ", {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.option_sim_dist", color: "aqua", hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.option_sim_dist_hoverevent"}}}, ": ", {score:{name:"#sim_dist",objective:"tpa.config"}, color: "white"}]
tellraw @s ["      §6- ", {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.option_button_set", click_event:{action:"suggest_command",command:"/scoreboard players set #sim_dist tpa.config "}}, " ", {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.option_sim_dist_button_cal", click_event:{action:"run_command",command:"/function tpa:teleport/cal_sim_dist"}}]

tellraw @s ["  ", {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.option_anchor_search_retries", color: "aqua", hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.option_anchor_search_retries_hoverevent"}}}, ": ", {score:{name:"#anchor_search_retries",objective:"tpa.config"}, color: "white"}]
tellraw @s ["      §6- ", \
    {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.option_button_set", click_event:{action:"suggest_command",command:"/scoreboard players set #anchor_search_retries tpa.config "}}]

tellraw @s ["  ", {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.option_max_anchor_summons_attempts", color: "aqua", hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.option_max_anchor_summons_attempts_hoverevent"}}}, ": ", {score:{name:"#max_anchor_summons_attempts",objective:"tpa.config"}, color: "white"}]
tellraw @s ["      §6- ", \
    {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.option_button_set", click_event:{action:"suggest_command",command:"/scoreboard players set #max_anchor_summons_attempts tpa.config "}}]
