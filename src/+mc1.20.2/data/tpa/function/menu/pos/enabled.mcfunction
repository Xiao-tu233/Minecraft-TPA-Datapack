# Parent function: tpa:tpa_menu
execute unless predicate tpa:available run function tpa:menu/pos/unavailable
execute if predicate tpa:available run data modify storage tpa:tpa temp.menu.pos.tooltip set from storage tpa:tpa loaded_lang.tpa_menu_pos_button_hoverevent