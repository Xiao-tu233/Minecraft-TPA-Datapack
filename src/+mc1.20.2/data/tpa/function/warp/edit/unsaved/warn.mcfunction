# Parent function: tpa:warp/edit/unsaved/check

execute store result storage tpa:tpa temp.warp_edit.index int 1 run scoreboard players get #warp.edit.index tpa.variables

scoreboard players operation #warp tpa.variables = #warp.edit.index tpa.variables
function tpa:warp/get

execute store result storage tpa:tpa temp.warp_edit.uid int 1 run scoreboard players get @s tpa.uid
execute store result storage tpa:tpa temp.warp_edit.last_edit_time int 1 run time query gametime

data remove storage tpa:tpa temp.output
data modify storage tpa:tpa temp.output.langs set from storage tpa:tpa loaded_lang.warp_edit_unsaved_warn
data modify storage tpa:tpa temp.output.langs_format set from storage tpa:tpa loaded_lang.warp_edit_unsaved_warn_format

execute if data storage tpa:tpa temp.warp_edit.name run function tpa:warp/edit/unsaved/warn/name
execute if data storage tpa:tpa temp.warp_edit.desc run function tpa:warp/edit/unsaved/warn/desc

data modify storage tpa:tpa temp.output.target_index_langs set from storage tpa:tpa loaded_lang.warp_edit_target_index
data modify storage tpa:tpa temp.output.index set string storage tpa:tpa temp.warp_edit.index
data modify storage tpa:tpa temp.output.dialog_title set from storage tpa:tpa loaded_lang.warp_edit_unsaved_warn_dialog_title

data modify storage tpa:tpa temp.output.target_name set from storage tpa:tpa temp.warp_result.name
data modify storage tpa:tpa temp.output.target_desc set from storage tpa:tpa temp.warp_result.desc

data modify storage tpa:tpa temp.output.apply.label set from storage tpa:tpa loaded_lang.warp_button_apply
data modify storage tpa:tpa temp.output.apply.brackets set value ["§6[", "§6]"]
data modify storage tpa:tpa temp.output.apply.tooltip set from storage tpa:tpa loaded_lang.warp_button_apply_hoverevent

data modify storage tpa:tpa temp.output.cancel.label set from storage tpa:tpa loaded_lang.warp_button_cancel
data modify storage tpa:tpa temp.output.cancel.brackets set value ["§6[", "§6]"]
data modify storage tpa:tpa temp.output.cancel.tooltip set from storage tpa:tpa loaded_lang.warp_button_cancel_hoverevent

function tpa:output/warp/edit/unsaved_warn