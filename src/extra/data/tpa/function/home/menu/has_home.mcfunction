# Parent function: tpa:home/menu

# Storage Format:
# {id: int, uid: int, x: int, y: int, z: int, dimension: string(minecraft:dimension)}

# A saved page can outlive the last page after a high Home is removed.
execute if score #home.page.result tpa.variables > #home.total_pages tpa.variables run function tpa:home/page/clamp

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

execute if score #home.plays_menu_sound tpa.variables matches 1 run function tpa:sounds/levelup

# Output
data remove storage tpa:tpa temp.output
    # Dialogs
    data remove storage tpa:tpa temp.dialog
    data modify storage tpa:tpa temp.dialog set value {type: "minecraft:multi_action", body: {type: "plain_message"}, title: [{color: aqua}, {text: " (", color: "white"}, {color: "white"}, {text: "/", color: "gray"}, {color: "white"}, {text: ")", color: "white"}], pause: false, after_action: "none", columns: 4}

    execute store result storage tpa:tpa temp.output.current_page int 1 run scoreboard players get #home.page.result tpa.variables
    execute store result storage tpa:tpa temp.output.total_pages int 1 run scoreboard players get #home.total_pages tpa.variables
    execute store result storage tpa:tpa temp.output.total_slots int 1 run scoreboard players get #home.max_id tpa.variables
    data modify storage tpa:tpa temp.output.total_slots set string storage tpa:tpa temp.output.total_slots
    data modify storage tpa:tpa temp.output.title set from storage tpa:tpa loaded_lang.home_selector_title

    execute unless data storage tpa:tpa temp.home_result[0] run function tpa:home/menu/page_empty
    execute if data storage tpa:tpa temp.home_result[0] run function tpa:home/menu/page_normal

    function tpa:home/menu/prepare_output
    data modify storage tpa:tpa temp.output.button_previous_page set from storage tpa:tpa loaded_lang.home_selector_button_previous_page
    data modify storage tpa:tpa temp.output.button_next_page set from storage tpa:tpa loaded_lang.home_selector_button_next_page
    data modify storage tpa:tpa temp.output.button_previous_page_hover set from storage tpa:tpa loaded_lang.home_selector_button_previous_page_hoverevent
    data modify storage tpa:tpa temp.output.button_next_page_hover set from storage tpa:tpa loaded_lang.home_selector_button_next_page_hoverevent

    scoreboard players set #home.allows_add tpa.variables 1
    execute if score #home.max_id tpa.variables >= #home tpa.config if score #home tpa.config matches 1.. run scoreboard players set #home.allows_add tpa.variables 0
    execute if score #home.page.result tpa.variables = #home.total_pages tpa.variables if score #home.allows_add tpa.variables matches 1 run function tpa:home/menu/prepare_add_button
function tpa:output/home/menu



# Dialogs
# execute if score #if_display_home_menu_title tpa.variables matches 1 run function tpa:home/dialog with storage tpa:tpa temp.args
data remove storage tpa:tpa temp.args
data modify storage tpa:tpa temp.args.dialog set from storage tpa:tpa temp.dialog
function tpa:util/dialog with storage tpa:tpa temp.args

scoreboard players operation #home tpa.variables = #previous_home tpa.variables
