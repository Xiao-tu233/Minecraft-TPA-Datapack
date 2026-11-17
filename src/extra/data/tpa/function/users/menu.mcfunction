# Menu rewrite entrypoint. Keep the new dialog scaffold for the UID-slot menu.
# TODO: assemble fixed UID slots, localized labels/actions and final rendering.
function tpa:load_lang

function tpa:users/page/get
scoreboard players operation #users.page.offset tpa.variables = #users.page.result tpa.variables
scoreboard players remove #users.page.offset tpa.variables 1
scoreboard players operation #users.page.offset tpa.variables *= #5 tpa.variables
scoreboard players operation #users.uid tpa.variables = #users.page.offset tpa.variables

data modify storage tpa:tpa temp.users.menu_user_entries set value []
function tpa:users/menu/append_entries

data remove storage tpa:tpa temp.output
data remove storage tpa:tpa temp.output.menu
data modify storage tpa:tpa temp.output.menu set value {type: "minecraft:multi_action", exit_action: {label: {translate: "gui.done"}, width: 200}, body: {type: "minecraft:plain_message"}, title: [{color: aqua}, {text: " (", color: "white"}, {color: "white"}, {text: "/", color: "gray"}, {color: "white"}, {text: ")", color: "white"}], pause: false, after_action: "close", columns: 6}

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

# TODO do the same thing to the other 4 slots
data modify storage tpa:tpa temp.users.menu_name_slot_template set value [{color: "aqua"}, "§8|", {color: "gold"}]
data remove storage tpa:tpa temp.users.menu_action
data modify storage tpa:tpa temp.users.menu_action.label set from storage tpa:tpa temp.users.menu_name_slot_template
data modify storage tpa:tpa temp.users.menu_action.label[0].text set from storage tpa:tpa temp.users.menu_user_entries[0].name
data modify storage tpa:tpa temp.users.menu_action.label[2].text set string storage tpa:tpa temp.users.menu_user_entries[0].uid
data modify storage tpa:tpa temp.users.menu_action.action.value set from storage tpa:tpa temp.users.menu_user_entries[0].name
data modify storage tpa:tpa temp.users.menu_action.tooltip set from storage tpa:tpa loaded_lang.users_name_hoverevent
data modify storage tpa:tpa temp.output.menu.actions[{action:{slot_key:"name_slot_0"}}] set from storage tpa:tpa temp.users.menu_action

data remove storage tpa:tpa temp.users.menu_action
data modify storage tpa:tpa temp.users.menu_action.brackets set from storage tpa:tpa temp.output_components.button_brackets.edit
data modify storage tpa:tpa temp.users.menu_action.space set value " "
data modify storage tpa:tpa temp.users.menu_action.label set from storage tpa:tpa loaded_lang.users_button_copy_uuid
data modify storage tpa:tpa temp.users.menu_action.tooltip set from storage tpa:tpa loaded_lang.users_button_copy_uuid_hoverevent
data modify storage tpa:tpa temp.users.menu_action.action.value set string storage tpa:tpa temp.users.menu_user_entries[0].uuid
data modify storage tpa:tpa temp.output.menu.actions[{action:{slot_key:"uuid_slot_0"}}] set from storage tpa:tpa temp.users.menu_action

data remove storage tpa:tpa temp.users.menu_action
data modify storage tpa:tpa temp.users.menu_action.brackets set from storage tpa:tpa temp.output_components.button_brackets.edit
data modify storage tpa:tpa temp.users.menu_action.space set value " "
data modify storage tpa:tpa temp.users.menu_action.label set from storage tpa:tpa loaded_lang.users_button_set_name
data modify storage tpa:tpa temp.users.menu_action.tooltip set from storage tpa:tpa loaded_lang.users_button_set_name_hoverevent
data modify storage tpa:tpa temp.output.menu.actions[{action:{command:"/function tpa:users/set_name/slot_0"}}] set from storage tpa:tpa temp.users.menu_action

data remove storage tpa:tpa temp.users.menu_action
data modify storage tpa:tpa temp.users.menu_action.brackets set from storage tpa:tpa temp.output_components.button_brackets.edit
data modify storage tpa:tpa temp.users.menu_action.space set value " "
data modify storage tpa:tpa temp.users.menu_action.label set from storage tpa:tpa loaded_lang.users_button_set_uuid
data modify storage tpa:tpa temp.users.menu_action.tooltip set from storage tpa:tpa loaded_lang.users_button_set_uuid_hoverevent
data modify storage tpa:tpa temp.output.menu.actions[{action:{command:"/function tpa:users/set_uuid/slot_0"}}] set from storage tpa:tpa temp.users.menu_action

data remove storage tpa:tpa temp.users.menu_action
data modify storage tpa:tpa temp.users.menu_action.brackets set from storage tpa:tpa temp.output_components.button_brackets.edit
data modify storage tpa:tpa temp.users.menu_action.space set value " "
data modify storage tpa:tpa temp.users.menu_action.label set from storage tpa:tpa loaded_lang.users_button_set_uid
data modify storage tpa:tpa temp.users.menu_action.tooltip set from storage tpa:tpa loaded_lang.users_button_set_uid_hoverevent
data modify storage tpa:tpa temp.output.menu.actions[{action:{command:"/function tpa:users/set_uid/slot_0"}}] set from storage tpa:tpa temp.users.menu_action

data remove storage tpa:tpa temp.users.menu_action
data modify storage tpa:tpa temp.users.menu_action.brackets set from storage tpa:tpa temp.output_components.button_brackets.edit
data modify storage tpa:tpa temp.users.menu_action.space set value " "
data modify storage tpa:tpa temp.users.menu_action.label set from storage tpa:tpa loaded_lang.users_button_remove
data modify storage tpa:tpa temp.users.menu_action.tooltip set from storage tpa:tpa loaded_lang.users_button_remove_hoverevent
data modify storage tpa:tpa temp.output.menu.actions[{action:{command:"/function tpa:users/remove/slot_0"}}] set from storage tpa:tpa temp.users.menu_action

function tpa:output/menu
