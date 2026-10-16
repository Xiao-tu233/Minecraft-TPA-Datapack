# Parent function: tpa:request_menu/display/dialog

execute if score #request_menu.total_players tpa.variables matches 1.. run function tpa:request_menu/display/dialog/available_player_exists/tpahere
execute if score #request_menu.total_players tpa.variables matches 0 run function tpa:request_menu/display/dialog/no_available_player

function tpa:request_menu/display/dialog/page_controls
