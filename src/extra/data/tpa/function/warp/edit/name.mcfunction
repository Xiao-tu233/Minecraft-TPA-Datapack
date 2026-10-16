# Parent function: tpa:warp/setname

data remove storage tpa:tpa temp.warp_edit
execute store result storage tpa:tpa temp.warp_edit.index int 1 run scoreboard players get #warp.edit.index tpa.variables
execute store result storage tpa:tpa temp.warp_edit.uid int 1 run scoreboard players get @s tpa.uid
execute store result storage tpa:tpa temp.warp_edit.last_edit_time int 1 run time query gametime

data remove storage tpa:tpa temp.output
data modify storage tpa:tpa temp.output.langs set from storage tpa:tpa loaded_lang.warp_edit
data modify storage tpa:tpa temp.output.target_langs set from storage tpa:tpa loaded_lang.warp_edit_target_name
data modify storage tpa:tpa temp.output.target_index_langs set from storage tpa:tpa loaded_lang.warp_edit_target_index
data modify storage tpa:tpa temp.output.index set string storage tpa:tpa temp.warp_edit.index
data modify storage tpa:tpa temp.output.dialog_title set from storage tpa:tpa loaded_lang.warp_edit_dialog_title

data modify storage tpa:tpa temp.output.target_name set from storage tpa:tpa temp.warp_result.name
data modify storage tpa:tpa temp.output.target_desc set from storage tpa:tpa temp.warp_result.desc

data modify storage tpa:tpa temp.output.input_name.label set from storage tpa:tpa loaded_lang.warp_edit_button_input_name
data modify storage tpa:tpa temp.output.input_name.brackets set value ["§6[", "§6]"]
data modify storage tpa:tpa temp.output.input_name.tooltip set from storage tpa:tpa loaded_lang.warp_edit_button_input_name_hoverevent

data modify storage tpa:tpa temp.output.apply.label set from storage tpa:tpa loaded_lang.warp_button_apply
data modify storage tpa:tpa temp.output.apply.brackets set value ["§6[", "§6]"]
data modify storage tpa:tpa temp.output.apply.tooltip set from storage tpa:tpa loaded_lang.warp_button_apply_hoverevent

data modify storage tpa:tpa temp.output.cancel.label set from storage tpa:tpa loaded_lang.warp_button_cancel
data modify storage tpa:tpa temp.output.cancel.brackets set value ["§6[", "§6]"]
data modify storage tpa:tpa temp.output.cancel.tooltip set from storage tpa:tpa loaded_lang.warp_button_cancel_hoverevent

data modify storage tpa:tpa temp.output.edit_command_template set value "/data modify storage tpa:tpa temp.warp_edit.name set value \"$(edit)\""

function tpa:output/warp/edit