# Parent function: tpa:tpa_menu, tpa:tpahere_menu, tpa:request_menu/turn_page
# Args: #request_menu.direction, #request_menu.page

data modify storage tpa:tpa temp.request_menu.players set value []
scoreboard players set #request_menu.reqer_uid tpa.variables -1
execute if score @s tpa.uid = @s tpa.uid run scoreboard players operation #request_menu.reqer_uid tpa.variables = @s tpa.uid
execute as @a[predicate=tpa:available] if score @s tpa.uid = @s tpa.uid unless score @s tpa.uid = #request_menu.reqer_uid tpa.variables run function tpa:request_menu/append_candidate

execute store result score #request_menu.total_players tpa.variables run data get storage tpa:tpa temp.request_menu.players
scoreboard players set #request_menu.total_pages tpa.variables 1
execute if score #request_menu.total_players tpa.variables matches 1.. run scoreboard players operation #request_menu.total_pages tpa.variables = #request_menu.total_players tpa.variables
execute if score #request_menu.total_players tpa.variables matches 1.. run scoreboard players remove #request_menu.total_pages tpa.variables 1
execute if score #request_menu.total_players tpa.variables matches 1.. run scoreboard players operation #request_menu.total_pages tpa.variables /= #20 tpa.variables
execute if score #request_menu.total_players tpa.variables matches 1.. run scoreboard players add #request_menu.total_pages tpa.variables 1

execute if score #request_menu.page tpa.variables matches ..0 run scoreboard players set #request_menu.page tpa.variables 1
execute if score #request_menu.page tpa.variables > #request_menu.total_pages tpa.variables run scoreboard players operation #request_menu.page tpa.variables = #request_menu.total_pages tpa.variables

data modify storage tpa:tpa temp.current_request_menu set value {uid: 0, direction: 0, page: 1, players: []}
execute store result storage tpa:tpa temp.current_request_menu.uid int 1 run scoreboard players get #request_menu.reqer_uid tpa.variables
execute store result storage tpa:tpa temp.current_request_menu.direction int 1 run scoreboard players get #request_menu.direction tpa.variables
execute store result storage tpa:tpa temp.current_request_menu.page int 1 run scoreboard players get #request_menu.page tpa.variables
data modify storage tpa:tpa temp.current_request_menu.players set from storage tpa:tpa temp.request_menu.players
function tpa:request_menu/selector/set

data modify storage tpa:tpa temp.request_menu.remaining set from storage tpa:tpa temp.request_menu.players
scoreboard players operation #request_menu.offset tpa.variables = #request_menu.page tpa.variables
scoreboard players remove #request_menu.offset tpa.variables 1
scoreboard players operation #request_menu.offset tpa.variables *= #20 tpa.variables
function tpa:request_menu/drop_offset

scoreboard players set #request_menu.displayed tpa.variables 0
scoreboard players set #request_menu.slot tpa.variables -3
scoreboard players set #request_menu.slots_left tpa.variables 20
function tpa:request_menu/build_page
function tpa:request_menu/display
