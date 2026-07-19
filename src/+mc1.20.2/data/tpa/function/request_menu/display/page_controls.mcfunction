# Parent function: tpa:request_menu/display/tpa, tpa:request_menu/display/tpahere

execute if score #request_menu.page tpa.variables matches 2.. run function tpa:request_menu/display/page_controls/has_previous
execute if score #request_menu.page tpa.variables matches ..1 run function tpa:request_menu/display/page_controls/no_previous