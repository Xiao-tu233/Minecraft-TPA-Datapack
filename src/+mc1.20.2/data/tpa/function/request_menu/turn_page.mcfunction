# Parent function: tpa:request_menu/handle_value/previous_page, tpa:request_menu/handle_value/next_page
# Args: #request_menu.direction, #request_menu.page_delta

scoreboard players set #uid tpa.variables -1
execute if score @s tpa.uid = @s tpa.uid run scoreboard players operation #uid tpa.variables = @s tpa.uid
function tpa:request_menu/selector/get
scoreboard players set #request_menu.page tpa.variables 1
execute store result score #request_menu.page tpa.variables if data storage tpa:tpa temp.matched_request_menu.page run data get storage tpa:tpa temp.matched_request_menu.page
scoreboard players set #request_menu.render tpa.variables 0
execute store result score #request_menu.render tpa.variables if data storage tpa:tpa temp.matched_request_menu.render run data get storage tpa:tpa temp.matched_request_menu.render
scoreboard players operation #request_menu.page tpa.variables += #request_menu.page_delta tpa.variables
function tpa:request_menu/prepare
