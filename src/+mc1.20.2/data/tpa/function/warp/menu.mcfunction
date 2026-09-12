# Parent function: tpa:warp/option, tpa:warp/available, Quoted by: tpa:tpa_menu

# Storage Format:
# {desc: string, name: string, x: int, y: int, z: int, dim: string, disabled: boolean}

# Load language, title
function tpa:load_lang

# Check is the last page
scoreboard players operation #warp.slots_on_last_page tpa.variables = #warp tpa.config
scoreboard players operation #warp.slots_on_last_page tpa.variables %= #5 tpa.variables
execute if score #warp.slots_on_last_page tpa.variables matches 0 run scoreboard players set #warp.slots_on_last_page tpa.variables 5

# #warp.page.offset = (#warp.page.result -1) *5
scoreboard players operation #warp.page.offset tpa.variables = #warp.page.result tpa.variables
scoreboard players remove #warp.page.offset tpa.variables 1
scoreboard players operation #warp.page.offset tpa.variables *= #5 tpa.variables
scoreboard players operation #previous_warp tpa.variables = #warp tpa.variables
scoreboard players operation #warp tpa.variables = #warp.page.offset tpa.variables
scoreboard players add #warp tpa.variables 1

# Load current page data to List[5] temp.warp_result
data remove storage tpa:tpa temp.warp_result
scoreboard players set #warp.store_result tpa.variables 1
scoreboard players set #warp.remove_current tpa.variables 0
scoreboard players set #warp.replace_current tpa.variables 0
scoreboard players set #warp.scan_count tpa.variables 5
execute if score #warp.page.result tpa.variables = #warp.total_pages tpa.variables run scoreboard players operation #warp.scan_count tpa.variables = #warp.slots_on_last_page tpa.variables
function tpa:warp/scan

# Normalize warp_result to a list if scan count was 1
execute if data storage tpa:tpa temp.warp_result.x run function tpa:warp/normalize_result

execute unless score #warp.editting tpa.variables matches 1 run function tpa:sounds/levelup

# Output
data remove storage tpa:tpa temp.output
    execute store result storage tpa:tpa temp.output.editting byte 1 run scoreboard players get #warp.editting tpa.variables

    execute store result storage tpa:tpa temp.output.current_page int 1 run scoreboard players get #warp.page.result tpa.variables
    execute store result storage tpa:tpa temp.output.total_pages int 1 run scoreboard players get #warp.total_pages tpa.variables
    execute store result storage tpa:tpa temp.output.start_index int 1 run scoreboard players get #warp tpa.variables
    data modify storage tpa:tpa temp.output.start_index set string storage tpa:tpa temp.output.start_index
#                                                                                                      /-> #warp.end defined @ tpa:warp/scan
    execute store result storage tpa:tpa temp.output.end_index int 1 run scoreboard players get #warp.end tpa.variables
    data modify storage tpa:tpa temp.output.end_index set string storage tpa:tpa temp.output.end_index
    execute store result storage tpa:tpa temp.output.total_slots int 1 run scoreboard players get #warp tpa.config
    data modify storage tpa:tpa temp.output.total_slots set string storage tpa:tpa temp.output.total_slots

    data modify storage tpa:tpa temp.output.title set from storage tpa:tpa loaded_lang.warp_selector_title
    data modify storage tpa:tpa temp.output.index_format set from storage tpa:tpa loaded_lang.warp_selector_index_format
    data modify storage tpa:tpa temp.output.index set from storage tpa:tpa loaded_lang.warp_selector_index
    function tpa:warp/menu/prepare_output
    data modify storage tpa:tpa temp.output.button_previous_page set from storage tpa:tpa loaded_lang.warp_selector_button_previous_page
    data modify storage tpa:tpa temp.output.button_next_page set from storage tpa:tpa loaded_lang.warp_selector_button_next_page
    data modify storage tpa:tpa temp.output.button_previous_page_hover set from storage tpa:tpa loaded_lang.warp_selector_button_previous_page_hoverevent
    data modify storage tpa:tpa temp.output.button_next_page_hover set from storage tpa:tpa loaded_lang.warp_selector_button_next_page_hoverevent

    execute if score #warp.editting tpa.variables matches 1 if score #warp.page.result tpa.variables = #warp.total_pages tpa.variables run function tpa:warp/menu/prepare_add_button
function tpa:output/warp/menu

# Dialogs
# data remove storage tpa:tpa temp.args.dialog
# data modify storage tpa:tpa temp.args.dialog set value {type: "minecraft:multi_action", pause: false, after_action: "none", title: "$(title)", columns: 2, actions: []}
# execute if score #warp.editting tpa.variables matches 1 run data modify storage tpa:tpa temp.args.dialog.columns set value 9
# execute if score #if_display_warp_menu_title tpa.variables matches 1 run data modify entity @n[type=text_display, tag=tpa.text_display] text set from storage tpa:tpa loaded_lang.warp_menu_title
# execute if score #if_display_warp_menu_title tpa.variables matches 1 run data modify storage tpa:tpa temp.args.dialog.title set from entity @n[type=text_display, tag=tpa.text_display] text

# Dialogs
# execute if score #if_display_warp_menu_title tpa.variables matches 1 run function tpa:warp/dialog with storage tpa:tpa temp.args

# Remove button display for non-OPs
# data modify storage tpa:tpa warp[0] set value {}

scoreboard players operation #warp tpa.variables = #previous_warp tpa.variables