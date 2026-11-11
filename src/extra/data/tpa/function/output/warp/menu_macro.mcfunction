# Parent function: tpa:output/warp/menu
# @macro: {color_0: str, color_1: str, color_2: str, color_3: str, color_4: str}
scoreboard players reset #output.index_format tpa.variables
execute store result score #output.index_format tpa.variables run data get storage tpa:tpa temp.output.slots[0].enabled.tooltip.hoverevent_location_format
data modify storage tpa:tpa temp.output.format_parser set value []
data modify storage tpa:tpa temp.output.format_parser append from storage tpa:tpa temp.output.slots[0].enabled.tooltip.hoverevent_location[0]
data modify storage tpa:tpa temp.output.append_indexes set from storage tpa:tpa temp.output.slots[0]
execute if score #output.index_format tpa.variables matches 0 run function tpa:output/warp/append_indexes
execute if score #output.index_format tpa.variables matches 1 run data modify storage tpa:tpa temp.output.format_parser append from storage tpa:tpa temp.output.slots[0].enabled.tooltip.dimension
data modify storage tpa:tpa temp.output.format_parser append from storage tpa:tpa temp.output.slots[0].enabled.tooltip.hoverevent_location[1]
execute if score #output.index_format tpa.variables matches 0 run data modify storage tpa:tpa temp.output.format_parser append from storage tpa:tpa temp.output.slots[0].enabled.tooltip.dimension
execute if score #output.index_format tpa.variables matches 1 run function tpa:output/warp/append_indexes
data modify storage tpa:tpa temp.output.format_parser append from storage tpa:tpa temp.output.slots[0].enabled.tooltip.hoverevent_location[2]
$tellraw @s[predicate=tpa:output/show_chatbar] ["  ", {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[0].label", color: "$(color_0)", \
    hover_event: {action: "show_text", value: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[0].enabled.tooltip.desc"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[0].enabled.tooltip.space"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[0].enabled.tooltip.brackets[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.format_parser[]", separator: "", color: "$(color_0)"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[0].enabled.tooltip.brackets[1]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[0].disabled.tooltip"}]}}, " ", \
    {text: "", extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[0].enabled.button_tp.brackets[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[0].enabled.button_tp.label"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[0].enabled.button_tp.brackets[1]"}], click_event: {action: "run_command", command: "/trigger tpa.warp set -3"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[0].enabled.button_tp.tooltip"}}}, {text: "", extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[0].disabled.button_tp.brackets[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[0].disabled.button_tp.label"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[0].disabled.button_tp.brackets[1]"}], hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[0].disabled.button_tp.tooltip"}}}, " ", \
    {text: "", extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[0].buttons.setpos.brackets[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[0].buttons.setpos.label"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[0].buttons.setpos.brackets[1]"}], click_event: {action: "run_command", command: "/function tpa:warp/setpos/slot_1"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[0].buttons.setpos.tooltip"}}}, " ", \
    {text: "", extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[0].buttons.setname.brackets[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[0].buttons.setname.label"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[0].buttons.setname.brackets[1]"}], click_event: {action: "run_command", command: "/function tpa:warp/setname/slot_1"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[0].buttons.setname.tooltip"}}}, " ", \
    {text: "", extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[0].buttons.setdesc.brackets[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[0].buttons.setdesc.label"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[0].buttons.setdesc.brackets[1]"}], click_event: {action: "run_command", command: "/function tpa:warp/setdesc/slot_1"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[0].buttons.setdesc.tooltip"}}}, " ", \
    {text: "", extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[0].buttons.rm.brackets[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[0].buttons.rm.label"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[0].buttons.rm.brackets[1]"}], click_event: {action: "run_command", command: "/function tpa:warp/remove/slot_1"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[0].buttons.rm.tooltip"}}}, " ", \
    {text: "", extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[0].enabled.disable.brackets[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[0].enabled.disable.label"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[0].enabled.disable.brackets[1]"}], click_event: {action: "run_command", command: "/function tpa:warp/disable/slot_1"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[0].enabled.disable.tooltip"}}}, {text: "", extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[0].disabled.enable.brackets[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[0].disabled.enable.label"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[0].disabled.enable.brackets[1]"}], click_event: {action: "run_command", command: "/function tpa:warp/enable/slot_1"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[0].disabled.enable.tooltip"}}}, " ", \
    {text: "", extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[0].buttons.moveup.brackets[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[0].buttons.moveup.label"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[0].buttons.moveup.brackets[1]"}], click_event: {action: "run_command", command: "/function tpa:warp/moveup/slot_1"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[0].buttons.moveup.tooltip"}}}, " ", \
    {text: "", extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[0].buttons.movedown.brackets[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[0].buttons.movedown.label"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[0].buttons.movedown.brackets[1]"}], click_event: {action: "run_command", command: "/function tpa:warp/movedown/slot_1"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[0].buttons.movedown.tooltip"}}}, " " \
]
data modify storage tpa:tpa temp.dialog.actions[0].label.label set from storage tpa:tpa temp.output.slots[0].label
data modify storage tpa:tpa temp.dialog.actions[0].label.color set from storage tpa:tpa temp.output.slots[0].color
data modify storage tpa:tpa temp.dialog.actions[0].tooltip set value [""]
data modify storage tpa:tpa temp.dialog.actions[0].tooltip append value storage tpa:tpa temp.output.slots[0].enabled.tooltip.desc
data modify storage tpa:tpa temp.dialog.actions[0].tooltip append value storage tpa:tpa temp.output.slots[0].enabled.tooltip.space
data modify storage tpa:tpa temp.dialog.actions[0].tooltip append value storage tpa:tpa temp.output.slots[0].enabled.tooltip.brackets[0]
data modify storage tpa:tpa temp.dialog.actions[0].tooltip append value {}
data modify storage tpa:tpa temp.dialog.actions[0].tooltip[-1].color set from storage tpa:tpa temp.output.slots[0].color
data modify storage tpa:tpa temp.dialog.actions[0].tooltip[-1].text value storage tpa:tpa temp.output.format_parser[]
data modify storage tpa:tpa temp.dialog.actions[0].tooltip append value storage tpa:tpa temp.output.slots[0].enabled.tooltip.brackets[1]
data modify storage tpa:tpa temp.dialog.actions[0].tooltip append value storage tpa:tpa temp.output.slots[0].disabled.tooltip

data modify storage tpa:tpa temp.dialog.actions[1].label set value []
data modify storage tpa:tpa temp.dialog.actions[1].label append from storage tpa:tpa temp.output.slots[0].enabled.button_tp.label
data modify storage tpa:tpa temp.dialog.actions[1].label append from storage tpa:tpa temp.output.slots[0].disabled.button_tp.label
data modify storage tpa:tpa temp.dialog.actions[1].tooltip set value []
data modify storage tpa:tpa temp.dialog.actions[1].tooltip append from storage tpa:tpa temp.output.slots[0].enabled.button_tp.tooltip
data modify storage tpa:tpa temp.dialog.actions[1].tooltip append from storage tpa:tpa temp.output.slots[0].disabled.button_tp.tooltip
execute unless data storage tpa:tpa temp.output.slots[0].button_tp.enabled run data remove storage tpa:tpa temp.dialog.actions[1].action

data modify storage tpa:tpa temp.dialog.actions[2].label set from storage tpa:tpa temp.output.slots[0].buttons.setpos.label
data modify storage tpa:tpa temp.dialog.actions[2].tooltip set from storage tpa:tpa temp.output.slots[0].buttons.setpos.tooltip
execute unless data storage tpa:tpa temp.output.slots[0].buttons.setpos run data remove storage tpa:tpa temp.dialog.actions[2].action

data modify storage tpa:tpa temp.dialog.actions[3].label set from storage tpa:tpa temp.output.slots[0].buttons.setname.label
data modify storage tpa:tpa temp.dialog.actions[3].tooltip set from storage tpa:tpa temp.output.slots[0].buttons.setname.tooltip
execute unless data storage tpa:tpa temp.output.slots[0].buttons.setname run data remove storage tpa:tpa temp.dialog.actions[3].action

data modify storage tpa:tpa temp.dialog.actions[4].label set from storage tpa:tpa temp.output.slots[0].buttons.setdesc.label
data modify storage tpa:tpa temp.dialog.actions[4].tooltip set from storage tpa:tpa temp.output.slots[0].buttons.setdesc.tooltip
execute unless data storage tpa:tpa temp.output.slots[0].buttons.setdesc run data remove storage tpa:tpa temp.dialog.actions[4].action

data modify storage tpa:tpa temp.dialog.actions[4].label set from storage tpa:tpa temp.output.slots[0].buttons.setdesc.label
data modify storage tpa:tpa temp.dialog.actions[4].tooltip set from storage tpa:tpa temp.output.slots[0].buttons.setdesc.tooltip
execute unless data storage tpa:tpa temp.output.slots[0].buttons.setdesc run data remove storage tpa:tpa temp.dialog.actions[4].action

data modify storage tpa:tpa temp.dialog.actions[5].label set from storage tpa:tpa temp.output.slots[0].buttons.rm.label
data modify storage tpa:tpa temp.dialog.actions[5].tooltip set from storage tpa:tpa temp.output.slots[0].buttons.rm.tooltip
execute unless data storage tpa:tpa temp.output.slots[0].buttons.rm run data remove storage tpa:tpa temp.dialog.actions[5].action

data modify storage tpa:tpa temp.dialog.actions[6].label set value []
data modify storage tpa:tpa temp.dialog.actions[6].label set from storage tpa:tpa temp.output.slots[0].enabled.disable.label
data modify storage tpa:tpa temp.dialog.actions[6].label set from storage tpa:tpa temp.output.slots[0].disabled.enable.label
data modify storage tpa:tpa temp.dialog.actions[6].tooltip set value []
data modify storage tpa:tpa temp.dialog.actions[6].tooltip set from storage tpa:tpa temp.output.slots[0].enabled.disable.tooltip
data modify storage tpa:tpa temp.dialog.actions[6].tooltip set from storage tpa:tpa temp.output.slots[0].disabled.enable.tooltip
execute unless data storage tpa:tpa temp.output.slots[0].enabled.disable run data modify storage tpa:tpa temp.dialog.actions[6].action.command set value "/function tpa:warp/enable/slot_1"

data modify storage tpa:tpa temp.dialog.actions[7].label set from storage tpa:tpa temp.output.slots[0].buttons.moveup.label
data modify storage tpa:tpa temp.dialog.actions[7].tooltip set from storage tpa:tpa temp.output.slots[0].buttons.moveup.tooltip
execute unless data storage tpa:tpa temp.output.slots[0].buttons.moveup run data remove storage tpa:tpa temp.dialog.actions[7].action

data modify storage tpa:tpa temp.dialog.actions[8].label set from storage tpa:tpa temp.output.slots[0].buttons.movedown.label
data modify storage tpa:tpa temp.dialog.actions[8].tooltip set from storage tpa:tpa temp.output.slots[0].buttons.movedown.tooltip
execute unless data storage tpa:tpa temp.output.slots[0].buttons.movedown run data remove storage tpa:tpa temp.dialog.actions[8].action
data modify storage tpa:tpa temp.dialog.actions[9].label.label set from storage tpa:tpa temp.output.slots[1].label
data modify storage tpa:tpa temp.dialog.actions[9].label.color set from storage tpa:tpa temp.output.slots[1].color
data modify storage tpa:tpa temp.dialog.actions[9].tooltip set value [""]
data modify storage tpa:tpa temp.dialog.actions[9].tooltip append value storage tpa:tpa temp.output.slots[1].enabled.tooltip.desc
data modify storage tpa:tpa temp.dialog.actions[9].tooltip append value storage tpa:tpa temp.output.slots[1].enabled.tooltip.space
data modify storage tpa:tpa temp.dialog.actions[9].tooltip append value storage tpa:tpa temp.output.slots[1].enabled.tooltip.brackets[0]
data modify storage tpa:tpa temp.dialog.actions[9].tooltip append value {}
data modify storage tpa:tpa temp.dialog.actions[9].tooltip[-1].color set from storage tpa:tpa temp.output.slots[1].color
data modify storage tpa:tpa temp.dialog.actions[9].tooltip[-1].text value storage tpa:tpa temp.output.format_parser[]
data modify storage tpa:tpa temp.dialog.actions[9].tooltip append value storage tpa:tpa temp.output.slots[1].enabled.tooltip.brackets[1]
data modify storage tpa:tpa temp.dialog.actions[9].tooltip append value storage tpa:tpa temp.output.slots[1].disabled.tooltip

data modify storage tpa:tpa temp.dialog.actions[10].label set value []
data modify storage tpa:tpa temp.dialog.actions[10].label append from storage tpa:tpa temp.output.slots[1].enabled.button_tp.label
data modify storage tpa:tpa temp.dialog.actions[10].label append from storage tpa:tpa temp.output.slots[1].disabled.button_tp.label
data modify storage tpa:tpa temp.dialog.actions[10].tooltip set value []
data modify storage tpa:tpa temp.dialog.actions[10].tooltip append from storage tpa:tpa temp.output.slots[1].enabled.button_tp.tooltip
data modify storage tpa:tpa temp.dialog.actions[10].tooltip append from storage tpa:tpa temp.output.slots[1].disabled.button_tp.tooltip
execute unless data storage tpa:tpa temp.output.slots[1].button_tp.enabled run data remove storage tpa:tpa temp.dialog.actions[10].action

data modify storage tpa:tpa temp.dialog.actions[11].label set from storage tpa:tpa temp.output.slots[1].buttons.setpos.label
data modify storage tpa:tpa temp.dialog.actions[11].tooltip set from storage tpa:tpa temp.output.slots[1].buttons.setpos.tooltip
execute unless data storage tpa:tpa temp.output.slots[1].buttons.setpos run data remove storage tpa:tpa temp.dialog.actions[11].action

data modify storage tpa:tpa temp.dialog.actions[12].label set from storage tpa:tpa temp.output.slots[1].buttons.setname.label
data modify storage tpa:tpa temp.dialog.actions[12].tooltip set from storage tpa:tpa temp.output.slots[1].buttons.setname.tooltip
execute unless data storage tpa:tpa temp.output.slots[1].buttons.setname run data remove storage tpa:tpa temp.dialog.actions[12].action

data modify storage tpa:tpa temp.dialog.actions[13].label set from storage tpa:tpa temp.output.slots[1].buttons.setdesc.label
data modify storage tpa:tpa temp.dialog.actions[13].tooltip set from storage tpa:tpa temp.output.slots[1].buttons.setdesc.tooltip
execute unless data storage tpa:tpa temp.output.slots[1].buttons.setdesc run data remove storage tpa:tpa temp.dialog.actions[13].action

data modify storage tpa:tpa temp.dialog.actions[13].label set from storage tpa:tpa temp.output.slots[1].buttons.setdesc.label
data modify storage tpa:tpa temp.dialog.actions[13].tooltip set from storage tpa:tpa temp.output.slots[1].buttons.setdesc.tooltip
execute unless data storage tpa:tpa temp.output.slots[1].buttons.setdesc run data remove storage tpa:tpa temp.dialog.actions[13].action

data modify storage tpa:tpa temp.dialog.actions[14].label set from storage tpa:tpa temp.output.slots[1].buttons.rm.label
data modify storage tpa:tpa temp.dialog.actions[14].tooltip set from storage tpa:tpa temp.output.slots[1].buttons.rm.tooltip
execute unless data storage tpa:tpa temp.output.slots[1].buttons.rm run data remove storage tpa:tpa temp.dialog.actions[14].action

data modify storage tpa:tpa temp.dialog.actions[15].label set value []
data modify storage tpa:tpa temp.dialog.actions[15].label set from storage tpa:tpa temp.output.slots[1].enabled.disable.label
data modify storage tpa:tpa temp.dialog.actions[15].label set from storage tpa:tpa temp.output.slots[1].disabled.enable.label
data modify storage tpa:tpa temp.dialog.actions[15].tooltip set value []
data modify storage tpa:tpa temp.dialog.actions[15].tooltip set from storage tpa:tpa temp.output.slots[1].enabled.disable.tooltip
data modify storage tpa:tpa temp.dialog.actions[15].tooltip set from storage tpa:tpa temp.output.slots[1].disabled.enable.tooltip
execute unless data storage tpa:tpa temp.output.slots[1].enabled.disable run data modify storage tpa:tpa temp.dialog.actions[15].action.command set value "/function tpa:warp/enable/slot_2"

data modify storage tpa:tpa temp.dialog.actions[16].label set from storage tpa:tpa temp.output.slots[1].buttons.moveup.label
data modify storage tpa:tpa temp.dialog.actions[16].tooltip set from storage tpa:tpa temp.output.slots[1].buttons.moveup.tooltip
execute unless data storage tpa:tpa temp.output.slots[1].buttons.moveup run data remove storage tpa:tpa temp.dialog.actions[16].action

data modify storage tpa:tpa temp.dialog.actions[17].label set from storage tpa:tpa temp.output.slots[1].buttons.movedown.label
data modify storage tpa:tpa temp.dialog.actions[17].tooltip set from storage tpa:tpa temp.output.slots[1].buttons.movedown.tooltip
execute unless data storage tpa:tpa temp.output.slots[1].buttons.movedown run data remove storage tpa:tpa temp.dialog.actions[17].action

data modify storage tpa:tpa temp.dialog.actions[18].label.label set from storage tpa:tpa temp.output.slots[2].label
data modify storage tpa:tpa temp.dialog.actions[18].label.color set from storage tpa:tpa temp.output.slots[2].color
data modify storage tpa:tpa temp.dialog.actions[18].tooltip set value [""]
data modify storage tpa:tpa temp.dialog.actions[18].tooltip append value storage tpa:tpa temp.output.slots[2].enabled.tooltip.desc
data modify storage tpa:tpa temp.dialog.actions[18].tooltip append value storage tpa:tpa temp.output.slots[2].enabled.tooltip.space
data modify storage tpa:tpa temp.dialog.actions[18].tooltip append value storage tpa:tpa temp.output.slots[2].enabled.tooltip.brackets[0]
data modify storage tpa:tpa temp.dialog.actions[18].tooltip append value {}
data modify storage tpa:tpa temp.dialog.actions[18].tooltip[-1].color set from storage tpa:tpa temp.output.slots[2].color
data modify storage tpa:tpa temp.dialog.actions[18].tooltip[-1].text value storage tpa:tpa temp.output.format_parser[]
data modify storage tpa:tpa temp.dialog.actions[18].tooltip append value storage tpa:tpa temp.output.slots[2].enabled.tooltip.brackets[1]
data modify storage tpa:tpa temp.dialog.actions[18].tooltip append value storage tpa:tpa temp.output.slots[2].disabled.tooltip

data modify storage tpa:tpa temp.dialog.actions[19].label set value []
data modify storage tpa:tpa temp.dialog.actions[19].label append from storage tpa:tpa temp.output.slots[2].enabled.button_tp.label
data modify storage tpa:tpa temp.dialog.actions[19].label append from storage tpa:tpa temp.output.slots[2].disabled.button_tp.label
data modify storage tpa:tpa temp.dialog.actions[19].tooltip set value []
data modify storage tpa:tpa temp.dialog.actions[19].tooltip append from storage tpa:tpa temp.output.slots[2].enabled.button_tp.tooltip
data modify storage tpa:tpa temp.dialog.actions[19].tooltip append from storage tpa:tpa temp.output.slots[2].disabled.button_tp.tooltip
execute unless data storage tpa:tpa temp.output.slots[2].button_tp.enabled run data remove storage tpa:tpa temp.dialog.actions[19].action

data modify storage tpa:tpa temp.dialog.actions[20].label set from storage tpa:tpa temp.output.slots[2].buttons.setpos.label
data modify storage tpa:tpa temp.dialog.actions[20].tooltip set from storage tpa:tpa temp.output.slots[2].buttons.setpos.tooltip
execute unless data storage tpa:tpa temp.output.slots[2].buttons.setpos run data remove storage tpa:tpa temp.dialog.actions[20].action

data modify storage tpa:tpa temp.dialog.actions[21].label set from storage tpa:tpa temp.output.slots[2].buttons.setname.label
data modify storage tpa:tpa temp.dialog.actions[21].tooltip set from storage tpa:tpa temp.output.slots[2].buttons.setname.tooltip
execute unless data storage tpa:tpa temp.output.slots[2].buttons.setname run data remove storage tpa:tpa temp.dialog.actions[21].action

data modify storage tpa:tpa temp.dialog.actions[22].label set from storage tpa:tpa temp.output.slots[2].buttons.setdesc.label
data modify storage tpa:tpa temp.dialog.actions[22].tooltip set from storage tpa:tpa temp.output.slots[2].buttons.setdesc.tooltip
execute unless data storage tpa:tpa temp.output.slots[2].buttons.setdesc run data remove storage tpa:tpa temp.dialog.actions[22].action

data modify storage tpa:tpa temp.dialog.actions[22].label set from storage tpa:tpa temp.output.slots[2].buttons.setdesc.label
data modify storage tpa:tpa temp.dialog.actions[22].tooltip set from storage tpa:tpa temp.output.slots[2].buttons.setdesc.tooltip
execute unless data storage tpa:tpa temp.output.slots[2].buttons.setdesc run data remove storage tpa:tpa temp.dialog.actions[22].action

data modify storage tpa:tpa temp.dialog.actions[23].label set from storage tpa:tpa temp.output.slots[2].buttons.rm.label
data modify storage tpa:tpa temp.dialog.actions[23].tooltip set from storage tpa:tpa temp.output.slots[2].buttons.rm.tooltip
execute unless data storage tpa:tpa temp.output.slots[2].buttons.rm run data remove storage tpa:tpa temp.dialog.actions[23].action

data modify storage tpa:tpa temp.dialog.actions[24].label set value []
data modify storage tpa:tpa temp.dialog.actions[24].label set from storage tpa:tpa temp.output.slots[2].enabled.disable.label
data modify storage tpa:tpa temp.dialog.actions[24].label set from storage tpa:tpa temp.output.slots[2].disabled.enable.label
data modify storage tpa:tpa temp.dialog.actions[24].tooltip set value []
data modify storage tpa:tpa temp.dialog.actions[24].tooltip set from storage tpa:tpa temp.output.slots[2].enabled.disable.tooltip
data modify storage tpa:tpa temp.dialog.actions[24].tooltip set from storage tpa:tpa temp.output.slots[2].disabled.enable.tooltip
execute unless data storage tpa:tpa temp.output.slots[2].enabled.disable run data modify storage tpa:tpa temp.dialog.actions[24].action.command set value "/function tpa:warp/enable/slot_3"

data modify storage tpa:tpa temp.dialog.actions[25].label set from storage tpa:tpa temp.output.slots[2].buttons.moveup.label
data modify storage tpa:tpa temp.dialog.actions[25].tooltip set from storage tpa:tpa temp.output.slots[2].buttons.moveup.tooltip
execute unless data storage tpa:tpa temp.output.slots[2].buttons.moveup run data remove storage tpa:tpa temp.dialog.actions[25].action

data modify storage tpa:tpa temp.dialog.actions[26].label set from storage tpa:tpa temp.output.slots[2].buttons.movedown.label
data modify storage tpa:tpa temp.dialog.actions[26].tooltip set from storage tpa:tpa temp.output.slots[2].buttons.movedown.tooltip
execute unless data storage tpa:tpa temp.output.slots[2].buttons.movedown run data remove storage tpa:tpa temp.dialog.actions[26].action

data modify storage tpa:tpa temp.dialog.actions[27].label.label set from storage tpa:tpa temp.output.slots[3].label
data modify storage tpa:tpa temp.dialog.actions[27].label.color set from storage tpa:tpa temp.output.slots[3].color
data modify storage tpa:tpa temp.dialog.actions[27].tooltip set value [""]
data modify storage tpa:tpa temp.dialog.actions[27].tooltip append value storage tpa:tpa temp.output.slots[3].enabled.tooltip.desc
data modify storage tpa:tpa temp.dialog.actions[27].tooltip append value storage tpa:tpa temp.output.slots[3].enabled.tooltip.space
data modify storage tpa:tpa temp.dialog.actions[27].tooltip append value storage tpa:tpa temp.output.slots[3].enabled.tooltip.brackets[0]
data modify storage tpa:tpa temp.dialog.actions[27].tooltip append value {}
data modify storage tpa:tpa temp.dialog.actions[27].tooltip[-1].color set from storage tpa:tpa temp.output.slots[3].color
data modify storage tpa:tpa temp.dialog.actions[27].tooltip[-1].text value storage tpa:tpa temp.output.format_parser[]
data modify storage tpa:tpa temp.dialog.actions[27].tooltip append value storage tpa:tpa temp.output.slots[3].enabled.tooltip.brackets[1]
data modify storage tpa:tpa temp.dialog.actions[27].tooltip append value storage tpa:tpa temp.output.slots[3].disabled.tooltip

data modify storage tpa:tpa temp.dialog.actions[28].label set value []
data modify storage tpa:tpa temp.dialog.actions[28].label append from storage tpa:tpa temp.output.slots[3].enabled.button_tp.label
data modify storage tpa:tpa temp.dialog.actions[28].label append from storage tpa:tpa temp.output.slots[3].disabled.button_tp.label
data modify storage tpa:tpa temp.dialog.actions[28].tooltip set value []
data modify storage tpa:tpa temp.dialog.actions[28].tooltip append from storage tpa:tpa temp.output.slots[3].enabled.button_tp.tooltip
data modify storage tpa:tpa temp.dialog.actions[28].tooltip append from storage tpa:tpa temp.output.slots[3].disabled.button_tp.tooltip
execute unless data storage tpa:tpa temp.output.slots[3].button_tp.enabled run data remove storage tpa:tpa temp.dialog.actions[28].action

data modify storage tpa:tpa temp.dialog.actions[29].label set from storage tpa:tpa temp.output.slots[3].buttons.setpos.label
data modify storage tpa:tpa temp.dialog.actions[29].tooltip set from storage tpa:tpa temp.output.slots[3].buttons.setpos.tooltip
execute unless data storage tpa:tpa temp.output.slots[3].buttons.setpos run data remove storage tpa:tpa temp.dialog.actions[29].action

data modify storage tpa:tpa temp.dialog.actions[30].label set from storage tpa:tpa temp.output.slots[3].buttons.setname.label
data modify storage tpa:tpa temp.dialog.actions[30].tooltip set from storage tpa:tpa temp.output.slots[3].buttons.setname.tooltip
execute unless data storage tpa:tpa temp.output.slots[3].buttons.setname run data remove storage tpa:tpa temp.dialog.actions[30].action

data modify storage tpa:tpa temp.dialog.actions[31].label set from storage tpa:tpa temp.output.slots[3].buttons.setdesc.label
data modify storage tpa:tpa temp.dialog.actions[31].tooltip set from storage tpa:tpa temp.output.slots[3].buttons.setdesc.tooltip
execute unless data storage tpa:tpa temp.output.slots[3].buttons.setdesc run data remove storage tpa:tpa temp.dialog.actions[31].action

data modify storage tpa:tpa temp.dialog.actions[31].label set from storage tpa:tpa temp.output.slots[3].buttons.setdesc.label
data modify storage tpa:tpa temp.dialog.actions[31].tooltip set from storage tpa:tpa temp.output.slots[3].buttons.setdesc.tooltip
execute unless data storage tpa:tpa temp.output.slots[3].buttons.setdesc run data remove storage tpa:tpa temp.dialog.actions[31].action

data modify storage tpa:tpa temp.dialog.actions[32].label set from storage tpa:tpa temp.output.slots[3].buttons.rm.label
data modify storage tpa:tpa temp.dialog.actions[32].tooltip set from storage tpa:tpa temp.output.slots[3].buttons.rm.tooltip
execute unless data storage tpa:tpa temp.output.slots[3].buttons.rm run data remove storage tpa:tpa temp.dialog.actions[32].action

data modify storage tpa:tpa temp.dialog.actions[33].label set value []
data modify storage tpa:tpa temp.dialog.actions[33].label set from storage tpa:tpa temp.output.slots[3].enabled.disable.label
data modify storage tpa:tpa temp.dialog.actions[33].label set from storage tpa:tpa temp.output.slots[3].disabled.enable.label
data modify storage tpa:tpa temp.dialog.actions[33].tooltip set value []
data modify storage tpa:tpa temp.dialog.actions[33].tooltip set from storage tpa:tpa temp.output.slots[3].enabled.disable.tooltip
data modify storage tpa:tpa temp.dialog.actions[33].tooltip set from storage tpa:tpa temp.output.slots[3].disabled.enable.tooltip
execute unless data storage tpa:tpa temp.output.slots[3].enabled.disable run data modify storage tpa:tpa temp.dialog.actions[33].action.command set value "/function tpa:warp/enable/slot_4"

data modify storage tpa:tpa temp.dialog.actions[34].label set from storage tpa:tpa temp.output.slots[3].buttons.moveup.label
data modify storage tpa:tpa temp.dialog.actions[34].tooltip set from storage tpa:tpa temp.output.slots[3].buttons.moveup.tooltip
execute unless data storage tpa:tpa temp.output.slots[3].buttons.moveup run data remove storage tpa:tpa temp.dialog.actions[34].action

data modify storage tpa:tpa temp.dialog.actions[35].label set from storage tpa:tpa temp.output.slots[3].buttons.movedown.label
data modify storage tpa:tpa temp.dialog.actions[35].tooltip set from storage tpa:tpa temp.output.slots[3].buttons.movedown.tooltip
execute unless data storage tpa:tpa temp.output.slots[3].buttons.movedown run data remove storage tpa:tpa temp.dialog.actions[35].action

data modify storage tpa:tpa temp.dialog.actions[36].label.label set from storage tpa:tpa temp.output.slots[4].label
data modify storage tpa:tpa temp.dialog.actions[36].label.color set from storage tpa:tpa temp.output.slots[4].color
data modify storage tpa:tpa temp.dialog.actions[36].tooltip set value [""]
data modify storage tpa:tpa temp.dialog.actions[36].tooltip append value storage tpa:tpa temp.output.slots[4].enabled.tooltip.desc
data modify storage tpa:tpa temp.dialog.actions[36].tooltip append value storage tpa:tpa temp.output.slots[4].enabled.tooltip.space
data modify storage tpa:tpa temp.dialog.actions[36].tooltip append value storage tpa:tpa temp.output.slots[4].enabled.tooltip.brackets[0]
data modify storage tpa:tpa temp.dialog.actions[36].tooltip append value {}
data modify storage tpa:tpa temp.dialog.actions[36].tooltip[-1].color set from storage tpa:tpa temp.output.slots[4].color
data modify storage tpa:tpa temp.dialog.actions[36].tooltip[-1].text value storage tpa:tpa temp.output.format_parser[]
data modify storage tpa:tpa temp.dialog.actions[36].tooltip append value storage tpa:tpa temp.output.slots[4].enabled.tooltip.brackets[1]
data modify storage tpa:tpa temp.dialog.actions[36].tooltip append value storage tpa:tpa temp.output.slots[4].disabled.tooltip

data modify storage tpa:tpa temp.dialog.actions[37].label set value []
data modify storage tpa:tpa temp.dialog.actions[37].label append from storage tpa:tpa temp.output.slots[4].enabled.button_tp.label
data modify storage tpa:tpa temp.dialog.actions[37].label append from storage tpa:tpa temp.output.slots[4].disabled.button_tp.label
data modify storage tpa:tpa temp.dialog.actions[37].tooltip set value []
data modify storage tpa:tpa temp.dialog.actions[37].tooltip append from storage tpa:tpa temp.output.slots[4].enabled.button_tp.tooltip
data modify storage tpa:tpa temp.dialog.actions[37].tooltip append from storage tpa:tpa temp.output.slots[4].disabled.button_tp.tooltip
execute unless data storage tpa:tpa temp.output.slots[4].button_tp.enabled run data remove storage tpa:tpa temp.dialog.actions[37].action

data modify storage tpa:tpa temp.dialog.actions[38].label set from storage tpa:tpa temp.output.slots[4].buttons.setpos.label
data modify storage tpa:tpa temp.dialog.actions[38].tooltip set from storage tpa:tpa temp.output.slots[4].buttons.setpos.tooltip
execute unless data storage tpa:tpa temp.output.slots[4].buttons.setpos run data remove storage tpa:tpa temp.dialog.actions[38].action

data modify storage tpa:tpa temp.dialog.actions[39].label set from storage tpa:tpa temp.output.slots[4].buttons.setname.label
data modify storage tpa:tpa temp.dialog.actions[39].tooltip set from storage tpa:tpa temp.output.slots[4].buttons.setname.tooltip
execute unless data storage tpa:tpa temp.output.slots[4].buttons.setname run data remove storage tpa:tpa temp.dialog.actions[39].action

data modify storage tpa:tpa temp.dialog.actions[40].label set from storage tpa:tpa temp.output.slots[4].buttons.setdesc.label
data modify storage tpa:tpa temp.dialog.actions[40].tooltip set from storage tpa:tpa temp.output.slots[4].buttons.setdesc.tooltip
execute unless data storage tpa:tpa temp.output.slots[4].buttons.setdesc run data remove storage tpa:tpa temp.dialog.actions[40].action

data modify storage tpa:tpa temp.dialog.actions[40].label set from storage tpa:tpa temp.output.slots[4].buttons.setdesc.label
data modify storage tpa:tpa temp.dialog.actions[40].tooltip set from storage tpa:tpa temp.output.slots[4].buttons.setdesc.tooltip
execute unless data storage tpa:tpa temp.output.slots[4].buttons.setdesc run data remove storage tpa:tpa temp.dialog.actions[40].action

data modify storage tpa:tpa temp.dialog.actions[41].label set from storage tpa:tpa temp.output.slots[4].buttons.rm.label
data modify storage tpa:tpa temp.dialog.actions[41].tooltip set from storage tpa:tpa temp.output.slots[4].buttons.rm.tooltip
execute unless data storage tpa:tpa temp.output.slots[4].buttons.rm run data remove storage tpa:tpa temp.dialog.actions[41].action

data modify storage tpa:tpa temp.dialog.actions[42].label set value []
data modify storage tpa:tpa temp.dialog.actions[42].label set from storage tpa:tpa temp.output.slots[4].enabled.disable.label
data modify storage tpa:tpa temp.dialog.actions[42].label set from storage tpa:tpa temp.output.slots[4].disabled.enable.label
data modify storage tpa:tpa temp.dialog.actions[42].tooltip set value []
data modify storage tpa:tpa temp.dialog.actions[42].tooltip set from storage tpa:tpa temp.output.slots[4].enabled.disable.tooltip
data modify storage tpa:tpa temp.dialog.actions[42].tooltip set from storage tpa:tpa temp.output.slots[4].disabled.enable.tooltip
execute unless data storage tpa:tpa temp.output.slots[4].enabled.disable run data modify storage tpa:tpa temp.dialog.actions[42].action.command set value "/function tpa:warp/enable/slot_5"

data modify storage tpa:tpa temp.dialog.actions[43].label set from storage tpa:tpa temp.output.slots[4].buttons.moveup.label
data modify storage tpa:tpa temp.dialog.actions[43].tooltip set from storage tpa:tpa temp.output.slots[4].buttons.moveup.tooltip
execute unless data storage tpa:tpa temp.output.slots[4].buttons.moveup run data remove storage tpa:tpa temp.dialog.actions[43].action

data modify storage tpa:tpa temp.dialog.actions[44].label set from storage tpa:tpa temp.output.slots[4].buttons.movedown.label
data modify storage tpa:tpa temp.dialog.actions[44].tooltip set from storage tpa:tpa temp.output.slots[4].buttons.movedown.tooltip
execute unless data storage tpa:tpa temp.output.slots[4].buttons.movedown run data remove storage tpa:tpa temp.dialog.actions[44].action

scoreboard players reset #output.index_format tpa.variables
execute store result score #output.index_format tpa.variables run data get storage tpa:tpa temp.output.slots[1].enabled.tooltip.hoverevent_location_format
data modify storage tpa:tpa temp.output.format_parser set value []
data modify storage tpa:tpa temp.output.format_parser append from storage tpa:tpa temp.output.slots[1].enabled.tooltip.hoverevent_location[0]
data modify storage tpa:tpa temp.output.append_indexes set from storage tpa:tpa temp.output.slots[1]
execute if score #output.index_format tpa.variables matches 0 run function tpa:output/warp/append_indexes
execute if score #output.index_format tpa.variables matches 1 run data modify storage tpa:tpa temp.output.format_parser append from storage tpa:tpa temp.output.slots[1].enabled.tooltip.dimension
data modify storage tpa:tpa temp.output.format_parser append from storage tpa:tpa temp.output.slots[1].enabled.tooltip.hoverevent_location[1]
execute if score #output.index_format tpa.variables matches 0 run data modify storage tpa:tpa temp.output.format_parser append from storage tpa:tpa temp.output.slots[1].enabled.tooltip.dimension
execute if score #output.index_format tpa.variables matches 1 run function tpa:output/warp/append_indexes
data modify storage tpa:tpa temp.output.format_parser append from storage tpa:tpa temp.output.slots[1].enabled.tooltip.hoverevent_location[2]
$tellraw @s[predicate=tpa:output/show_chatbar] ["  ", {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[1].label", color: "$(color_1)", \
    hover_event: {action: "show_text", value: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[1].enabled.tooltip.desc"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[1].enabled.tooltip.space"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[1].enabled.tooltip.brackets[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.format_parser[]", separator: "", color: "$(color_1)"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[1].enabled.tooltip.brackets[1]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[1].disabled.tooltip"}]}}, " ", \
    {text: "", extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[1].enabled.button_tp.brackets[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[1].enabled.button_tp.label"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[1].enabled.button_tp.brackets[1]"}], click_event: {action: "run_command", command: "/trigger tpa.warp set -4"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[1].enabled.button_tp.tooltip"}}}, {text: "", extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[1].disabled.button_tp.brackets[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[1].disabled.button_tp.label"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[1].disabled.button_tp.brackets[1]"}], hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[1].disabled.button_tp.tooltip"}}}, " ", \
    {text: "", extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[1].buttons.setpos.brackets[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[1].buttons.setpos.label"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[1].buttons.setpos.brackets[1]"}], click_event: {action: "run_command", command: "/function tpa:warp/setpos/slot_2"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[1].buttons.setpos.tooltip"}}}, " ", \
    {text: "", extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[1].buttons.setname.brackets[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[1].buttons.setname.label"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[1].buttons.setname.brackets[1]"}], click_event: {action: "run_command", command: "/function tpa:warp/setname/slot_2"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[1].buttons.setname.tooltip"}}}, " ", \
    {text: "", extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[1].buttons.setdesc.brackets[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[1].buttons.setdesc.label"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[1].buttons.setdesc.brackets[1]"}], click_event: {action: "run_command", command: "/function tpa:warp/setdesc/slot_2"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[1].buttons.setdesc.tooltip"}}}, " ", \
    {text: "", extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[1].buttons.rm.brackets[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[1].buttons.rm.label"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[1].buttons.rm.brackets[1]"}], click_event: {action: "run_command", command: "/function tpa:warp/remove/slot_2"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[1].buttons.rm.tooltip"}}}, " ", \
    {text: "", extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[1].enabled.disable.brackets[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[1].enabled.disable.label"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[1].enabled.disable.brackets[1]"}], click_event: {action: "run_command", command: "/function tpa:warp/disable/slot_2"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[1].enabled.disable.tooltip"}}}, {text: "", extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[1].disabled.enable.brackets[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[1].disabled.enable.label"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[1].disabled.enable.brackets[1]"}], click_event: {action: "run_command", command: "/function tpa:warp/enable/slot_2"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[1].disabled.enable.tooltip"}}}, " ", \
    {text: "", extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[1].buttons.moveup.brackets[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[1].buttons.moveup.label"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[1].buttons.moveup.brackets[1]"}], click_event: {action: "run_command", command: "/function tpa:warp/moveup/slot_2"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[1].buttons.moveup.tooltip"}}}, " ", \
    {text: "", extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[1].buttons.movedown.brackets[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[1].buttons.movedown.label"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[1].buttons.movedown.brackets[1]"}], click_event: {action: "run_command", command: "/function tpa:warp/movedown/slot_2"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[1].buttons.movedown.tooltip"}}}, " " \
]

scoreboard players reset #output.index_format tpa.variables
execute store result score #output.index_format tpa.variables run data get storage tpa:tpa temp.output.slots[2].enabled.tooltip.hoverevent_location_format
data modify storage tpa:tpa temp.output.format_parser set value []
data modify storage tpa:tpa temp.output.format_parser append from storage tpa:tpa temp.output.slots[2].enabled.tooltip.hoverevent_location[0]
data modify storage tpa:tpa temp.output.append_indexes set from storage tpa:tpa temp.output.slots[2]
execute if score #output.index_format tpa.variables matches 0 run function tpa:output/warp/append_indexes
execute if score #output.index_format tpa.variables matches 1 run data modify storage tpa:tpa temp.output.format_parser append from storage tpa:tpa temp.output.slots[2].enabled.tooltip.dimension
data modify storage tpa:tpa temp.output.format_parser append from storage tpa:tpa temp.output.slots[2].enabled.tooltip.hoverevent_location[1]
execute if score #output.index_format tpa.variables matches 0 run data modify storage tpa:tpa temp.output.format_parser append from storage tpa:tpa temp.output.slots[2].enabled.tooltip.dimension
execute if score #output.index_format tpa.variables matches 1 run function tpa:output/warp/append_indexes
data modify storage tpa:tpa temp.output.format_parser append from storage tpa:tpa temp.output.slots[2].enabled.tooltip.hoverevent_location[2]
$tellraw @s[predicate=tpa:output/show_chatbar] ["  ", {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[2].label", color: "$(color_2)", \
    hover_event: {action: "show_text", value: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[2].enabled.tooltip.desc"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[2].enabled.tooltip.space"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[2].enabled.tooltip.brackets[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.format_parser[]", separator: "", color: "$(color_2)"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[2].enabled.tooltip.brackets[1]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[2].disabled.tooltip"}]}}, " ", \
    {text: "", extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[2].enabled.button_tp.brackets[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[2].enabled.button_tp.label"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[2].enabled.button_tp.brackets[1]"}], click_event: {action: "run_command", command: "/trigger tpa.warp set -5"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[2].enabled.button_tp.tooltip"}}}, {text: "", extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[2].disabled.button_tp.brackets[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[2].disabled.button_tp.label"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[2].disabled.button_tp.brackets[1]"}], hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[2].disabled.button_tp.tooltip"}}}, " ", \
    {text: "", extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[2].buttons.setpos.brackets[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[2].buttons.setpos.label"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[2].buttons.setpos.brackets[1]"}], click_event: {action: "run_command", command: "/function tpa:warp/setpos/slot_3"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[2].buttons.setpos.tooltip"}}}, " ", \
    {text: "", extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[2].buttons.setname.brackets[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[2].buttons.setname.label"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[2].buttons.setname.brackets[1]"}], click_event: {action: "run_command", command: "/function tpa:warp/setname/slot_3"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[2].buttons.setname.tooltip"}}}, " ", \
    {text: "", extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[2].buttons.setdesc.brackets[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[2].buttons.setdesc.label"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[2].buttons.setdesc.brackets[1]"}], click_event: {action: "run_command", command: "/function tpa:warp/setdesc/slot_3"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[2].buttons.setdesc.tooltip"}}}, " ", \
    {text: "", extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[2].buttons.rm.brackets[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[2].buttons.rm.label"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[2].buttons.rm.brackets[1]"}], click_event: {action: "run_command", command: "/function tpa:warp/remove/slot_3"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[2].buttons.rm.tooltip"}}}, " ", \
    {text: "", extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[2].enabled.disable.brackets[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[2].enabled.disable.label"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[2].enabled.disable.brackets[1]"}], click_event: {action: "run_command", command: "/function tpa:warp/disable/slot_3"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[2].enabled.disable.tooltip"}}}, {text: "", extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[2].disabled.enable.brackets[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[2].disabled.enable.label"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[2].disabled.enable.brackets[1]"}], click_event: {action: "run_command", command: "/function tpa:warp/enable/slot_3"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[2].disabled.enable.tooltip"}}}, " ", \
    {text: "", extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[2].buttons.moveup.brackets[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[2].buttons.moveup.label"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[2].buttons.moveup.brackets[1]"}], click_event: {action: "run_command", command: "/function tpa:warp/moveup/slot_3"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[2].buttons.moveup.tooltip"}}}, " ", \
    {text: "", extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[2].buttons.movedown.brackets[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[2].buttons.movedown.label"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[2].buttons.movedown.brackets[1]"}], click_event: {action: "run_command", command: "/function tpa:warp/movedown/slot_3"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[2].buttons.movedown.tooltip"}}}, " " \
]

scoreboard players reset #output.index_format tpa.variables
execute store result score #output.index_format tpa.variables run data get storage tpa:tpa temp.output.slots[3].enabled.tooltip.hoverevent_location_format
data modify storage tpa:tpa temp.output.format_parser set value []
data modify storage tpa:tpa temp.output.format_parser append from storage tpa:tpa temp.output.slots[3].enabled.tooltip.hoverevent_location[0]
data modify storage tpa:tpa temp.output.append_indexes set from storage tpa:tpa temp.output.slots[3]
execute if score #output.index_format tpa.variables matches 0 run function tpa:output/warp/append_indexes
execute if score #output.index_format tpa.variables matches 1 run data modify storage tpa:tpa temp.output.format_parser append from storage tpa:tpa temp.output.slots[3].enabled.tooltip.dimension
data modify storage tpa:tpa temp.output.format_parser append from storage tpa:tpa temp.output.slots[3].enabled.tooltip.hoverevent_location[1]
execute if score #output.index_format tpa.variables matches 0 run data modify storage tpa:tpa temp.output.format_parser append from storage tpa:tpa temp.output.slots[3].enabled.tooltip.dimension
execute if score #output.index_format tpa.variables matches 1 run function tpa:output/warp/append_indexes
data modify storage tpa:tpa temp.output.format_parser append from storage tpa:tpa temp.output.slots[3].enabled.tooltip.hoverevent_location[2]
$tellraw @s[predicate=tpa:output/show_chatbar] ["  ", {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[3].label", color: "$(color_3)", \
    hover_event: {action: "show_text", value: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[3].enabled.tooltip.desc"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[3].enabled.tooltip.space"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[3].enabled.tooltip.brackets[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.format_parser[]", separator: "", color: "$(color_3)"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[3].enabled.tooltip.brackets[1]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[3].disabled.tooltip"}]}}, " ", \
    {text: "", extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[3].enabled.button_tp.brackets[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[3].enabled.button_tp.label"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[3].enabled.button_tp.brackets[1]"}], click_event: {action: "run_command", command: "/trigger tpa.warp set -6"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[3].enabled.button_tp.tooltip"}}}, {text: "", extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[3].disabled.button_tp.brackets[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[3].disabled.button_tp.label"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[3].disabled.button_tp.brackets[1]"}], hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[3].disabled.button_tp.tooltip"}}}, " ", \
    {text: "", extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[3].buttons.setpos.brackets[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[3].buttons.setpos.label"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[3].buttons.setpos.brackets[1]"}], click_event: {action: "run_command", command: "/function tpa:warp/setpos/slot_4"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[3].buttons.setpos.tooltip"}}}, " ", \
    {text: "", extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[3].buttons.setname.brackets[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[3].buttons.setname.label"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[3].buttons.setname.brackets[1]"}], click_event: {action: "run_command", command: "/function tpa:warp/setname/slot_4"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[3].buttons.setname.tooltip"}}}, " ", \
    {text: "", extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[3].buttons.setdesc.brackets[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[3].buttons.setdesc.label"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[3].buttons.setdesc.brackets[1]"}], click_event: {action: "run_command", command: "/function tpa:warp/setdesc/slot_4"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[3].buttons.setdesc.tooltip"}}}, " ", \
    {text: "", extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[3].buttons.rm.brackets[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[3].buttons.rm.label"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[3].buttons.rm.brackets[1]"}], click_event: {action: "run_command", command: "/function tpa:warp/remove/slot_4"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[3].buttons.rm.tooltip"}}}, " ", \
    {text: "", extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[3].enabled.disable.brackets[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[3].enabled.disable.label"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[3].enabled.disable.brackets[1]"}], click_event: {action: "run_command", command: "/function tpa:warp/disable/slot_4"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[3].enabled.disable.tooltip"}}}, {text: "", extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[3].disabled.enable.brackets[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[3].disabled.enable.label"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[3].disabled.enable.brackets[1]"}], click_event: {action: "run_command", command: "/function tpa:warp/enable/slot_4"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[3].disabled.enable.tooltip"}}}, " ", \
    {text: "", extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[3].buttons.moveup.brackets[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[3].buttons.moveup.label"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[3].buttons.moveup.brackets[1]"}], click_event: {action: "run_command", command: "/function tpa:warp/moveup/slot_4"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[3].buttons.moveup.tooltip"}}}, " ", \
    {text: "", extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[3].buttons.movedown.brackets[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[3].buttons.movedown.label"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[3].buttons.movedown.brackets[1]"}], click_event: {action: "run_command", command: "/function tpa:warp/movedown/slot_4"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[3].buttons.movedown.tooltip"}}}, " " \
]

scoreboard players reset #output.index_format tpa.variables
execute store result score #output.index_format tpa.variables run data get storage tpa:tpa temp.output.slots[4].enabled.tooltip.hoverevent_location_format
data modify storage tpa:tpa temp.output.format_parser set value []
data modify storage tpa:tpa temp.output.format_parser append from storage tpa:tpa temp.output.slots[4].enabled.tooltip.hoverevent_location[0]
data modify storage tpa:tpa temp.output.append_indexes set from storage tpa:tpa temp.output.slots[4]
execute if score #output.index_format tpa.variables matches 0 run function tpa:output/warp/append_indexes
execute if score #output.index_format tpa.variables matches 1 run data modify storage tpa:tpa temp.output.format_parser append from storage tpa:tpa temp.output.slots[4].enabled.tooltip.dimension
data modify storage tpa:tpa temp.output.format_parser append from storage tpa:tpa temp.output.slots[4].enabled.tooltip.hoverevent_location[1]
execute if score #output.index_format tpa.variables matches 0 run data modify storage tpa:tpa temp.output.format_parser append from storage tpa:tpa temp.output.slots[4].enabled.tooltip.dimension
execute if score #output.index_format tpa.variables matches 1 run function tpa:output/warp/append_indexes
data modify storage tpa:tpa temp.output.format_parser append from storage tpa:tpa temp.output.slots[4].enabled.tooltip.hoverevent_location[2]
$tellraw @s[predicate=tpa:output/show_chatbar] ["  ", {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[4].label", color: "$(color_4)", \
    hover_event: {action: "show_text", value: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[4].enabled.tooltip.desc"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[4].enabled.tooltip.space"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[4].enabled.tooltip.brackets[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.format_parser[]", separator: "", color: "$(color_4)"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[4].enabled.tooltip.brackets[1]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[4].disabled.tooltip"}]}}, " ", \
    {text: "", extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[4].enabled.button_tp.brackets[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[4].enabled.button_tp.label"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[4].enabled.button_tp.brackets[1]"}], click_event: {action: "run_command", command: "/trigger tpa.warp set -7"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[4].enabled.button_tp.tooltip"}}}, {text: "", extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[4].disabled.button_tp.brackets[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[4].disabled.button_tp.label"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[4].disabled.button_tp.brackets[1]"}], hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[4].disabled.button_tp.tooltip"}}}, " ", \
    {text: "", extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[4].buttons.setpos.brackets[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[4].buttons.setpos.label"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[4].buttons.setpos.brackets[1]"}], click_event: {action: "run_command", command: "/function tpa:warp/setpos/slot_5"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[4].buttons.setpos.tooltip"}}}, " ", \
    {text: "", extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[4].buttons.setname.brackets[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[4].buttons.setname.label"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[4].buttons.setname.brackets[1]"}], click_event: {action: "run_command", command: "/function tpa:warp/setname/slot_5"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[4].buttons.setname.tooltip"}}}, " ", \
    {text: "", extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[4].buttons.setdesc.brackets[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[4].buttons.setdesc.label"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[4].buttons.setdesc.brackets[1]"}], click_event: {action: "run_command", command: "/function tpa:warp/setdesc/slot_5"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[4].buttons.setdesc.tooltip"}}}, " ", \
    {text: "", extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[4].buttons.rm.brackets[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[4].buttons.rm.label"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[4].buttons.rm.brackets[1]"}], click_event: {action: "run_command", command: "/function tpa:warp/remove/slot_5"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[4].buttons.rm.tooltip"}}}, " ", \
    {text: "", extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[4].enabled.disable.brackets[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[4].enabled.disable.label"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[4].enabled.disable.brackets[1]"}], click_event: {action: "run_command", command: "/function tpa:warp/disable/slot_5"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[4].enabled.disable.tooltip"}}}, {text: "", extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[4].disabled.enable.brackets[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[4].disabled.enable.label"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[4].disabled.enable.brackets[1]"}], click_event: {action: "run_command", command: "/function tpa:warp/enable/slot_5"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[4].disabled.enable.tooltip"}}}, " ", \
    {text: "", extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[4].buttons.moveup.brackets[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[4].buttons.moveup.label"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[4].buttons.moveup.brackets[1]"}], click_event: {action: "run_command", command: "/function tpa:warp/moveup/slot_5"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[4].buttons.moveup.tooltip"}}}, " ", \
    {text: "", extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[4].buttons.movedown.brackets[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[4].buttons.movedown.label"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[4].buttons.movedown.brackets[1]"}], click_event: {action: "run_command", command: "/function tpa:warp/movedown/slot_5"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[4].buttons.movedown.tooltip"}}}, " " \
]
