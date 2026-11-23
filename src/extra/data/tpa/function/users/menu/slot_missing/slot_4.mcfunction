# Parent function: tpa:users/menu

data remove storage tpa:tpa temp.users.menu_action
data modify storage tpa:tpa temp.users.menu_action.label set from storage tpa:tpa temp.users.menu_empty_slot_template
data modify storage tpa:tpa temp.users.menu_action.label[0].text set string storage tpa:tpa temp.users.menu_user_entries[4].uid
data modify storage tpa:tpa temp.users.menu_action.label[{text: "", color:"gray"}].text set from storage tpa:tpa loaded_lang.users_empty_slot
data modify storage tpa:tpa temp.users.menu_action.tooltip set from storage tpa:tpa loaded_lang.users_name_hoverevent
data modify storage tpa:tpa temp.output.menu.actions[{action:{slot_key:"name_slot_4"}}] merge from storage tpa:tpa temp.users.menu_action
data remove storage tpa:tpa temp.output.menu.actions[{action:{slot_key:"name_slot_4"}}].action.type

data remove storage tpa:tpa temp.users.menu_action
data modify storage tpa:tpa temp.users.menu_action.brackets set from storage tpa:tpa temp.output_components.button_brackets.empty
data modify storage tpa:tpa temp.users.menu_action.space set value ""
data modify storage tpa:tpa temp.users.menu_action.label set value ""
data modify storage tpa:tpa temp.users.menu_action.tooltip set value ""
data modify storage tpa:tpa temp.output.menu.actions[{action:{command: "/function tpa:users/copy_uuid/slot_4"}}] merge from storage tpa:tpa temp.users.menu_action
data remove storage tpa:tpa temp.output.menu.actions[{action:{command: "/function tpa:users/copy_uuid/slot_4"}}].action

data remove storage tpa:tpa temp.users.menu_action
data modify storage tpa:tpa temp.users.menu_action.brackets set from storage tpa:tpa temp.output_components.button_brackets.empty
data modify storage tpa:tpa temp.users.menu_action.space set value ""
data modify storage tpa:tpa temp.users.menu_action.label set value ""
data modify storage tpa:tpa temp.users.menu_action.tooltip set value ""
data modify storage tpa:tpa temp.output.menu.actions[{action:{command:"/function tpa:users/set_name/slot_4"}}] merge from storage tpa:tpa temp.users.menu_action
data remove storage tpa:tpa temp.output.menu.actions[{action:{command:"/function tpa:users/set_name/slot_4"}}].action

data remove storage tpa:tpa temp.users.menu_action
data modify storage tpa:tpa temp.users.menu_action.brackets set from storage tpa:tpa temp.output_components.button_brackets.edit
data modify storage tpa:tpa temp.users.menu_action.space set value " "
data modify storage tpa:tpa temp.users.menu_action.label set from storage tpa:tpa loaded_lang.users_button_register_new
data modify storage tpa:tpa temp.users.menu_action.tooltip set from storage tpa:tpa loaded_lang.users_button_register_new_hoverevent
data modify storage tpa:tpa temp.users.menu_action.action.command set value "/function tpa:users/register_new/slot_4"
data modify storage tpa:tpa temp.output.menu.actions[{action:{command:"/function tpa:users/set_uuid/slot_4"}}] merge from storage tpa:tpa temp.users.menu_action

data remove storage tpa:tpa temp.users.menu_action
data modify storage tpa:tpa temp.users.menu_action.brackets set from storage tpa:tpa temp.output_components.button_brackets.edit
data modify storage tpa:tpa temp.users.menu_action.space set value " "
data modify storage tpa:tpa temp.users.menu_action.label set from storage tpa:tpa loaded_lang.users_button_select_existed
data modify storage tpa:tpa temp.users.menu_action.tooltip set from storage tpa:tpa loaded_lang.users_button_select_existed_hoverevent
data modify storage tpa:tpa temp.users.menu_action.action.command set value "/function tpa:users/select_existed/slot_4"
data modify storage tpa:tpa temp.output.menu.actions[{action:{command:"/function tpa:users/set_uid/slot_4"}}] merge from storage tpa:tpa temp.users.menu_action

data remove storage tpa:tpa temp.users.menu_action
data modify storage tpa:tpa temp.users.menu_action.brackets set from storage tpa:tpa temp.output_components.button_brackets.empty
data modify storage tpa:tpa temp.users.menu_action.space set value ""
data modify storage tpa:tpa temp.users.menu_action.label set value ""
data modify storage tpa:tpa temp.users.menu_action.tooltip set value ""
data modify storage tpa:tpa temp.output.menu.actions[{action:{command:"/function tpa:users/remove/slot_4"}}] merge from storage tpa:tpa temp.users.menu_action
data remove storage tpa:tpa temp.output.menu.actions[{action:{command:"/function tpa:users/remove/slot_4"}}].action
