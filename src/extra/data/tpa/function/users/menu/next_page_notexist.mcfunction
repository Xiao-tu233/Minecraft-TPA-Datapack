# Parent function: tpa:users/menu
data remove storage tpa:tpa temp.output.menu.actions[{action:{command:"/function tpa:users/page/next"}}].action
data modify storage tpa:tpa temp.output.menu.actions[{action:{command:"/function tpa:users/page/next"}}].brackets set from storage tpa:tpa temp.output_components.button_brackets.disabled
data modify storage tpa:tpa temp.output.menu.actions[{action:{command:"/function tpa:users/page/next"}}].tooltip set from storage tpa:tpa loaded_lang.users_selector_button_next_page_notexists_hoverevent