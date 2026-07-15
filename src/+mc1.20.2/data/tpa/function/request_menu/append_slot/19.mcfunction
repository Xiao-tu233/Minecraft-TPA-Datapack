# Parent function: tpa:request_menu/append_slot

tag @a remove tpa.request_menu.slot.19
scoreboard players reset #request_menu.current_uid tpa.variables
execute store result score #request_menu.current_uid tpa.variables if data storage tpa:tpa temp.request_menu.remaining[0].uid run data get storage tpa:tpa temp.request_menu.remaining[0].uid
execute as @a if score @s tpa.uid = #request_menu.current_uid tpa.variables run tag @s add tpa.request_menu.slot.19
execute if entity @a[tag=tpa.request_menu.slot.19] if score #request_menu.displayed tpa.variables matches 1.. run data modify storage tpa:tpa temp.request_menu.display append value {text: " | ", color: "dark_gray"}
execute if entity @a[tag=tpa.request_menu.slot.19] if score #request_menu.direction tpa.variables matches 0 run data modify storage tpa:tpa temp.request_menu.display append value {selector: "@a[tag=tpa.request_menu.slot.19]", color: "white", click_event: {action: "run_command", command: "/trigger tpa.tpa set -22"}, hover_event: {action: "show_text", value: [{interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_hoverevent_left_part"}, {selector: "@a[tag=tpa.request_menu.slot.19]"}, {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_hoverevent_right_part"}]}}
execute if entity @a[tag=tpa.request_menu.slot.19] if score #request_menu.direction tpa.variables matches 1 run data modify storage tpa:tpa temp.request_menu.display append value {selector: "@a[tag=tpa.request_menu.slot.19]", color: "white", click_event: {action: "run_command", command: "/trigger tpa.tpahere set -22"}, hover_event: {action: "show_text", value: [{interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_hoverevent_left_part"}, {selector: "@a[tag=tpa.request_menu.slot.19]"}, {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_hoverevent_right_part"}]}}
execute if entity @a[tag=tpa.request_menu.slot.19] run data remove storage tpa:tpa temp.request_menu.remaining[0]
execute if entity @a[tag=tpa.request_menu.slot.19] run scoreboard players add #request_menu.displayed tpa.variables 1
execute if entity @a[tag=tpa.request_menu.slot.19] run scoreboard players set #request_menu.slot_filled tpa.variables 1
