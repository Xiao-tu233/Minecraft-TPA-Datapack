# Parent function: tpa:output/home/menu
# @macro: {color_0: str, color_1: str, color_2: str, color_3: str, color_4: str}
scoreboard players reset #output.index_format tpa.variables
execute store result score #output.index_format tpa.variables run data get storage tpa:tpa temp.output.slots[0].tooltip.hoverevent_location_format
data modify storage tpa:tpa temp.output.format_parser set value []
data modify storage tpa:tpa temp.output.format_parser append from storage tpa:tpa temp.output.slots[0].tooltip.hoverevent_location[0]
data modify storage tpa:tpa temp.output.append_indexes set from storage tpa:tpa temp.output.slots[0]
execute if score #output.index_format tpa.variables matches 0 run function tpa:output/home/append_indexes
execute if score #output.index_format tpa.variables matches 1 run data modify storage tpa:tpa temp.output.format_parser append from storage tpa:tpa temp.output.slots[0].tooltip.dimension
data modify storage tpa:tpa temp.output.format_parser append from storage tpa:tpa temp.output.slots[0].tooltip.hoverevent_location[1]
execute if score #output.index_format tpa.variables matches 0 run data modify storage tpa:tpa temp.output.format_parser append from storage tpa:tpa temp.output.slots[0].tooltip.dimension
execute if score #output.index_format tpa.variables matches 1 run function tpa:output/home/append_indexes
data modify storage tpa:tpa temp.output.format_parser append from storage tpa:tpa temp.output.slots[0].tooltip.hoverevent_location[2]
$tellraw @s[predicate=tpa:output/show_chatbar] ["  ", {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[0].label", color: "$(color_0)", \
    hover_event: {action: "show_text", value: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.format_parser", color: "$(color_0)"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[0].tooltip.missing"}]}}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[0].button_tp.space"}, \
    {text: "", extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[0].button_tp.brackets[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[0].button_tp.label", color: "aqua"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[0].button_tp.brackets[1]"}], click_event: {action: "run_command", command: "/trigger tpa.home set -3"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[0].button_tp.tooltip"}}}, " ", \
    {text: "", extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[0].button_set.brackets[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[0].button_set.label", color: "green"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[0].button_set.brackets[1]"}], click_event: {action: "run_command", command: "/trigger tpa.sethome set -3"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[0].button_set.tooltip"}}}, " ", \
    {text: "", extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[0].button_rm.brackets[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[0].button_rm.label", color: "red"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[0].button_rm.brackets[1]"}], click_event: {action: "run_command", command: "/trigger tpa.removehome set -3"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[0].button_rm.tooltip"}}}, " ", \
]
data modify storage tpa:tpa temp.dialog.actions[0].label.text set from storage tpa:tpa temp.output.slots[0].label
data modify storage tpa:tpa temp.dialog.actions[0].label.color set from storage tpa:tpa temp.output.slots[0].color
data modify storage tpa:tpa temp.dialog.actions[0].label.tooltip set value []
data modify storage tpa:tpa temp.dialog.actions[0].label.tooltip append from storage tpa:tpa temp.output.format_parser[]
data modify storage tpa:tpa temp.dialog.actions[0].label.tooltip append from storage tpa:tpa temp.output.slots[0].tooltip.missing

data modify storage tpa:tpa temp.dialog.actions[1].label.text set from storage tpa:tpa temp.output.slots[0].button_tp.label
data modify storage tpa:tpa temp.dialog.actions[1].tooltip set from storage tpa:tpa temp.output.slots[0].button_tp.tooltip
execute unless data storage tpa:tpa temp.output.slots[0].button_tp run data remove storage tpa:tpa temp.dialog.actions[1].action

data modify storage tpa:tpa temp.dialog.actions[2].label.text set from storage tpa:tpa temp.output.slots[0].button_set.label
data modify storage tpa:tpa temp.dialog.actions[2].tooltip set from storage tpa:tpa temp.output.slots[0].button_set.tooltip
execute unless data storage tpa:tpa temp.output.slots[0].button_set run data remove storage tpa:tpa temp.dialog.actions[2].action

data modify storage tpa:tpa temp.dialog.actions[3].label.text set from storage tpa:tpa temp.output.slots[0].button_rm.label
data modify storage tpa:tpa temp.dialog.actions[3].tooltip set from storage tpa:tpa temp.output.slots[0].button_rm.tooltip
execute unless data storage tpa:tpa temp.output.slots[0].button_rm run data remove storage tpa:tpa temp.dialog.actions[3].action

scoreboard players reset #output.index_format tpa.variables
execute store result score #output.index_format tpa.variables run data get storage tpa:tpa temp.output.slots[1].tooltip.hoverevent_location_format
data modify storage tpa:tpa temp.output.format_parser set value []
data modify storage tpa:tpa temp.output.format_parser append from storage tpa:tpa temp.output.slots[1].tooltip.hoverevent_location[0]
data modify storage tpa:tpa temp.output.append_indexes set from storage tpa:tpa temp.output.slots[1]
execute if score #output.index_format tpa.variables matches 0 run function tpa:output/home/append_indexes
execute if score #output.index_format tpa.variables matches 1 run data modify storage tpa:tpa temp.output.format_parser append from storage tpa:tpa temp.output.slots[1].tooltip.dimension
data modify storage tpa:tpa temp.output.format_parser append from storage tpa:tpa temp.output.slots[1].tooltip.hoverevent_location[1]
execute if score #output.index_format tpa.variables matches 0 run data modify storage tpa:tpa temp.output.format_parser append from storage tpa:tpa temp.output.slots[1].tooltip.dimension
execute if score #output.index_format tpa.variables matches 1 run function tpa:output/home/append_indexes
data modify storage tpa:tpa temp.output.format_parser append from storage tpa:tpa temp.output.slots[1].tooltip.hoverevent_location[2]
$tellraw @s[predicate=tpa:output/show_chatbar] ["  ", {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[1].label", color: "$(color_1)", \
    hover_event: {action: "show_text", value: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.format_parser[]", separator: "", color: "$(color_1)"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[1].tooltip.missing"}]}}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[1].button_tp.space"}, \
    {text: "", extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[1].button_tp.brackets[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[1].button_tp.label", color: "aqua"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[1].button_tp.brackets[1]"}], click_event: {action: "run_command", command: "/trigger tpa.home set -4"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[1].button_tp.tooltip"}}}, " ", \
    {text: "", extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[1].button_set.brackets[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[1].button_set.label", color: "green"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[1].button_set.brackets[1]"}], click_event: {action: "run_command", command: "/trigger tpa.sethome set -4"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[1].button_set.tooltip"}}}, " ", \
    {text: "", extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[1].button_rm.brackets[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[1].button_rm.label", color: "red"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[1].button_rm.brackets[1]"}], click_event: {action: "run_command", command: "/trigger tpa.removehome set -4"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[1].button_rm.tooltip"}}}, " ", \
]
data modify storage tpa:tpa temp.dialog.actions[4].label.text set from storage tpa:tpa temp.output.slots[1].label
data modify storage tpa:tpa temp.dialog.actions[4].label.color set from storage tpa:tpa temp.output.slots[1].color
data modify storage tpa:tpa temp.dialog.actions[4].label.tooltip set value []
data modify storage tpa:tpa temp.dialog.actions[4].label.tooltip append from storage tpa:tpa temp.output.format_parser[]
data modify storage tpa:tpa temp.dialog.actions[4].label.tooltip append from storage tpa:tpa temp.output.slots[1].tooltip.missing

data modify storage tpa:tpa temp.dialog.actions[5].label.text set from storage tpa:tpa temp.output.slots[1].button_tp.label
data modify storage tpa:tpa temp.dialog.actions[5].tooltip set from storage tpa:tpa temp.output.slots[1].button_tp.tooltip
execute unless data storage tpa:tpa temp.output.slots[1].button_tp run data remove storage tpa:tpa temp.dialog.actions[5].action

data modify storage tpa:tpa temp.dialog.actions[6].label.text set from storage tpa:tpa temp.output.slots[1].button_set.label
data modify storage tpa:tpa temp.dialog.actions[6].tooltip set from storage tpa:tpa temp.output.slots[1].button_set.tooltip
execute unless data storage tpa:tpa temp.output.slots[1].button_set run data remove storage tpa:tpa temp.dialog.actions[6].action

data modify storage tpa:tpa temp.dialog.actions[7].label.text set from storage tpa:tpa temp.output.slots[1].button_rm.label
data modify storage tpa:tpa temp.dialog.actions[7].tooltip set from storage tpa:tpa temp.output.slots[1].button_rm.tooltip
execute unless data storage tpa:tpa temp.output.slots[1].button_rm run data remove storage tpa:tpa temp.dialog.actions[7].action


scoreboard players reset #output.index_format tpa.variables
execute store result score #output.index_format tpa.variables run data get storage tpa:tpa temp.output.slots[2].tooltip.hoverevent_location_format
data modify storage tpa:tpa temp.output.format_parser set value []
data modify storage tpa:tpa temp.output.format_parser append from storage tpa:tpa temp.output.slots[2].tooltip.hoverevent_location[0]
data modify storage tpa:tpa temp.output.append_indexes set from storage tpa:tpa temp.output.slots[2]
execute if score #output.index_format tpa.variables matches 0 run function tpa:output/home/append_indexes
execute if score #output.index_format tpa.variables matches 1 run data modify storage tpa:tpa temp.output.format_parser append from storage tpa:tpa temp.output.slots[2].tooltip.dimension
data modify storage tpa:tpa temp.output.format_parser append from storage tpa:tpa temp.output.slots[2].tooltip.hoverevent_location[1]
execute if score #output.index_format tpa.variables matches 0 run data modify storage tpa:tpa temp.output.format_parser append from storage tpa:tpa temp.output.slots[2].tooltip.dimension
execute if score #output.index_format tpa.variables matches 1 run function tpa:output/home/append_indexes
data modify storage tpa:tpa temp.output.format_parser append from storage tpa:tpa temp.output.slots[2].tooltip.hoverevent_location[2]
$tellraw @s[predicate=tpa:output/show_chatbar] ["  ", {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[2].label", color: "$(color_2)", \
    hover_event: {action: "show_text", value: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.format_parser[]", separator: "", color: "$(color_2)"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[2].tooltip.missing"}]}}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[2].button_tp.space"}, \
    {text: "", extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[2].button_tp.brackets[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[2].button_tp.label", color: "aqua"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[2].button_tp.brackets[1]"}], click_event: {action: "run_command", command: "/trigger tpa.home set -5"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[2].button_tp.tooltip"}}}, " ", \
    {text: "", extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[2].button_set.brackets[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[2].button_set.label", color: "green"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[2].button_set.brackets[1]"}], click_event: {action: "run_command", command: "/trigger tpa.sethome set -5"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[2].button_set.tooltip"}}}, " ", \
    {text: "", extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[2].button_rm.brackets[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[2].button_rm.label", color: "red"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[2].button_rm.brackets[1]"}], click_event: {action: "run_command", command: "/trigger tpa.removehome set -5"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[2].button_rm.tooltip"}}}, " ", \
]
data modify storage tpa:tpa temp.dialog.actions[8].label.text set from storage tpa:tpa temp.output.slots[2].label
data modify storage tpa:tpa temp.dialog.actions[8].label.color set from storage tpa:tpa temp.output.slots[2].color
data modify storage tpa:tpa temp.dialog.actions[8].label.tooltip set value []
data modify storage tpa:tpa temp.dialog.actions[8].label.tooltip append from storage tpa:tpa temp.output.format_parser[]
data modify storage tpa:tpa temp.dialog.actions[8].label.tooltip append from storage tpa:tpa temp.output.slots[2].tooltip.missing

data modify storage tpa:tpa temp.dialog.actions[9].label.text set from storage tpa:tpa temp.output.slots[2].button_tp.label
data modify storage tpa:tpa temp.dialog.actions[9].tooltip set from storage tpa:tpa temp.output.slots[2].button_tp.tooltip
execute unless data storage tpa:tpa temp.output.slots[2].button_tp run data remove storage tpa:tpa temp.dialog.actions[9].action

data modify storage tpa:tpa temp.dialog.actions[10].label.text set from storage tpa:tpa temp.output.slots[2].button_set.label
data modify storage tpa:tpa temp.dialog.actions[10].tooltip set from storage tpa:tpa temp.output.slots[2].button_set.tooltip
execute unless data storage tpa:tpa temp.output.slots[2].button_set run data remove storage tpa:tpa temp.dialog.actions[10].action

data modify storage tpa:tpa temp.dialog.actions[11].label.text set from storage tpa:tpa temp.output.slots[2].button_rm.label
data modify storage tpa:tpa temp.dialog.actions[11].tooltip set from storage tpa:tpa temp.output.slots[2].button_rm.tooltip
execute unless data storage tpa:tpa temp.output.slots[2].button_rm run data remove storage tpa:tpa temp.dialog.actions[11].action

scoreboard players reset #output.index_format tpa.variables
execute store result score #output.index_format tpa.variables run data get storage tpa:tpa temp.output.slots[3].tooltip.hoverevent_location_format
data modify storage tpa:tpa temp.output.format_parser set value []
data modify storage tpa:tpa temp.output.format_parser append from storage tpa:tpa temp.output.slots[3].tooltip.hoverevent_location[0]
data modify storage tpa:tpa temp.output.append_indexes set from storage tpa:tpa temp.output.slots[3]
execute if score #output.index_format tpa.variables matches 0 run function tpa:output/home/append_indexes
execute if score #output.index_format tpa.variables matches 1 run data modify storage tpa:tpa temp.output.format_parser append from storage tpa:tpa temp.output.slots[3].tooltip.dimension
data modify storage tpa:tpa temp.output.format_parser append from storage tpa:tpa temp.output.slots[3].tooltip.hoverevent_location[1]
execute if score #output.index_format tpa.variables matches 0 run data modify storage tpa:tpa temp.output.format_parser append from storage tpa:tpa temp.output.slots[3].tooltip.dimension
execute if score #output.index_format tpa.variables matches 1 run function tpa:output/home/append_indexes
data modify storage tpa:tpa temp.output.format_parser append from storage tpa:tpa temp.output.slots[3].tooltip.hoverevent_location[2]
$tellraw @s[predicate=tpa:output/show_chatbar] ["  ", {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[3].label", color: "$(color_3)", \
    hover_event: {action: "show_text", value: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.format_parser[]", separator: "", color: "$(color_3)"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[3].tooltip.missing"}]}}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[3].button_tp.space"}, \
    {text: "", extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[3].button_tp.brackets[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[3].button_tp.label", color: "aqua"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[3].button_tp.brackets[1]"}], click_event: {action: "run_command", command: "/trigger tpa.home set -6"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[3].button_tp.tooltip"}}}, " ", \
    {text: "", extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[3].button_set.brackets[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[3].button_set.label", color: "green"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[3].button_set.brackets[1]"}], click_event: {action: "run_command", command: "/trigger tpa.sethome set -6"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[3].button_set.tooltip"}}}, " ", \
    {text: "", extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[3].button_rm.brackets[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[3].button_rm.label", color: "red"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[3].button_rm.brackets[1]"}], click_event: {action: "run_command", command: "/trigger tpa.removehome set -6"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[3].button_rm.tooltip"}}}, " ", \
]
data modify storage tpa:tpa temp.dialog.actions[12].label.text set from storage tpa:tpa temp.output.slots[3].label
data modify storage tpa:tpa temp.dialog.actions[12].label.color set from storage tpa:tpa temp.output.slots[3].color
data modify storage tpa:tpa temp.dialog.actions[12].label.tooltip set value []
data modify storage tpa:tpa temp.dialog.actions[12].label.tooltip append from storage tpa:tpa temp.output.format_parser[]
data modify storage tpa:tpa temp.dialog.actions[12].label.tooltip append from storage tpa:tpa temp.output.slots[3].tooltip.missing

data modify storage tpa:tpa temp.dialog.actions[13].label.text set from storage tpa:tpa temp.output.slots[3].button_tp.label
data modify storage tpa:tpa temp.dialog.actions[13].tooltip set from storage tpa:tpa temp.output.slots[3].button_tp.tooltip
execute unless data storage tpa:tpa temp.output.slots[3].button_tp run data remove storage tpa:tpa temp.dialog.actions[13].action

data modify storage tpa:tpa temp.dialog.actions[14].label.text set from storage tpa:tpa temp.output.slots[3].button_set.label
data modify storage tpa:tpa temp.dialog.actions[14].tooltip set from storage tpa:tpa temp.output.slots[3].button_set.tooltip
execute unless data storage tpa:tpa temp.output.slots[3].button_set run data remove storage tpa:tpa temp.dialog.actions[14].action

data modify storage tpa:tpa temp.dialog.actions[15].label.text set from storage tpa:tpa temp.output.slots[3].button_rm.label
data modify storage tpa:tpa temp.dialog.actions[15].tooltip set from storage tpa:tpa temp.output.slots[3].button_rm.tooltip
execute unless data storage tpa:tpa temp.output.slots[3].button_rm run data remove storage tpa:tpa temp.dialog.actions[15].action

scoreboard players reset #output.index_format tpa.variables
execute store result score #output.index_format tpa.variables run data get storage tpa:tpa temp.output.slots[4].tooltip.hoverevent_location_format
data modify storage tpa:tpa temp.output.format_parser set value []
data modify storage tpa:tpa temp.output.format_parser append from storage tpa:tpa temp.output.slots[4].tooltip.hoverevent_location[0]
data modify storage tpa:tpa temp.output.append_indexes set from storage tpa:tpa temp.output.slots[4]
execute if score #output.index_format tpa.variables matches 0 run function tpa:output/home/append_indexes
execute if score #output.index_format tpa.variables matches 1 run data modify storage tpa:tpa temp.output.format_parser append from storage tpa:tpa temp.output.slots[4].tooltip.dimension
data modify storage tpa:tpa temp.output.format_parser append from storage tpa:tpa temp.output.slots[4].tooltip.hoverevent_location[1]
execute if score #output.index_format tpa.variables matches 0 run data modify storage tpa:tpa temp.output.format_parser append from storage tpa:tpa temp.output.slots[4].tooltip.dimension
execute if score #output.index_format tpa.variables matches 1 run function tpa:output/home/append_indexes
data modify storage tpa:tpa temp.output.format_parser append from storage tpa:tpa temp.output.slots[4].tooltip.hoverevent_location[2]
$tellraw @s[predicate=tpa:output/show_chatbar] ["  ", {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[4].label", color: "$(color_4)", \
    hover_event: {action: "show_text", value: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.format_parser[]", separator: "", color: "$(color_4)"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[4].tooltip.missing"}]}}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[4].button_tp.space"}, \
    {text: "", extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[4].button_tp.brackets[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[4].button_tp.label", color: "aqua"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[4].button_tp.brackets[1]"}], click_event: {action: "run_command", command: "/trigger tpa.home set -7"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[4].button_tp.tooltip"}}}, " ", \
    {text: "", extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[4].button_set.brackets[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[4].button_set.label", color: "green"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[4].button_set.brackets[1]"}], click_event: {action: "run_command", command: "/trigger tpa.sethome set -7"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[4].button_set.tooltip"}}}, " ", \
    {text: "", extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[4].button_rm.brackets[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[4].button_rm.label", color: "red"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[4].button_rm.brackets[1]"}], click_event: {action: "run_command", command: "/trigger tpa.removehome set -7"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.output.slots[4].button_rm.tooltip"}}}, " ", \
]
data modify storage tpa:tpa temp.dialog.actions[16].label.text set from storage tpa:tpa temp.output.slots[4].label
data modify storage tpa:tpa temp.dialog.actions[16].label.color set from storage tpa:tpa temp.output.slots[4].color
data modify storage tpa:tpa temp.dialog.actions[16].label.tooltip set value []
data modify storage tpa:tpa temp.dialog.actions[16].label.tooltip append from storage tpa:tpa temp.output.format_parser[]
data modify storage tpa:tpa temp.dialog.actions[16].label.tooltip append from storage tpa:tpa temp.output.slots[4].tooltip.missing

data modify storage tpa:tpa temp.dialog.actions[17].label.text set from storage tpa:tpa temp.output.slots[4].button_tp.label
data modify storage tpa:tpa temp.dialog.actions[17].tooltip set from storage tpa:tpa temp.output.slots[4].button_tp.tooltip
execute unless data storage tpa:tpa temp.output.slots[4].button_tp run data remove storage tpa:tpa temp.dialog.actions[17].action

data modify storage tpa:tpa temp.dialog.actions[18].label.text set from storage tpa:tpa temp.output.slots[4].button_set.label
data modify storage tpa:tpa temp.dialog.actions[18].tooltip set from storage tpa:tpa temp.output.slots[4].button_set.tooltip
execute unless data storage tpa:tpa temp.output.slots[4].button_set run data remove storage tpa:tpa temp.dialog.actions[18].action

data modify storage tpa:tpa temp.dialog.actions[19].label.text set from storage tpa:tpa temp.output.slots[4].button_rm.label
data modify storage tpa:tpa temp.dialog.actions[19].tooltip set from storage tpa:tpa temp.output.slots[4].button_rm.tooltip
execute unless data storage tpa:tpa temp.output.slots[4].button_rm run data remove storage tpa:tpa temp.dialog.actions[19].action
