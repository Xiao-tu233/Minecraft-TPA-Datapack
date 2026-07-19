# Parent function: tpa:request_menu/open

execute if score #request_menu.direction tpa.variables matches 0 run function tpa:request_menu/display/tpa
execute if score #request_menu.direction tpa.variables matches 1 run function tpa:request_menu/display/tpahere
