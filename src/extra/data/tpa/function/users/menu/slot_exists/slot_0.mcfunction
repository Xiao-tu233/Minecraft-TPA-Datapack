# Parent function: tpa:users/menu

data remove storage tpa:tpa temp.users.menu_action
data modify storage tpa:tpa temp.users.menu_action.label set from storage tpa:tpa temp.users.menu_name_slot_template
data modify storage tpa:tpa temp.users.menu_action.label[0].text set string storage tpa:tpa temp.users.menu_user_entries[0].uid
data modify storage tpa:tpa temp.users.menu_action.label[2].text set from storage tpa:tpa temp.users.menu_user_entries[0].name
data modify storage tpa:tpa temp.users.menu_action.action.value set from storage tpa:tpa temp.users.menu_user_entries[0].name
data modify storage tpa:tpa temp.users.menu_action.tooltip set from storage tpa:tpa loaded_lang.users_name_hoverevent
data modify storage tpa:tpa temp.output.menu.actions[{action:{slot_key:"name_slot_0"}}] merge from storage tpa:tpa temp.users.menu_action

data remove storage tpa:tpa temp.users.menu_action
data modify storage tpa:tpa temp.users.menu_action.brackets set from storage tpa:tpa temp.output_components.button_brackets.edit
data modify storage tpa:tpa temp.users.menu_action.space set value " "
data modify storage tpa:tpa temp.users.menu_action.label set from storage tpa:tpa loaded_lang.users_button_copy_uuid
data modify storage tpa:tpa temp.users.menu_action.tooltip set from storage tpa:tpa loaded_lang.users_button_copy_uuid_hoverevent
data modify storage tpa:tpa temp.users.menu_action.action.value set string storage tpa:tpa temp.users.menu_user_entries[0].uuid
data modify storage tpa:tpa temp.output.menu.actions[{action:{command: "/function tpa:users/copy_uuid/slot_0"}}] merge from storage tpa:tpa temp.users.menu_action

data remove storage tpa:tpa temp.users.menu_action
data modify storage tpa:tpa temp.users.menu_action.brackets set from storage tpa:tpa temp.output_components.button_brackets.edit
data modify storage tpa:tpa temp.users.menu_action.space set value " "
data modify storage tpa:tpa temp.users.menu_action.label set from storage tpa:tpa loaded_lang.users_button_set_name
data modify storage tpa:tpa temp.users.menu_action.tooltip set from storage tpa:tpa loaded_lang.users_button_set_name_hoverevent
data modify storage tpa:tpa temp.output.menu.actions[{action:{command:"/function tpa:users/set_name/slot_0"}}] merge from storage tpa:tpa temp.users.menu_action

data remove storage tpa:tpa temp.users.menu_action
data modify storage tpa:tpa temp.users.menu_action.brackets set from storage tpa:tpa temp.output_components.button_brackets.edit
data modify storage tpa:tpa temp.users.menu_action.space set value " "
data modify storage tpa:tpa temp.users.menu_action.label set from storage tpa:tpa loaded_lang.users_button_set_uuid
data modify storage tpa:tpa temp.users.menu_action.tooltip set from storage tpa:tpa loaded_lang.users_button_set_uuid_hoverevent
data modify storage tpa:tpa temp.output.menu.actions[{action:{command:"/function tpa:users/set_uuid/slot_0"}}] merge from storage tpa:tpa temp.users.menu_action

data remove storage tpa:tpa temp.users.menu_action
data modify storage tpa:tpa temp.users.menu_action.brackets set from storage tpa:tpa temp.output_components.button_brackets.edit
data modify storage tpa:tpa temp.users.menu_action.space set value " "
data modify storage tpa:tpa temp.users.menu_action.label set from storage tpa:tpa loaded_lang.users_button_set_uid
data modify storage tpa:tpa temp.users.menu_action.tooltip set from storage tpa:tpa loaded_lang.users_button_set_uid_hoverevent
data modify storage tpa:tpa temp.output.menu.actions[{action:{command:"/function tpa:users/set_uid/slot_0"}}] merge from storage tpa:tpa temp.users.menu_action

data remove storage tpa:tpa temp.users.menu_action
data modify storage tpa:tpa temp.users.menu_action.brackets set from storage tpa:tpa temp.output_components.button_brackets.edit
data modify storage tpa:tpa temp.users.menu_action.space set value " "
data modify storage tpa:tpa temp.users.menu_action.label set from storage tpa:tpa loaded_lang.users_button_remove
data modify storage tpa:tpa temp.users.menu_action.tooltip set from storage tpa:tpa loaded_lang.users_button_remove_hoverevent
data modify storage tpa:tpa temp.output.menu.actions[{action:{command:"/function tpa:users/remove/slot_0"}}] merge from storage tpa:tpa temp.users.menu_action
