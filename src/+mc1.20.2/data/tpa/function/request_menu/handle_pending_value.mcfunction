# Parent function: tpa:request_menu/tpa, tpa:request_menu/tpahere

execute if score #request_menu.value tpa.variables matches -23..-2 run function tpa:request_menu/handle_value
