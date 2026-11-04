# Parent function: tpa:home/menu
# Input: str temp.output.title, int temp.output.current_page, int temp.output.total_pages, str temp.output.start_index, str temp.output.end_index, str temp.output.total_slots, \
         int temp.output.index_format, List[3] temp.output.index, \
         str temp.output.button_previous_page, str temp.output.button_next_page, str temp.output.button_previous_page_hover, str temp.output.button_next_page_hover, \
         List[5] temp.output.slots: \
            str|int temp.output.slots[].color, Text temp.output.slots[].label, \
            str temp.output.slots[].tooltip.x, str temp.output.slots[].tooltip.y, str temp.output.slots[].tooltip.z, \
            str temp.output.slots[].tooltip.dimension, str temp.output.slots[].tooltip.hoverevent_location, str temp.output.slots[].tooltip.missing, \
            Button temp.output.slots[].button_tp, Button temp.output.slots[].button_set, Button temp.output.slots[].button_rm, \
            Button temp.output.button_add
#! For legacy version below 1.20.2, input temp.output.slots[].color is an integer and follows this mapping: {-1: "red", 0: "green", 1: "light_purple"}

execute store result score #output.index_format tpa.variables run data get storage tpa:tpa temp.output.index_format
execute store result score #output.current_page tpa.variables run data get storage tpa:tpa temp.output.current_page
execute store result score #output.total_pages tpa.variables run data get storage tpa:tpa temp.output.total_pages
data modify storage tpa:tpa temp.output.current_page set string storage tpa:tpa temp.output.current_page
data modify storage tpa:tpa temp.output.total_pages set string storage tpa:tpa temp.output.total_pages

scoreboard players operation #output.previous_page tpa.variables = #output.current_page tpa.variables
scoreboard players remove #output.previous_page tpa.variables 1
execute store result storage tpa:tpa temp.output.previous_page int 1 run scoreboard players get #output.previous_page tpa.variables
data modify storage tpa:tpa temp.output.previous_page set string storage tpa:tpa temp.output.previous_page

scoreboard players operation #output.next_page tpa.variables = #output.current_page tpa.variables
scoreboard players add #output.next_page tpa.variables 1
execute store result storage tpa:tpa temp.output.next_page int 1 run scoreboard players get #output.next_page tpa.variables
data modify storage tpa:tpa temp.output.next_page set string storage tpa:tpa temp.output.next_page

tellraw @s[predicate=tpa:output/show_chatbar] [{text: "------------ ", color: "white"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.title", color: "aqua"}, {text: " (", color: "white"}, {interpret: true, color: "white", storage: "tpa:tpa", nbt: "temp.output.current_page"}, {text: "/", color: "gray"}, {interpret: true, color: "white", storage: "tpa:tpa", nbt: "temp.output.total_pages"}, {text: ") ------------", color: "white"}]
data modify storage tpa:tpa temp.dialog.title[0].text set from storage tpa:tpa temp.output.title
data modify storage tpa:tpa temp.dialog.title[2].text set from storage tpa:tpa temp.output.current_page
data modify storage tpa:tpa temp.dialog.title[4].text set from storage tpa:tpa temp.output.total_pages


data modify storage tpa:tpa temp.output.selector_index set value []
data modify storage tpa:tpa temp.output.selector_index append from storage tpa:tpa temp.output.index[0]
execute if score #output.index_format tpa.variables matches 0 run function tpa:output/selector/append_indexes
execute if score #output.index_format tpa.variables matches 1..2 run data modify storage tpa:tpa temp.output.selector_index append from storage tpa:tpa temp.output.total_slots
data modify storage tpa:tpa temp.output.selector_index append from storage tpa:tpa temp.output.index[1]
execute if score #output.index_format tpa.variables matches 0 run data modify storage tpa:tpa temp.output.selector_index append from storage tpa:tpa temp.output.total_slots
execute if score #output.index_format tpa.variables matches 1 run function tpa:output/selector/append_indexes
data modify storage tpa:tpa temp.output.selector_index append from storage tpa:tpa temp.output.index[2]

data modify storage tpa:tpa temp.dialog.body.contents set from storage tpa:tpa temp.output.selector_index
tellraw @s[predicate=tpa:output/show_chatbar] [{interpret: true, color: "gray", storage: "tpa:tpa", nbt: "temp.output.selector_index"}]
tellraw @s[predicate=tpa:output/show_chatbar] ""

data modify storage tpa:tpa temp.dialog.actions set value [\
    {width: 150}, {width: 150, action: {type: "run_command", command: "/trigger tpa.home set -3"}, label: {color: "aqua"}}, {width: 150, action: {type: "run_command", command: "/trigger tpa.sethome set -3"}, label: {color: "green"}}, {width: 150, action: {type: "run_command", command: "/trigger tpa.removehome set -3"}, label: {color: "red"}}, \
    {width: 150}, {width: 150, action: {type: "run_command", command: "/trigger tpa.home set -4"}, label: {color: "aqua"}}, {width: 150, action: {type: "run_command", command: "/trigger tpa.sethome set -4"}, label: {color: "green"}}, {width: 150, action: {type: "run_command", command: "/trigger tpa.removehome set -4"}, label: {color: "red"}}, \
    {width: 150}, {width: 150, action: {type: "run_command", command: "/trigger tpa.home set -5"}, label: {color: "aqua"}}, {width: 150, action: {type: "run_command", command: "/trigger tpa.sethome set -5"}, label: {color: "green"}}, {width: 150, action: {type: "run_command", command: "/trigger tpa.removehome set -5"}, label: {color: "red"}}, \
    {width: 150}, {width: 150, action: {type: "run_command", command: "/trigger tpa.home set -6"}, label: {color: "aqua"}}, {width: 150, action: {type: "run_command", command: "/trigger tpa.sethome set -6"}, label: {color: "green"}}, {width: 150, action: {type: "run_command", command: "/trigger tpa.removehome set -6"}, label: {color: "red"}}, \
    {width: 150}, {width: 150, action: {type: "run_command", command: "/trigger tpa.home set -7"}, label: {color: "aqua"}}, {width: 150, action: {type: "run_command", command: "/trigger tpa.sethome set -7"}, label: {color: "green"}}, {width: 150, action: {type: "run_command", command: "/trigger tpa.removehome set -7"}, label: {color: "red"}}, \
    {width: 150, label: [""], action: {type: "run_command", command: "/trigger tpa.home set -9"}}, {width: 150, label: ""}, {width: 150, label: ""}, {width: 150, label: ""}, \
    {width: 150, label: {text: ""}, action: {type: "run_command", command: "/trigger tpa.home set -2"}}, {width: 150, label: ""}, {width: 150, label: ""}, {width: 150, label: {text: ""}, action: {type: "run_command", command: "/trigger tpa.home set -8"}}\
]

data remove storage tpa:tpa temp.args
data modify storage tpa:tpa temp.args set value {color_0: "white", color_1: "white", color_2: "white", color_3: "white", color_4: "white"}
data modify storage tpa:tpa temp.args.color_0 set from storage tpa:tpa temp.output.slots[0].color
data modify storage tpa:tpa temp.args.color_1 set from storage tpa:tpa temp.output.slots[1].color
data modify storage tpa:tpa temp.args.color_2 set from storage tpa:tpa temp.output.slots[2].color
data modify storage tpa:tpa temp.args.color_3 set from storage tpa:tpa temp.output.slots[3].color
data modify storage tpa:tpa temp.args.color_4 set from storage tpa:tpa temp.output.slots[4].color
function tpa:output/home/menu_macro with storage tpa:tpa temp.args

tellraw @s[predicate=tpa:output/show_chatbar] ["  ", {text: "", extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.button_add.brackets[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.button_add.label"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.button_add.brackets[1]"}], hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.output.button_add.tooltip"}}, click_event: {action: "run_command", command: "/trigger tpa.home set -9"}}]
data modify storage tpa:tpa temp.dialog.actions[20].label set from storage tpa:tpa temp.output.button_add.label
data modify storage tpa:tpa temp.dialog.actions[20].tooltip set from storage tpa:tpa temp.output.button_add.tooltip
execute unless data storage tpa:tpa temp.output.button_add run data remove storage tpa:tpa temp.dialog.actions[20].action

scoreboard players set #output.editting tpa.variables 0
execute if score #output.current_page tpa.variables matches ..1 run function tpa:output/selector/disabled/previous_page
execute if score #output.current_page tpa.variables matches 2.. run function tpa:output/selector/enabled/previous_page
execute if score #output.current_page tpa.variables >= #output.total_pages tpa.variables run function tpa:output/selector/disabled/next_page
execute if score #output.current_page tpa.variables < #output.total_pages tpa.variables run function tpa:output/selector/enabled/next_page

data modify storage tpa:tpa temp.dialog.actions[-3].label set from storage tpa:tpa temp.output.button_previous_page
data modify storage tpa:tpa temp.dialog.actions[-1].label set from storage tpa:tpa temp.output.button_next_page

tellraw @s[predicate=tpa:output/show_chatbar] ["", \
    {interpret: true, storage: "tpa:tpa", nbt: "temp.output.buttons.disabled.previous_page.brackets[0]", color: "gray", extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.buttons.disabled.previous_page.label"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.buttons.disabled.previous_page.brackets[1]", color: "gray"}]}, \
    {interpret: true, storage: "tpa:tpa", nbt: "temp.output.buttons.enabled.previous_page.brackets[0]", click_event: {action: "run_command", command: "/trigger tpa.home set -2"}, hover_event: {action: "show_text", value: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.button_previous_page_hover", color: "aqua"}, "(", {interpret: true, storage: "tpa:tpa", nbt: "temp.output.previous_page", color: "green"}, {text: "/", color: "gray"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.total_pages", color: "white"}, ")"]}, color: "white", extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.buttons.enabled.previous_page.label", color: "green"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.buttons.enabled.previous_page.brackets[1]"}]}, \
    "                ", \
    {interpret: true, storage: "tpa:tpa", nbt: "temp.output.buttons.disabled.next_page.brackets[0]", color: "gray", extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.buttons.disabled.next_page.label"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.buttons.disabled.next_page.brackets[1]", color: "gray"}]}, \
    {interpret: true, storage: "tpa:tpa", nbt: "temp.output.buttons.enabled.next_page.brackets[0]", click_event: {action: "run_command", command: "/trigger tpa.home set -8"}, hover_event: {action: "show_text", value: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.button_next_page_hover", color: "aqua"}, "(", {interpret: true, storage: "tpa:tpa", nbt: "temp.output.next_page", color: "green"}, {text: "/", color: "gray"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.total_pages", color: "white"}, ")"]}, color: "white", extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.buttons.enabled.next_page.label", color: "green"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.buttons.enabled.next_page.brackets[1]"}]}, \
]
