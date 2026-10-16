# Parent function: tpa:warp/edit/name, tpa:warp/edit/desc
# Input: List[3] temp.output.langs, int temp.output.langs_format, str temp.output.edit_with \
         List[2] temp.output.target_langs, List[2] temp.output.target_index_langs, str temp.output.index, \
         str temp.output.dialog_title, \
         Button temp.output.apply, Button temp.output.cancel

# 你有上次尚未应用的更改: 将公共传送点#1(索引:1)名字改为基地. 请点击应用来保存更改或者点击取消来舍弃更改
#   [应用] [取消]

# warp_edit_unsaved_warn: "你有上次尚未应用的更改: 将%1$s改为%2$s. 请点击应用来保存更改或者点击取消来舍弃更改"

execute store result score #output.index_format tpa.variables run data get storage tpa:tpa temp.output.langs_format

# For considering of hover event for warp name, hard code format

execute if score #output.index_format tpa.variables matches 0 run tellraw @s ["", \
    {interpret: true,  storage: "tpa:tpa", nbt: "temp.output.langs[0]"}, \
    {interpret: true,  storage: "tpa:tpa", nbt: "temp.output.target_langs[0]"}, \
    {interpret: true,  storage: "tpa:tpa", nbt: "temp.output.target_name", \
        hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.output.target_desc"}}\
    }, \
    {interpret: true,  storage: "tpa:tpa", nbt: "temp.output.target_index_langs[0]"}, \
    {interpret: true,  storage: "tpa:tpa", nbt: "temp.output.index"}, \
    {interpret: true,  storage: "tpa:tpa", nbt: "temp.output.target_index_langs[1]"}, \
    {interpret: true,  storage: "tpa:tpa", nbt: "temp.output.target_langs[1]"}, \
    {interpret: true,  storage: "tpa:tpa", nbt: "temp.output.langs[1]"}, \
    {interpret: true,  storage: "tpa:tpa", nbt: "temp.output.edit_with"}, \
    {interpret: true,  storage: "tpa:tpa", nbt: "temp.output.langs[2]"}, \
]

execute if score #output.index_format tpa.variables matches 1 run tellraw @s ["", \
    {interpret: true,  storage: "tpa:tpa", nbt: "temp.output.langs[0]"}, \
    {interpret: true,  storage: "tpa:tpa", nbt: "temp.output.edit_with"}, \
    {interpret: true,  storage: "tpa:tpa", nbt: "temp.output.langs[1]"}, \
    {interpret: true,  storage: "tpa:tpa", nbt: "temp.output.target_langs[0]"}, \
    {interpret: true,  storage: "tpa:tpa", nbt: "temp.output.target_name", \
        hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.output.target_desc"}}\
    }, \
    {interpret: true,  storage: "tpa:tpa", nbt: "temp.output.target_index_langs[0]"}, \
    {interpret: true,  storage: "tpa:tpa", nbt: "temp.output.index"}, \
    {interpret: true,  storage: "tpa:tpa", nbt: "temp.output.target_index_langs[1]"}, \
    {interpret: true,  storage: "tpa:tpa", nbt: "temp.output.target_langs[1]"}, \
    {interpret: true,  storage: "tpa:tpa", nbt: "temp.output.langs[2]"}, \
]

tellraw @s ["  ", {text: "", click_event: {action: "run_command", command: "/function tpa:warp/edit/apply"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.output.apply.tooltip"}}, extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.apply.brackets[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.apply.label"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.apply.brackets[1]"}]}, " ", {text: "", click_event: {action: "run_command", command: "/function tpa:warp/edit/cancel"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.output.cancel.tooltip"}}, extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.cancel.brackets[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.cancel.label"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.cancel.brackets[1]"}]}]

data remove storage tpa:tpa temp.dialog
data modify storage tpa:tpa temp.dialog set value {type: "multi_action", can_close_with_escape: true, pause: false, columns: 4, after_action: "none"}
data modify storage tpa:tpa temp.dialog.title set from storage tpa:tpa temp.output.dialog_title

data modify storage tpa:tpa temp.dialog.body set value {type: "plain_message", contents: [], width: 600}

data modify storage tpa:tpa temp.output.arg_target set value []
data modify storage tpa:tpa temp.output.arg_target append from storage tpa:tpa temp.output.target_langs[0]
data modify storage tpa:tpa temp.output.arg_target append value {hover_event: {action: "show_text"}}
data modify storage tpa:tpa temp.output.arg_target[-1].text set from storage tpa:tpa temp.output.target_name
data modify storage tpa:tpa temp.output.arg_target[-1].hover_event.value set from storage tpa:tpa temp.output.target_desc
data modify storage tpa:tpa temp.output.arg_target append from storage tpa:tpa temp.output.target_index_langs[0]
data modify storage tpa:tpa temp.output.arg_target append from storage tpa:tpa temp.output.index
data modify storage tpa:tpa temp.output.arg_target append from storage tpa:tpa temp.output.target_index_langs[1]
data modify storage tpa:tpa temp.output.arg_target append from storage tpa:tpa temp.output.target_langs[1]

data modify storage tpa:tpa temp.dialog.body.contents append from storage tpa:tpa temp.output.langs[0]
execute if score #output.index_format tpa.variables matches 0 run data modify storage tpa:tpa temp.dialog.body.contents append from storage tpa:tpa temp.output.arg_target[]
execute if score #output.index_format tpa.variables matches 1 run data modify storage tpa:tpa temp.dialog.body.contents append from storage tpa:tpa temp.output.edit_with
data modify storage tpa:tpa temp.dialog.body.contents append from storage tpa:tpa temp.output.langs[1]
execute if score #output.index_format tpa.variables matches 0 run data modify storage tpa:tpa temp.dialog.body.contents append from storage tpa:tpa temp.output.edit_with
execute if score #output.index_format tpa.variables matches 1 run data modify storage tpa:tpa temp.dialog.body.contents append from storage tpa:tpa temp.output.arg_target[]
data modify storage tpa:tpa temp.dialog.body.contents append from storage tpa:tpa temp.output.langs[2]

data modify storage tpa:tpa temp.dialog.actions set value []

data modify storage tpa:tpa temp.dialog.actions append value {action: {type: "run_command", command: "/function tpa:warp/edit/apply"}}
data modify storage tpa:tpa temp.dialog.actions[-1].label set from storage tpa:tpa temp.output.apply.label
data modify storage tpa:tpa temp.dialog.actions[-1].tooltip set from storage tpa:tpa temp.output.apply.tooltip

data modify storage tpa:tpa temp.dialog.actions append value {action: {type: "run_command", command: "/function tpa:warp/edit/cancel"}}
data modify storage tpa:tpa temp.dialog.actions[-1].label set from storage tpa:tpa temp.output.cancel.label
data modify storage tpa:tpa temp.dialog.actions[-1].tooltip set from storage tpa:tpa temp.output.cancel.tooltip

data remove storage tpa:tpa temp.args
data modify storage tpa:tpa temp.args.dialog set from storage tpa:tpa temp.dialog
function tpa:warp/dialog with storage tpa:tpa temp.args
