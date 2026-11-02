# Parent function: tpa:home/menu

# Storage Format:
# {id: int, uid: int, x: int, y: int, z: int, dimension: string(minecraft:dimension)}

# Check is the last page
scoreboard players operation #home.slots_on_last_page tpa.variables = #home.max_id tpa.variables
scoreboard players operation #home.slots_on_last_page tpa.variables %= #5 tpa.variables
execute if score #home.slots_on_last_page tpa.variables matches 0 run scoreboard players set #home.slots_on_last_page tpa.variables 5

# #home.page.offset = (#home.page.result -1) *5
scoreboard players operation #home.page.offset tpa.variables = #home.page.result tpa.variables
scoreboard players remove #home.page.offset tpa.variables 1
scoreboard players operation #home.page.offset tpa.variables *= #5 tpa.variables
scoreboard players operation #previous_home tpa.variables = #home tpa.variables
scoreboard players operation #home tpa.variables = #home.page.offset tpa.variables

data modify storage tpa:tpa temp.home_page_entries set value []
function tpa:home/menu/append_home
function tpa:home/menu/append_home
function tpa:home/menu/append_home
function tpa:home/menu/append_home
function tpa:home/menu/append_home
data modify storage tpa:tpa temp.home_result set from storage tpa:tpa temp.home_page_entries

function tpa:sounds/levelup

# Output
data remove storage tpa:tpa temp.output
    execute store result storage tpa:tpa temp.output.current_page int 1 run scoreboard players get #home.page.result tpa.variables
    execute store result storage tpa:tpa temp.output.total_pages int 1 run scoreboard players get #home.total_pages tpa.variables

    data modify storage tpa:tpa temp.output.start_index set string storage tpa:tpa temp.home_page_entries[0].id
    data modify storage tpa:tpa temp.output.end_index set string storage tpa:tpa temp.home_page_entries[-1].id
    execute store result storage tpa:tpa temp.output.total_slots int 1 run scoreboard players get #home.max_id tpa.variables
    data modify storage tpa:tpa temp.output.total_slots set string storage tpa:tpa temp.output.total_slots

    data modify storage tpa:tpa temp.output.title set from storage tpa:tpa loaded_lang.home_selector_title
    data modify storage tpa:tpa temp.output.index_format set from storage tpa:tpa loaded_lang.home_selector_index_format
    data modify storage tpa:tpa temp.output.index set from storage tpa:tpa loaded_lang.home_selector_index
    function tpa:home/menu/prepare_output
    data modify storage tpa:tpa temp.output.button_previous_page set from storage tpa:tpa loaded_lang.home_selector_button_previous_page
    data modify storage tpa:tpa temp.output.button_next_page set from storage tpa:tpa loaded_lang.home_selector_button_next_page
    data modify storage tpa:tpa temp.output.button_previous_page_hover set from storage tpa:tpa loaded_lang.home_selector_button_previous_page_hoverevent
    data modify storage tpa:tpa temp.output.button_next_page_hover set from storage tpa:tpa loaded_lang.home_selector_button_next_page_hoverevent

    execute if score #home.editting tpa.variables matches 1 if score #home.page.result tpa.variables = #home.total_pages tpa.variables run function tpa:home/menu/prepare_add_button
function tpa:output/home/menu

# Dialogs
# data remove storage tpa:tpa temp.args.dialog
# data modify storage tpa:tpa temp.args.dialog set value {type: "minecraft:multi_action", pause: false, after_action: "none", title: "$(title)", columns: 2, actions: []}
# execute if score #home.editting tpa.variables matches 1 run data modify storage tpa:tpa temp.args.dialog.columns set value 9
# execute if score #if_display_home_menu_title tpa.variables matches 1 run data modify entity @n[type=text_display, tag=tpa.text_display] text set from storage tpa:tpa loaded_lang.home_menu_title
# execute if score #if_display_home_menu_title tpa.variables matches 1 run data modify storage tpa:tpa temp.args.dialog.title set from entity @n[type=text_display, tag=tpa.text_display] text

# Dialogs
# execute if score #if_display_home_menu_title tpa.variables matches 1 run function tpa:home/dialog with storage tpa:tpa temp.args

# Remove button display for non-OPs
# data modify storage tpa:tpa home[0] set value {}

scoreboard players operation #home tpa.variables = #previous_home tpa.variables
