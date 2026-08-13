# Parent function: tpa:tpa_menu, tpa:tpahere_menu, tpa:request_menu/handle_value/previous_page, tpa:request_menu/handle_value/next_page

execute if score #request_menu.render tpa.variables matches 1 run function tpa:request_menu/display/chatbar
execute if score #request_menu.render tpa.variables matches 2 run function tpa:request_menu/display/dialog
execute if score #request_menu.render tpa.variables matches 3 run function tpa:request_menu/display/actionbar