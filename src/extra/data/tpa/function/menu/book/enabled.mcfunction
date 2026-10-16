# Parent function: tpa:tpa_menu
execute unless predicate tpa:available run function tpa:menu/book/unavailable
execute if predicate tpa:available if data entity @s SelectedItem run function tpa:menu/book/mainhand_busy