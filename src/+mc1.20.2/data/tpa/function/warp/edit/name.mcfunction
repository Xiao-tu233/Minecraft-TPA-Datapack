# Parent function: tpa:warp/setname/slot_*

# Parent function: tpa:warp/edit/name

data remove storage tpa:tpa temp.warp_edit
execute store result storage tpa:tpa temp.warp_edit.index int 1 run scoreboard players get #warp.edit.index tpa.variables
execute store result storage tpa:tpa temp.warp_edit.uid int 1 run scoreboard players get @s tpa.uid
execute store result storage tpa:tpa temp.warp_edit.last_edit_time int 1 run time query gametime

data remove storage tpa:tpa temp.output
data modify storage tpa:tpa temp.output.langs set from storage tpa:tpa loaded_lang.warp_edit
data modify storage tpa:tpa temp.output.target_langs set from storage tpa:tpa loaded_lang.warp_edit_target_index
data modify storage tpa:tpa temp.output.target_index_langs set from storage tpa:tpa loaded_lang.warp_edit_target_name
data modify storage tpa:tpa temp.output.index set string storage tpa:tpa temp.warp_edit.index
data modify storage tpa:tpa temp.output.dialog_title set from storage tpa:tpa loaded_lang.warp_edit_dialog_title

data modify storage tpa:tpa temp.output.input_name.label set from storage tpa:tpa loaded_lang.warp_edit_button_input_name
data modify storage tpa:tpa temp.output.input_name.brackets set value ["§6[", "§6]"]
data modify storage tpa:tpa temp.output.input_name.tooltip set from storage tpa:tpa loaded_lang.warp_edit_button_input_name_hoverevent

data modify storage tpa:tpa temp.output.apply.label set from storage tpa:tpa loaded_lang.warp_button_apply
data modify storage tpa:tpa temp.output.apply.brackets set value ["§6[", "§6]"]
data modify storage tpa:tpa temp.output.apply.tooltip set from storage tpa:tpa loaded_lang.warp_button_apply

data modify storage tpa:tpa temp.output.cancel.label set from storage tpa:tpa loaded_lang.warp_button_cancel
data modify storage tpa:tpa temp.output.cancel.brackets set value ["§6[", "§6]"]
data modify storage tpa:tpa temp.output.cancel.tooltip set from storage tpa:tpa loaded_lang.warp_button_cancel
# 你正在编辑公共传送点#1(索引:1)名字
#   [输入名字]　[应用] [取消]

# warp_edit: "你正在编辑%s"
# warp_edit_target_index: "(索引:%s)"
# warp_edit_target_name/desc: "%s的名字"

# warp_edit_button_input_desc: "输入描述"
# warp_edit_button_input_desc_hoverevent: "§b点击后在命令输入框中填写描述并执行"
# warp_edit_button_input_name: "输入名字"
# warp_edit_button_input_name_hoverevent: "§b点击后在命令输入框中填写名字并执行"

function tpa:output/warp/edit
