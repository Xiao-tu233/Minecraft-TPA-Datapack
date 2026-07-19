# Parent function: tpa:request_menu/display/page_controls

execute unless score #request_menu.page tpa.variables = #request_menu.total_pages tpa.variables run function tpa:request_menu/display/page_controls/both
execute if score #request_menu.page tpa.variables = #request_menu.total_pages tpa.variables run function tpa:request_menu/display/page_controls/previous
