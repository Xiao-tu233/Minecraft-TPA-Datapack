# Parent function: tpa:warp/option, tpa:warp/available, Quoted by: tpa:tpa_menu

# Storage Format:
# {desc: string, name: string, x: int, y: int, z: int, dimension: string, disabled: boolean}

# Load language, title
function tpa:load_lang

# Load buttons
execute if score #warp.editting tpa.variables matches 1 run function tpa:warp/load_edit_buttons

# Get Page for slot start
function tpa:warp/page/get
scoreboard players operation #warp tpa.variables = #warp.page.result tpa.variables
scoreboard players remove #warp tpa.variables 1
scoreboard players operation #warp tpa.variables *= #5 tpa.variables

# Check is the last page
scoreboard players operation #warp.total_pages tpa.variables = #warp tpa.config
scoreboard players operation #warp.total_pages tpa.variables /= #5 tpa.variables
scoreboard players add #warp.total_pages tpa.variables 1

scoreboard players operation #warp.slots_on_last_page tpa.variables = #warp tpa.config
scoreboard players operation #warp.slots_on_last_page tpa.variables %= #5 tpa.variables

# Load current page data
data remove storage tpa:tpa temp.warp_result
scoreboard players set #warp.store_result tpa.variables 1
scoreboard players set #warp.remove_current tpa.variables 0
scoreboard players set #warp.replace_current tpa.variables 0
scoreboard players set #warp.scan_count tpa.variables 5
execute if score #warp.page.result tpa.variables = #warp.total_pages tpa.variables run scoreboard players operation #warp.scan_count tpa.variables = #warp.slots_on_last_page tpa.variables
function tpa:warp/scan

# Show title if there is at least one warp
execute unless score #warp.editting tpa.variables matches 1 run function tpa:sounds/levelup

function tpa:output/warp/menu

# # int i = 0; i++; temp.warp.pop()
# data remove storage tpa:tpa temp.warp[0]
# scoreboard players set #i tpa.variables 1

# # Loop
# execute if data storage tpa:tpa temp.warp[0] run function tpa:warp/show_each


# execute store result storage tpa:tpa temp.args.index int 1 run scoreboard players get #i tpa.variables
# execute if score #warp.editting tpa.variables matches 1 run function tpa:warp/show_add with storage tpa:tpa temp.args

# Dialogs
data remove storage tpa:tpa temp.args.dialog
data modify storage tpa:tpa temp.args.dialog set value {type: "minecraft:multi_action", pause: false, after_action: "none", title: "$(title)", columns: 2, actions: []}
execute if score #warp.editting tpa.variables matches 1 run data modify storage tpa:tpa temp.args.dialog.columns set value 9
execute if score #if_display_warp_menu_title tpa.variables matches 1 run data modify entity @n[type=text_display, tag=tpa.text_display] text set from storage tpa:tpa loaded_lang.warp_menu_title
execute if score #if_display_warp_menu_title tpa.variables matches 1 run data modify storage tpa:tpa temp.args.dialog.title set from entity @n[type=text_display, tag=tpa.text_display] text

# Dialogs
execute if score #if_display_warp_menu_title tpa.variables matches 1 run function tpa:warp/dialog with storage tpa:tpa temp.args

# Remove button display for non-OPs
scoreboard players set #warp.editting tpa.variables 0
# data modify storage tpa:tpa warp[0] set value {}