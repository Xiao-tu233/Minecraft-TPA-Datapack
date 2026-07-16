# Parent function: tpa:request_menu/append_slot

tag @a remove tpa.request_menu.slot.11
scoreboard players reset #request_menu.current_uid tpa.variables
execute store result score #request_menu.current_uid tpa.variables if data storage tpa:tpa temp.request_menu.remaining[0].uid run data get storage tpa:tpa temp.request_menu.remaining[0].uid
execute as @a if score @s tpa.uid = #request_menu.current_uid tpa.variables run tag @s add tpa.request_menu.slot.11
execute if entity @a[tag=tpa.request_menu.slot.11] run data remove storage tpa:tpa temp.request_menu.remaining[0]
execute if entity @a[tag=tpa.request_menu.slot.11] run scoreboard players add #request_menu.displayed tpa.variables 1
execute if entity @a[tag=tpa.request_menu.slot.11] run scoreboard players set #request_menu.slot_filled tpa.variables 1
