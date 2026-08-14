# Parent function: tpa:request_menu/display/chatbar/build_page

execute if data storage tpa:tpa temp.request_menu.chatbar_remaining[0].name run data modify storage tpa:tpa temp.request_menu.display_list append from storage tpa:tpa temp.request_menu.chatbar_remaining[0].name
execute unless data storage tpa:tpa temp.request_menu.chatbar_remaining[0].name run data modify storage tpa:tpa temp.request_menu.display_list append value ""
data remove storage tpa:tpa temp.request_menu.chatbar_remaining[0]
execute if data storage tpa:tpa temp.request_menu.chatbar_remaining[0].name run data modify storage tpa:tpa temp.request_menu.display_list append value " | "
execute unless data storage tpa:tpa temp.request_menu.chatbar_remaining[0].name run data modify storage tpa:tpa temp.request_menu.display_list append value ""
