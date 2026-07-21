# Parent function: tpa:tpa_menu
execute unless predicate tpa:available run function tpa:menu/warp/unavailable
execute if predicate tpa:available run function tpa:menu/warp/available