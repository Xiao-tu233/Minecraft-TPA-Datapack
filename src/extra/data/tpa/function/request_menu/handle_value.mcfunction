# Parent function: tpa:request_menu/tpa, tpa:request_menu/tpahere
# Args: #request_menu.value, #request_menu.direction

execute if score #request_menu.value tpa.variables matches -22..-3 run function tpa:request_menu/handle_value/slot
execute if score #request_menu.value tpa.variables matches -2 run function tpa:request_menu/handle_value/previous_page
execute if score #request_menu.value tpa.variables matches -23 run function tpa:request_menu/handle_value/next_page
