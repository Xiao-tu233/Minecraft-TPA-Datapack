# Parent function: tpa:tpa_menu
execute unless predicate tpa:available run function tpa:menu/home/unavailable
execute if predicate tpa:available run function tpa:menu/home/available