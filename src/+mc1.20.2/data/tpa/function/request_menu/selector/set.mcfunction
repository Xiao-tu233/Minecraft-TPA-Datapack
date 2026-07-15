# Parent function: tpa:request_menu/open

scoreboard players operation #uid tpa.variables = #request_menu.reqer_uid tpa.variables
function tpa:request_menu/selector/remove
data modify storage tpa:tpa request_menu.menus append from storage tpa:tpa temp.current_request_menu
