# Parent function: tpa:request_menu/display/dialog

# Title
data modify storage tpa:tpa temp.dialog.title set from storage tpa:tpa loaded_lang.tpa_menu_dialog_title
execute if score #request_menu.total_players tpa.variables matches 1.. run function tpa:request_menu/display/dialog/available_player_exists/tpa
execute if score #request_menu.total_players tpa.variables matches 0 run function tpa:request_menu/display/dialog/no_available_player

function tpa:request_menu/display/dialog/page_controls
