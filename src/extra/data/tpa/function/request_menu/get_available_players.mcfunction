# Parent function: tpa:request_menu/prepare, tpa:book/mainhand_avail

data modify storage tpa:tpa temp.request_menu.players set value []
scoreboard players set #request_menu.reqer_uid tpa.variables -1
execute if score @s tpa.uid = @s tpa.uid run scoreboard players operation #request_menu.reqer_uid tpa.variables = @s tpa.uid
execute as @a[predicate=tpa:available] if score @s tpa.uid = @s tpa.uid unless score @s tpa.uid = #request_menu.reqer_uid tpa.variables run function tpa:request_menu/get_available_players/append_candidate