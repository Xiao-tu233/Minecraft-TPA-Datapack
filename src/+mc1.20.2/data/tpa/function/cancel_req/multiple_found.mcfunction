# Parent function: tpa:cancel_req
execute if score #cancel_index tpa.variables matches 1 run function tpa:cancel_req/show_menu
execute if score #cancel_index tpa.variables matches 2 run function tpa:cancel_req/previous_page
execute if score #cancel_index tpa.variables matches 3..7 run function tpa:cancel_req/cancel_specific
execute if score #cancel_index tpa.variables matches 8 run function tpa:cancel_req/next_page