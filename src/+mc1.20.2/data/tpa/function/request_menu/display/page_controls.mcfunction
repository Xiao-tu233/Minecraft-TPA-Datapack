# Parent function: tpa:request_menu/display/tpa, tpa:request_menu/display/tpahere

execute if score #request_menu.page tpa.variables matches 2.. unless score #request_menu.page tpa.variables = #request_menu.total_pages tpa.variables run function tpa:request_menu/display/page_controls/both
execute if score #request_menu.page tpa.variables matches ..1 unless score #request_menu.page tpa.variables = #request_menu.total_pages tpa.variables run function tpa:request_menu/display/page_controls/next
execute if score #request_menu.page tpa.variables matches 2.. if score #request_menu.page tpa.variables = #request_menu.total_pages tpa.variables run function tpa:request_menu/display/page_controls/previous
execute if score #request_menu.page tpa.variables matches ..1 if score #request_menu.page tpa.variables = #request_menu.total_pages tpa.variables run function tpa:request_menu/display/page_controls/none
