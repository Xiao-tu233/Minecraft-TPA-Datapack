# Parent function: tpa:warp/option, tpa:tick(When player triggers tpa.warp to -1), Quoted by: tpa:tpa_menu

# Storage Format:
# {desc: string, name: string, x: int, y: int, z: int, dim: Dimension, disabled: boolean, index: int}

scoreboard players set #warp_menu_open tpa.variables 1

# Load language, title
function tpa:load_lang

# Sort warp with index key to fit the order
function tpa:warp/ensure_index

# Check enable status
scoreboard players operation #warp tpa.variables = #editting_warp tpa.variables
scoreboard players set #op tpa.variables 0
function tpa:warp/iterator/main
execute store result score #warp_disabled tpa.variables run data get storage tpa:tpa temp.warp.disabled


# Load the warp data
execute if score #is_editting_warp tpa.variables matches 1 run function tpa:warp/load_edit_buttons

# Refresh warp count: warp = len(warp) - 1
execute store result score #warp tpa.config run data get storage tpa:tpa warp
scoreboard players remove #warp tpa.config 1

# int i = 0; i++; temp.warp.pop()
data modify storage tpa:tpa temp.warp set from storage tpa:tpa warp
data remove storage tpa:tpa temp.warp[0]
scoreboard players set #i tpa.variables 1

# Show title if there is at least one warp
execute unless score #is_editting_warp tpa.variables matches 1 if data storage tpa:tpa temp.warp[0] run function tpa:sounds/levelup
scoreboard players set #if_display_warp_menu_title tpa.variables 1
execute unless score #is_editting_warp tpa.variables matches 1 unless data storage tpa:tpa temp.warp[0] run scoreboard players set #if_display_warp_menu_title tpa.variables 0
execute if score #if_display_warp_menu_title tpa.variables matches 1 run tellraw @s [{"storage":"tpa:tpa", "nbt":"loaded_lang.header"}, {"storage":"tpa:tpa", "nbt":"loaded_lang.warp_menu_title"}]
execute unless score #if_display_warp_menu_title tpa.variables matches 1 run function tpa:warp/disabled
execute if score #is_editting_warp tpa.variables matches 1 run tellraw @s [{"storage":"tpa:tpa", "nbt":"loaded_lang.warp_menu_edit_tip"}]
execute if score #is_editting_warp tpa.variables matches 1 if score #editting_warp tpa.variables matches 1.. if score #warp_disabled tpa.variables matches 0 run tellraw @s ["  ", {"storage": "tpa:tpa", "nbt": "loaded_lang.warp_button_setpos", "hoverEvent": {"action": "show_text", "value": {"storage": "tpa:tpa", "nbt": "loaded_lang.warp_button_setpos_hoverevent"}}, "clickEvent": {"action": "run_command","value": "/function tpa:warp/setpos"}}, " ", {"storage": "tpa:tpa", "nbt": "loaded_lang.warp_button_setname", "hoverEvent": {"action": "show_text", "value": {"storage": "tpa:tpa", "nbt": "loaded_lang.warp_button_setname_hoverevent"}},"clickEvent": {"action": "suggest_command","value": "/data modify storage tpa:tpa temp.editted_warp.name set value \"\""}}, " ", {"storage": "tpa:tpa", "nbt": "loaded_lang.warp_button_setdesc", "hoverEvent": {"action": "show_text", "value": {"storage": "tpa:tpa", "nbt": "loaded_lang.warp_button_setdesc_hoverevent"}},"clickEvent": {"action": "suggest_command","value": "/data modify storage tpa:tpa temp.editted_warp.desc set value \"\""}}, " ", {"storage": "tpa:tpa", "nbt": "loaded_lang.warp_button_disable", "hoverEvent": {"action": "show_text", "value": {"storage": "tpa:tpa", "nbt": "loaded_lang.warp_button_disable_hoverevent"}},"clickEvent": {"action": "run_command","value": "/function tpa:warp/disable"}}, " ", {"storage": "tpa:tpa", "nbt": "loaded_lang.warp_button_apply", "hoverEvent": {"action": "show_text", "value": {"storage": "tpa:tpa", "nbt": "loaded_lang.warp_button_apply_hoverevent"}},"clickEvent": {"action": "run_command","value": "/function tpa:warp/apply"}}, " ", {"storage": "tpa:tpa", "nbt": "loaded_lang.warp_button_rm", "hoverEvent": {"action": "show_text", "value": {"storage": "tpa:tpa", "nbt": "loaded_lang.warp_button_rm_hoverevent"}},"clickEvent": {"action": "run_command","value": "/function tpa:warp/remove"}}, " ", {"storage": "tpa:tpa", "nbt": "loaded_lang.warp_button_cancel", "hoverEvent": {"action": "show_text", "value": {"storage": "tpa:tpa", "nbt": "loaded_lang.warp_button_cancel_hoverevent"}},"clickEvent": {"action": "run_command","value": "/function tpa:warp/cancel"}}]
execute if score #is_editting_warp tpa.variables matches 1 if score #editting_warp tpa.variables matches 1.. if score #warp_disabled tpa.variables matches 1 run tellraw @s ["  ", {"storage": "tpa:tpa", "nbt": "loaded_lang.warp_button_setpos", "hoverEvent": {"action": "show_text", "value": {"storage": "tpa:tpa", "nbt": "loaded_lang.warp_button_setpos_hoverevent"}}, "clickEvent": {"action": "run_command","value": "/function tpa:warp/setpos"}}, " ", {"storage": "tpa:tpa", "nbt": "loaded_lang.warp_button_setname", "hoverEvent": {"action": "show_text", "value": {"storage": "tpa:tpa", "nbt": "loaded_lang.warp_button_setname_hoverevent"}},"clickEvent": {"action": "suggest_command","value": "/data modify storage tpa:tpa temp.editted_warp.name set value \"\""}}, " ", {"storage": "tpa:tpa", "nbt": "loaded_lang.warp_button_setdesc", "hoverEvent": {"action": "show_text", "value": {"storage": "tpa:tpa", "nbt": "loaded_lang.warp_button_setdesc_hoverevent"}},"clickEvent": {"action": "suggest_command","value": "/data modify storage tpa:tpa temp.editted_warp.desc set value \"\""}}, " ", {"storage": "tpa:tpa", "nbt": "loaded_lang.warp_button_enable", "hoverEvent": {"action": "show_text", "value": {"storage": "tpa:tpa", "nbt": "loaded_lang.warp_button_enable_hoverevent"}},"clickEvent": {"action": "run_command","value": "/function tpa:warp/enable"}}, " ", {"storage": "tpa:tpa", "nbt": "loaded_lang.warp_button_apply", "hoverEvent": {"action": "show_text", "value": {"storage": "tpa:tpa", "nbt": "loaded_lang.warp_button_apply_hoverevent"}},"clickEvent": {"action": "run_command","value": "/function tpa:warp/apply"}}, " ", {"storage": "tpa:tpa", "nbt": "loaded_lang.warp_button_rm", "hoverEvent": {"action": "show_text", "value": {"storage": "tpa:tpa", "nbt": "loaded_lang.warp_button_rm_hoverevent"}},"clickEvent": {"action": "run_command","value": "/function tpa:warp/remove"}}, " ", {"storage": "tpa:tpa", "nbt": "loaded_lang.warp_button_cancel", "hoverEvent": {"action": "show_text", "value": {"storage": "tpa:tpa", "nbt": "loaded_lang.warp_button_cancel_hoverevent"}},"clickEvent": {"action": "run_command","value": "/function tpa:warp/cancel"}}]

# Loop
execute if data storage tpa:tpa temp.warp[0] run function tpa:warp/show_each

execute store result storage tpa:tpa temp.args.index int 1 run scoreboard players get #i tpa.variables
execute if score #is_editting_warp tpa.variables matches 1 run tellraw @s ["  ", {"storage": "tpa:tpa", "nbt": "warp[0].warp_button_add","hoverEvent":{"action":"show_text","value":{"storage": "tpa:tpa", "nbt": "loaded_lang.warp_button_add_hoverevent"}},"clickEvent":{"action":"run_command","value":"/function tpa:warp/add"}}]

# Remove button display for non-OPs
scoreboard players set #is_editting_warp tpa.variables 0
data modify storage tpa:tpa warp[0] set value {}

# Tag self for selection
tag @s add tpa.warp_editor