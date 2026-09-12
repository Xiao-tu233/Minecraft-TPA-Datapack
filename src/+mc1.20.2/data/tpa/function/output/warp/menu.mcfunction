# Parent function: tpa:warp/menu
# Input: str temp.output.title, int temp.output.current_page, int temp.output.total_pages, str temp.output.start_index, str temp.output.end_index, str temp.output.total_slots, \
         int temp.output.index_format, List[3] temp.output.index, \
         byte(boolean) temp.output.editting, \
         str temp.output.button_previous_page, str temp.output.button_next_page, str temp.output.button_previous_page_hover, str temp.output.button_next_page_hover, \
         List[5] temp.output.slots: \
            str|int temp.output.slots[].color, str temp.output.slots[].label, str temp.output.slots[].disabled.tooltip, \
            str temp.output.slots[].enabled.tooltip.x, str temp.output.slots[].enabled.tooltip.y, str temp.output.slots[].enabled.tooltip.z, \
            List[2] temp.output.slots[].enabled.tooltip.brackets, str temp.output.slots[].enabled.tooltip.space, \
            str temp.output.slots[].enabled.tooltip.dimension, str temp.output.slots[].enabled.tooltip.hoverevent_location, str temp.output.slots[].enabled.tooltip.desc, \
            int temp.output.slots[].enabled.tooltip.hoverevent_location_format \
            Button temp.output.slots[].enabled.button_tp, Button temp.output.slots[].disabled.button_tp, Button temp.output.slots[].buttons.setpos, Button temp.output.slots[].buttons.setname, Button temp.output.slots[].buttons.setdesc, \
            Button temp.output.slots[].buttons.rm, Button temp.output.slots[].enabled.disable, Button temp.output.slots[].disabled.enable, \
            Button temp.output.slots[].buttons.moveup, Button temp.output.slots[].buttons.movedown, \
            Button temp.output.button_add \            
#! For legacy version below 1.20.2, input temp.output.slots[].color is an integer and follows this mapping: {-2: "gray", -1: "red", 0: "green", 1: "light_purple"}

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

data modify storage tpa:tpa temp.output.selector_index set value []
data modify storage tpa:tpa temp.output.selector_index append from storage tpa:tpa temp.output.index[0]
execute if score #output.index_format tpa.variables matches 0 run function tpa:output/selector/append_indexes
execute if score #output.index_format tpa.variables matches 1 run data modify storage tpa:tpa temp.output.selector_index append from storage tpa:tpa temp.output.total_slots
data modify storage tpa:tpa temp.output.selector_index append from storage tpa:tpa temp.output.index[1]
execute if score #output.index_format tpa.variables matches 0 run data modify storage tpa:tpa temp.output.selector_index append from storage tpa:tpa temp.output.total_slots
execute if score #output.index_format tpa.variables matches 1 run function tpa:output/selector/append_indexes
data modify storage tpa:tpa temp.output.selector_index append from storage tpa:tpa temp.output.index[2]

tellraw @s[predicate=tpa:output/show_chatbar] [{interpret: true, color: "gray", storage: "tpa:tpa", nbt: "temp.output.selector_index[]", separator: ""}]
tellraw @s[predicate=tpa:output/show_chatbar] ""

data remove storage tpa:tpa temp.args
data modify storage tpa:tpa temp.args set value {color_0: "white", color_1: "white", color_2: "white", color_3: "white", color_4: "white"}
data modify storage tpa:tpa temp.args.color_0 set from storage tpa:tpa temp.output.slots[0].color
data modify storage tpa:tpa temp.args.color_1 set from storage tpa:tpa temp.output.slots[1].color
data modify storage tpa:tpa temp.args.color_2 set from storage tpa:tpa temp.output.slots[2].color
data modify storage tpa:tpa temp.args.color_3 set from storage tpa:tpa temp.output.slots[3].color
data modify storage tpa:tpa temp.args.color_4 set from storage tpa:tpa temp.output.slots[4].color
function tpa:output/warp/menu_macro with storage tpa:tpa temp.args

tellraw @s {text: "  ", extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.button_add.brackets[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.button_add.label"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.button_add.brackets[1]"}], hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.output.button_add.tooltip"}}, click_event: {action: "run_command", command: "/function tpa:warp/add"}}

execute store result score #output.editting tpa.variables run data get storage tpa:tpa temp.output.editting
execute if score #output.current_page tpa.variables matches ..1 run function tpa:output/selector/disabled/previous_page
execute if score #output.current_page tpa.variables matches 2.. run function tpa:output/selector/enabled/previous_page
execute if score #output.current_page tpa.variables >= #output.total_pages tpa.variables run function tpa:output/selector/disabled/next_page
execute if score #output.current_page tpa.variables < #output.total_pages tpa.variables run function tpa:output/selector/enabled/next_page

tellraw @s[predicate=tpa:output/show_chatbar] ["", \
    {interpret: true, storage: "tpa:tpa", nbt: "temp.output.buttons.disabled.previous_page.brackets[0]", color: "gray", extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.buttons.disabled.previous_page.label"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.buttons.disabled.previous_page.brackets[1]", color: "gray"}]}, \
    {interpret: true, storage: "tpa:tpa", nbt: "temp.output.buttons.enabled.previous_page.brackets[0]", click_event: {action: "run_command", command: "/trigger tpa.warp set -2"}, hover_event: {action: "show_text", value: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.button_previous_page_hover", color: "aqua"}, "(", {interpret: true, storage: "tpa:tpa", nbt: "temp.output.previous_page", color: "green"}, {text: "/", color: "gray"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.total_pages", color: "white"}, ")"]}, color: "white", extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.buttons.enabled.previous_page.label", color: "green"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.buttons.enabled.previous_page.brackets[1]"}]}, \
    {interpret: true, storage: "tpa:tpa", nbt: "temp.output.buttons.editting.previous_page.brackets[0]", click_event: {action: "run_command", command: "/function tpa:warp/option/previous_page"}, hover_event: {action: "show_text", value: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.button_previous_page_hover", color: "aqua"}, "(", {interpret: true, storage: "tpa:tpa", nbt: "temp.output.previous_page", color: "green"}, {text: "/", color: "gray"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.total_pages", color: "white"}, ")"]}, color: "white", extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.buttons.editting.previous_page.label", color: "green"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.buttons.editting.previous_page.brackets[1]"}]}, \
    "                ", \
    {interpret: true, storage: "tpa:tpa", nbt: "temp.output.buttons.disabled.next_page.brackets[0]", color: "gray", extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.buttons.disabled.next_page.label"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.buttons.disabled.next_page.brackets[1]", color: "gray"}]}, \
    {interpret: true, storage: "tpa:tpa", nbt: "temp.output.buttons.enabled.next_page.brackets[0]", click_event: {action: "run_command", command: "/trigger tpa.warp set -8"}, hover_event: {action: "show_text", value: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.button_next_page_hover", color: "aqua"}, "(", {interpret: true, storage: "tpa:tpa", nbt: "temp.output.next_page", color: "green"}, {text: "/", color: "gray"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.total_pages", color: "white"}, ")"]}, color: "white", extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.buttons.enabled.next_page.label", color: "green"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.buttons.enabled.next_page.brackets[1]"}]}, \
    {interpret: true, storage: "tpa:tpa", nbt: "temp.output.buttons.editting.next_page.brackets[0]", click_event: {action: "run_command", command: "/function tpa:warp/option/next_page"}, hover_event: {action: "show_text", value: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.button_next_page_hover", color: "aqua"}, "(", {interpret: true, storage: "tpa:tpa", nbt: "temp.output.next_page", color: "green"}, {text: "/", color: "gray"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.total_pages", color: "white"}, ")"]}, color: "white", extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.buttons.editting.next_page.label", color: "green"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.output.buttons.editting.next_page.brackets[1]"}]} \
]
