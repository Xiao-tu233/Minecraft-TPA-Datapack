# Parent function: tpa:tpa_menu

execute unless predicate tpa:available run function tpa:menu/book/unavailable
execute if predicate tpa:available run function tpa:menu/book/available