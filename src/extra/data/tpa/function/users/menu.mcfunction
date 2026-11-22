# Menu rewrite entrypoint. Keep the new dialog scaffold for the UID-slot menu.
# TODO: assemble fixed UID slots, localized labels/actions and final rendering.
function tpa:load_lang

function tpa:users/page/get
scoreboard players operation #users.page.offset tpa.variables = #users.page.result tpa.variables
scoreboard players remove #users.page.offset tpa.variables 1
scoreboard players operation #users.page.offset tpa.variables *= #5 tpa.variables
scoreboard players operation #users.menu.uid tpa.variables = #users.page.offset tpa.variables

scoreboard players reset #users.start_index tpa.variables
scoreboard players reset #users.end_index tpa.variables
data modify storage tpa:tpa temp.users.menu_user_entries set value []
function tpa:users/menu/append_entries
function tpa:users/menu/append_entries
function tpa:users/menu/append_entries
function tpa:users/menu/append_entries
function tpa:users/menu/append_entries

data remove storage tpa:tpa temp.output
data remove storage tpa:tpa temp.output.menu
data modify storage tpa:tpa temp.output.menu set value {type: "minecraft:multi_action", exit_action: {label: {translate: "gui.done"}, width: 200}, body: {type: "minecraft:plain_message", contents: []}, title: [{color: aqua}, {text: " (", color: "white"}, {color: "white"}, {text: "/", color: "gray"}, {color: "white"}, {text: ")", color: "white"}], pause: false, after_action: "close", columns: 6}

# Title
data modify storage tpa:tpa temp.output.menu.title[0].text set from storage tpa:tpa loaded_lang.users_title
execute store result score storage tpa:tpa temp.output.menu.title[2].text int 1 run scoreboard players get #users.page.result tpa.variables
data modify storage tpa:tpa temp.output.menu.title[2].text set string storage tpa:tpa temp.output.menu.title[2].text
scoreboard players operation #users.total_users tpa.variables = #global_current tpa.uid
scoreboard players remove #users.total_users tpa.variables 1
scoreboard players operation #users.total_pages tpa.variables = #total_users tpa.variables
scoreboard players remove #users.total_pages tpa.variables 1
scoreboard players operation #users.total_pages tpa.variables /= #5 tpa.variables
scoreboard players add #users.total_pages tpa.variables 1
execute store result score storage tpa:tpa temp.output.menu.title[4].text int 1 run scoreboard players get #users.total_pages tpa.variables
data modify storage tpa:tpa temp.output.menu.title[4].text set string storage tpa:tpa temp.output.menu.title[4].text

data modify storage tpa:tpa temp.output.menu.chatbar_title set from storage tpa:tpa loaded_lang.users_chatbar_title
data modify storage tpa:tpa temp.output.menu.chatbar_title insert 1 from storage tpa:tpa temp.output.menu.title[]

# Body
scoreboard players set #users.page_empty tpa.variables 0
execute unless score #users.start_index tpa.variables = #users.start_index tpa.variables unless #users.end_index tpa.variables = #users.end_index tpa.variables \
    run scoreboard players set #users.page_empty tpa.variables 1
execute if score #users.page_empty tpa.variables matches 0 run function tpa:users/menu/page_normal
execute if score #users.page_empty tpa.variables matches 0 run function tpa:users/menu/page_empty

data modify storage tpa:tpa temp.output.menu.actions set value [\
    {action: {type: "minecraft:copy_to_clipboard", slot_key: "name_slot_0"}}, \
        {action: {type: "minecraft:copy_to_clipboard", slot_key: "uuid_slot_0"}}, \
        {action: {type: "minecraft:run_command", command: "/function tpa:users/set_name/slot_0"}}, \
        {action: {type: "minecraft:run_command", command: "/function tpa:users/set_uuid/slot_0"}},\
        {action: {type: "minecraft:run_command", command: "/function tpa:users/set_uid/slot_0"}}, \
        {action: {type: "minecraft:run_command", command: "/function tpa:users/remove/slot_0"}}, \
    {action: {type: "minecraft:copy_to_clipboard", slot_key: "name_slot_1"}}, \
        {action: {type: "minecraft:copy_to_clipboard", slot_key: "uuid_slot_1"}}, \
        {action: {type: "minecraft:run_command", command: "/function tpa:users/set_name/slot_1"}}, \
        {action: {type: "minecraft:run_command", command: "/function tpa:users/set_uuid/slot_1"}},\
        {action: {type: "minecraft:run_command", command: "/function tpa:users/set_uid/slot_1"}}, \
        {action: {type: "minecraft:run_command", command: "/function tpa:users/remove/slot_1"}}, \
    {action: {type: "minecraft:copy_to_clipboard", slot_key: "name_slot_2"}}, \
        {action: {type: "minecraft:copy_to_clipboard", slot_key: "uuid_slot_2"}}, \
        {action: {type: "minecraft:run_command", command: "/function tpa:users/set_name/slot_2"}}, \
        {action: {type: "minecraft:run_command", command: "/function tpa:users/set_uuid/slot_2"}},\
        {action: {type: "minecraft:run_command", command: "/function tpa:users/set_uid/slot_2"}}, \
        {action: {type: "minecraft:run_command", command: "/function tpa:users/remove/slot_2"}}, \
    {action: {type: "minecraft:copy_to_clipboard", slot_key: "name_slot_3"}}, \
        {action: {type: "minecraft:copy_to_clipboard", slot_key: "uuid_slot_3"}}, \
        {action: {type: "minecraft:run_command", command: "/function tpa:users/set_name/slot_3"}}, \
        {action: {type: "minecraft:run_command", command: "/function tpa:users/set_uuid/slot_3"}},\
        {action: {type: "minecraft:run_command", command: "/function tpa:users/set_uid/slot_3"}}, \
        {action: {type: "minecraft:run_command", command: "/function tpa:users/remove/slot_3"}},  \
    {action: {type: "minecraft:copy_to_clipboard", slot_key: "name_slot_4"}}, \
        {action: {type: "minecraft:copy_to_clipboard", slot_key: "uuid_slot_4"}}, \
        {action: {type: "minecraft:run_command", command: "/function tpa:users/set_name/slot_4"}}, \
        {action: {type: "minecraft:run_command", command: "/function tpa:users/set_uuid/slot_4"}},\
        {action: {type: "minecraft:run_command", command: "/function tpa:users/set_uid/slot_4"}}, \
        {action: {type: "minecraft:run_command", command: "/function tpa:users/remove/slot_4"}} \
    ]
data modify storage tpa:tpa temp.output.menu.actions[].width set value 100

# actions[{slot_key:"name_slot_*"}][{color: "gold"}], actions[{slot_key:"name_slot_*"}][1]
data modify storage tpa:tpa temp.users.menu_name_slot_template set value [{color: "gold"}, " §8: ", {color: "aqua"}]
data modify storage tpa:tpa temp.users.menu_empty_slot_template set value [{color: "white"}, " §8: ", {text: "(", color: "gray"}, {text: "", color: "gray"}, {text: ")", color: "gray"}]

execute unless data storage tpa:tpa temp.users.menu_user_entries[0].missing run function tpa:users/menu/slot_exists/slot_0
execute if data storage tpa:tpa temp.users.menu_user_entries[0].missing run function tpa:users/menu/slot_missing/slot_0
execute unless data storage tpa:tpa temp.users.menu_user_entries[1].missing run function tpa:users/menu/slot_exists/slot_1
execute if data storage tpa:tpa temp.users.menu_user_entries[1].missing run function tpa:users/menu/slot_missing/slot_1
execute unless data storage tpa:tpa temp.users.menu_user_entries[2].missing run function tpa:users/menu/slot_exists/slot_2
execute if data storage tpa:tpa temp.users.menu_user_entries[2].missing run function tpa:users/menu/slot_missing/slot_2
execute unless data storage tpa:tpa temp.users.menu_user_entries[3].missing run function tpa:users/menu/slot_exists/slot_3
execute if data storage tpa:tpa temp.users.menu_user_entries[3].missing run function tpa:users/menu/slot_missing/slot_3
execute unless data storage tpa:tpa temp.users.menu_user_entries[4].missing run function tpa:users/menu/slot_exists/slot_4
execute if data storage tpa:tpa temp.users.menu_user_entries[4].missing run function tpa:users/menu/slot_missing/slot_4
function tpa:output/menu
