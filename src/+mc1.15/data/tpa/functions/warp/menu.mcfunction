# Parent function: tpa:warp/option, tpa:tick(When player triggers tpa.warp to -1), Quoted by: tpa:tpa_menu

# Storage Format:
# {desc: string, name: string, x: int, y: int, z: int, dimension: Dimension, disabled: boolean, index: int}

scoreboard players set #warp_menu_open tpa.variables 0

# Load language, title
function tpa:load_lang

# Sort warp with index key to fit the order
function tpa:warp/ensure_index

# Load the warp data
execute if score #is_editting_warp tpa.variables matches 1 run function tpa:warp/load_edit_buttons

data modify storage tpa:tpa temp.warp set from storage tpa:tpa warp

# Refresh warp count: warp = len(warp) - 1
execute store result score #warp tpa.config run data get storage tpa:tpa warp
scoreboard players remove #warp tpa.config 1

# int i = 0; i++; temp.warp.pop()
data remove storage tpa:tpa temp.warp[0]
scoreboard players set #i tpa.variables 1

# Show title if there is at least one warp
execute unless score #is_editting_warp tpa.variables matches 1 if data storage tpa:tpa temp.warp[0] run function tpa:sounds/levelup
scoreboard players set #if_display_warp_menu_title tpa.variables 1
execute unless score #is_editting_warp tpa.variables matches 1 unless data storage tpa:tpa temp.warp[0] run scoreboard players set #if_display_warp_menu_title tpa.variables 0
execute if score #if_display_warp_menu_title tpa.variables matches 1 run tellraw @s [{"storage":"tpa:tpa", "nbt":"loaded_lang.header"}, {"storage":"tpa:tpa", "nbt":"loaded_lang.warp_menu_title"}]
execute unless score #if_display_warp_menu_title tpa.variables matches 1 run function tpa:warp/disabled

# Loop
execute if data storage tpa:tpa temp.warp[0] run function tpa:warp/show_each

execute store result storage tpa:tpa temp.args.index int 1 run scoreboard players get #i tpa.variables
execute if score #is_editting_warp tpa.variables matches 1 run tellraw @s ["  ", {"storage": "tpa:tpa", "nbt": "warp[0].warp_button_add","hoverEvent":{"action":"show_text","value":{"storage": "tpa:tpa", "nbt": "loaded_lang.warp_button_add_hoverevent"}},"clickEvent":{"action":"suggest_command","value":"/data modify storage tpa:tpa warp append value {desc: <InputDescHere>, name: <InputNameHere>, x: <InputXHere>, y: <InputYHere>, z: <InputZHere>, dim: <InputDimensionHere>, disabled: 0b}"}}]

# Remove button display for non-OPs
scoreboard players set #is_editting_warp tpa.variables 0
data modify storage tpa:tpa warp[0] set value {}