# Parent function: tpa:request_menu/build_page

execute if data storage tpa:tpa temp.request_menu.display_list[0] run data modify storage tpa:tpa temp.request_menu.display_list append value " | "
data modify storage tpa:tpa temp.request_menu.display_list append from storage tpa:tpa temp.request_menu.remaining[0].name
data remove storage tpa:tpa temp.request_menu.remaining[0]
