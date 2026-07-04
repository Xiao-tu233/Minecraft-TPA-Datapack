# Parent function: tpa:cancel_req/show_selector

tellraw @s[predicate=tpa:output/show_chatbar] [{interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.reqer_cancel_multiple_sent"}]
title @s[predicate=tpa:output/show_actionbar] actionbar [{interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.reqer_cancel_multiple_sent"}]

tellraw @s[predicate=tpa:output/show_chatbar] ["──────────── ", {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.reqer_cancel_selector_title"}, " (", {color: "white", storage: "tpa:tpa", nbt: "temp.output.current_page"}, "/", {color: "white", storage: "tpa:tpa", nbt: "temp.output.total_pages"}, ") ────────────"]

execute store result score #selector.index_format tpa.variables run data get storage tpa:tpa loaded_lang.reqer_cancel_selector_index_format

data modify storage tpa:tpa temp.output.selector_index set value []
data modify storage tpa:tpa temp.output.selector_index append from storage tpa:tpa reqer_cancel_selector_index[0]
execute if score #selector.index_format tpa.variables matches 0 run function tpa:output/selector/append_indexes
execute if score #selector.index_format tpa.variables matches 1 run data modify storage tpa:tpa temp.output.selector_index append from storage tpa:tpa temp.output.total_requests
data modify storage tpa:tpa temp.output.selector_index append from storage tpa:tpa reqer_cancel_selector_index[1]
data modify storage tpa:tpa temp.output.selector_index append from storage tpa:tpa reqer_cancel_selector_index[2]
execute if score #selector.index_format tpa.variables matches 0 run data modify storage tpa:tpa temp.output.selector_index append from storage tpa:tpa temp.output.total_requests
execute if score #selector.index_format tpa.variables matches 1 run function tpa:output/selector/append_indexes
tellraw @s[predicate=tpa:output/show_chatbar] [{color: "white", storage: "tpa:tpa", nbt: "temp.output.selector_index[]"}]
tellraw @s[predicate=tpa:output/show_chatbar] ""
tellraw @s[predicate=tpa:output/show_chatbar] [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.teleporters[0]"}, " ▶ ", {interpret: true, storage: "tpa:tpa", nbt: "temp.output.destinations[0]"}, {color: "white", text: "         "}, {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.reqer_req_button_cancel", click_event: {action: "run_command", command: "/trigger tpa.cancel_req set 3"}, hover_event: {action: "show_text", value: [{interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.reqer_req_button_cancel_hoverevent"}]}}]
tellraw @s[predicate=tpa:output/show_chatbar] [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.teleporters[1]"}, " ▶ ", {interpret: true, storage: "tpa:tpa", nbt: "temp.output.destinations[1]"}, {color: "white", text: "         "}, {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.reqer_req_button_cancel", click_event: {action: "run_command", command: "/trigger tpa.cancel_req set 4"}, hover_event: {action: "show_text", value: [{interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.reqer_req_button_cancel_hoverevent"}]}}]
tellraw @s[predicate=tpa:output/show_chatbar] [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.teleporters[2]"}, " ▶ ", {interpret: true, storage: "tpa:tpa", nbt: "temp.output.destinations[2]"}, {color: "white", text: "         "}, {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.reqer_req_button_cancel", click_event: {action: "run_command", command: "/trigger tpa.cancel_req set 5"}, hover_event: {action: "show_text", value: [{interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.reqer_req_button_cancel_hoverevent"}]}}]
tellraw @s[predicate=tpa:output/show_chatbar] [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.teleporters[3]"}, " ▶ ", {interpret: true, storage: "tpa:tpa", nbt: "temp.output.destinations[3]"}, {color: "white", text: "         "}, {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.reqer_req_button_cancel", click_event: {action: "run_command", command: "/trigger tpa.cancel_req set 6"}, hover_event: {action: "show_text", value: [{interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.reqer_req_button_cancel_hoverevent"}]}}]
tellraw @s[predicate=tpa:output/show_chatbar] [{interpret: true, storage: "tpa:tpa", nbt: "temp.output.teleporters[4]"}, " ▶ ", {interpret: true, storage: "tpa:tpa", nbt: "temp.output.destinations[4]"}, {color: "white", text: "         "}, {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.reqer_req_button_cancel", click_event: {action: "run_command", command: "/trigger tpa.cancel_req set 7"}, hover_event: {action: "show_text", value: [{interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.reqer_req_button_cancel_hoverevent"}]}}]
tellraw @s[predicate=tpa:output/show_chatbar] [{text: "[", extra: [{interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.reqer_cancel_selector_button_previous_page"}, "]"], click_event: {action: "run_command", command: "/trigger tpa.cancel_req set 2"}, hover_event: {action: "show_text", value: [{interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.reqer_cancel_selector_button_previous_page_hoverevent"}, " (", {color: "white", storage: "tpa:tpa", nbt: "temp.output.previous_page"}, "/", {color: "white", storage: "tpa:tpa", nbt: "temp.output.total_pages"},")"]}}, {color: "white", text: "                "}, {text: "[", extra: [{interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.reqer_cancel_selector_button_next_page"}, "]"], click_event: {action: "run_command", command: "/trigger tpa.cancel_req set 8"}, hover_event: {action: "show_text", value: [{interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.reqer_cancel_selector_button_next_page_hoverevent"}, " (", {color: "white", storage: "tpa:tpa", nbt: "temp.output.next_page"}, "/", {color: "white", storage: "tpa:tpa", nbt: "temp.output.total_pages"},")"]}}]
# 你目前有多个传送请求 请选择你想要取消的请求:
# ──────────── Requests (2/4) ────────────
# Showing 6–10 of 17 requests

#  Alice   ▶ You         [Cancel]
#  You     ▶ Bob         [Cancel]
#  Charlie ▶ You         [Cancel]
#  You     ▶ David       [Cancel]
#  Eve     ▶ You         [Cancel]

# [◀ Previous]                [Next ▶]