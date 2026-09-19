# Parent function: tpa:warp/edit/name/menu, tpa:warp/edit/desc/menu
# Input: List[2] temp.output.langs, List[2] temp.output.target_langs, List[2] temp.output.target_index_langs, str temp.output.index, \
#        Button temp.output.input_desc, Button temp.output.input_name, Button temp.output.apply, Button temp.output.cancel

# 你正在编辑公共传送点#1(索引:1)名字
#   [输入名字]　[应用] [取消]

# warp_edit: "你正在编辑%s"
# warp_edit_target_index: "(索引:%s)"
# warp_edit_target: "%s的名字"

# warp_edit_button_input_desc: "输入描述"
# warp_edit_button_input_desc_hoverevent: "§b点击后在命令输入框中填写描述并执行"
# warp_edit_button_input_name: "输入名字"
# warp_edit_button_input_name_hoverevent: "§b点击后在命令输入框中填写名字并执行"

tellraw @s []

data remove storage tpa:tpa temp.args.dialog

function tpa:test/pass

function tpa:warp/dialog with storage tpa:tpa temp.args