# Parent function: tpa:request_menu/handle_value

scoreboard players set #request_menu.page_delta tpa.variables 1
scoreboard players set #request_menu.opened tpa.variables 1
function tpa:request_menu/turn_page
execute if score #request_menu.render tpa.variables matches 1 run function tpa:request_menu/display
