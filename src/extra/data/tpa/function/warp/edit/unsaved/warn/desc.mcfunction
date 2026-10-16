# Parent function: tpa:warp/edit/unsaved/warn
data modify storage tpa:tpa temp.output.target_langs set from storage tpa:tpa loaded_lang.warp_edit_target_desc
data modify storage tpa:tpa temp.output.edit_with set from storage tpa:tpa temp.warp_edit.desc
