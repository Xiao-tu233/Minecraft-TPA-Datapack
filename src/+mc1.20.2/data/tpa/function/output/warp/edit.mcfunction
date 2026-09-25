# Parent function: tpa:warp/edit/name, tpa:warp/edit/desc
# Input: List[2] temp.output.langs, List[2] temp.output.target_langs, List[2] temp.output.target_index_langs, str temp.output.index, str temp.output.edit_command_template, \
         str temp.output.target_name, str temp.output.target_desc, str temp.output.dialog_title, \
         Button temp.output.input_desc, Button temp.output.input_name, Button temp.output.apply, Button temp.output.cancel

# 你正在编辑公共传送点#1(索引:1)名字
#   [输入名字]　[应用] [取消]

# warp_edit: "你正在编辑%s"
# warp_edit_target_index: "(索引:%s)"
# warp_edit_target: "%s的名字"

# warp_edit_button_input_desc: "输入描述"
# warp_edit_button_input_desc_hoverevent: "§b点击后在命令输入框中填写描述并执行"
# warp_edit_button_input_name: "输入名字"
# warp_edit_button_input_name_hoverevent: "§b点击后在命令输入框中填写名字并执行"

tellraw @s ["", {interpret: true,  storage: "tpa:tpa", nbt: "temp.output.langs[0]"}, {interpret: true,  storage: "tpa:tpa", nbt: "temp.output.target_langs[0]"}, {interpret: true,  storage: "tpa:tpa", nbt: "temp.output.target_name", hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.output.target_desc"}}}, {interpret: true,  storage: "tpa:tpa", nbt: "temp.output.target_index_langs[0]"}, {interpret: true,  storage: "tpa:tpa", nbt: "temp.output.index"}, {interpret: true,  storage: "tpa:tpa", nbt: "temp.output.target_index_langs[1]"}, {interpret: true,  storage: "tpa:tpa", nbt: "temp.output.target_langs[1]"}, {interpret: true,  storage: "tpa:tpa", nbt: "temp.output.langs[1]"}]
tellraw @s ["  ", {text: "", click_event: {action: "suggest_command", command: "/data modify storage tpa:tpa temp.warp_edit.name set value \"\""}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.output.input_name.tooltip"}}, extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.input_name.brackets[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.input_name.label"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.input_name.brackets[1]"}]}, {text: "", click_event: {action: "suggest_command", command: "/data modify storage tpa:tpa temp.warp_edit.desc set value \"\""}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.output.input_desc.tooltip"}}, extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.input_desc.brackets[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.input_desc.label"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.input_desc.brackets[1]"}]}, " ", {text: "", click_event: {action: "run_command", command: "/function tpa:warp/edit/apply"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.output.apply.tooltip"}}, extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.apply.brackets[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.apply.label"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.apply.brackets[1]"}]}, " ", {text: "", click_event: {action: "run_command", command: "/function tpa:warp/edit/cancel"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.output.cancel.tooltip"}}, extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.cancel.brackets[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.cancel.label"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.cancel.brackets[1]"}]}]

data remove storage tpa:tpa temp.dialog
data modify storage tpa:tpa temp.dialog set value {type: "multi_action", can_close_with_escape: true, pause: false, columns: 4, after_action: "none"}
data modify storage tpa:tpa temp.dialog.title set from storage tpa:tpa temp.output.dialog_title

data modify storage tpa:tpa temp.dialog.body set value {type: "plain_message", contents: [], width: 600}
data modify storage tpa:tpa temp.dialog.body.contents append from storage tpa:tpa temp.output.langs[0]
data modify storage tpa:tpa temp.dialog.body.contents append from storage tpa:tpa temp.output.target_langs[0]
data modify storage tpa:tpa temp.dialog.body.contents append value {hover_event: {action: "show_text"}}
data modify storage tpa:tpa temp.dialog.body.contents[-1].text set from storage tpa:tpa temp.output.target_name
data modify storage tpa:tpa temp.dialog.body.contents[-1].hover_event.value set from storage tpa:tpa temp.output.target_desc
data modify storage tpa:tpa temp.dialog.body.contents append from storage tpa:tpa temp.output.target_index_langs[0]
data modify storage tpa:tpa temp.dialog.body.contents append from storage tpa:tpa temp.output.index
data modify storage tpa:tpa temp.dialog.body.contents append from storage tpa:tpa temp.output.target_index_langs[1]
data modify storage tpa:tpa temp.dialog.body.contents append from storage tpa:tpa temp.output.target_langs[1]
data modify storage tpa:tpa temp.dialog.body.contents append from storage tpa:tpa temp.output.langs[1]

data modify storage tpa:tpa temp.dialog.inputs set value [{key: "edit", type: "text", label: [], tooltip: []}]
data modify storage tpa:tpa temp.dialog.inputs[0].label append from storage tpa:tpa temp.output.input_name.label
data modify storage tpa:tpa temp.dialog.inputs[0].label append from storage tpa:tpa temp.output.input_desc.label
data modify storage tpa:tpa temp.dialog.inputs[0].tooltip append from storage tpa:tpa temp.output.input_name.tooltip
data modify storage tpa:tpa temp.dialog.inputs[0].tooltip append from storage tpa:tpa temp.output.input_desc.tooltip

data modify storage tpa:tpa temp.dialog.actions set value []

data modify storage tpa:tpa temp.dialog.actions append value {action: {type: "dynamic/run_command"}, label: [], tooltip: []}

data modify storage tpa:tpa temp.dialog.actions[-1].action.template set from storage tpa:tpa temp.output.edit_command_template
data modify storage tpa:tpa temp.dialog.actions[-1].label append from storage tpa:tpa temp.output.input_name.label
data modify storage tpa:tpa temp.dialog.actions[-1].label append from storage tpa:tpa temp.output.input_desc.label
data modify storage tpa:tpa temp.dialog.actions[-1].tooltip append from storage tpa:tpa temp.output.input_name.tooltip
data modify storage tpa:tpa temp.dialog.actions[-1].tooltip append from storage tpa:tpa temp.output.input_desc.tooltip

data modify storage tpa:tpa temp.dialog.actions append value {action: {type: "run_command", command: "/function tpa:warp/edit/apply"}}
data modify storage tpa:tpa temp.dialog.actions[-1].label set from storage tpa:tpa temp.output.apply.label
data modify storage tpa:tpa temp.dialog.actions[-1].tooltip set from storage tpa:tpa temp.output.apply.tooltip

data modify storage tpa:tpa temp.dialog.actions append value {action: {type: "run_command", command: "/function tpa:warp/edit/cancel"}}
data modify storage tpa:tpa temp.dialog.actions[-1].label set from storage tpa:tpa temp.output.cancel.label
data modify storage tpa:tpa temp.dialog.actions[-1].tooltip set from storage tpa:tpa temp.output.cancel.tooltip

data remove storage tpa:tpa temp.args
data modify storage tpa:tpa temp.args.dialog set from storage tpa:tpa temp.dialog
function tpa:warp/dialog with storage tpa:tpa temp.args
