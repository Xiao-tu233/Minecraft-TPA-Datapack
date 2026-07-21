# Parent function: tpa:tpa_menu/book/enabled

execute if data entity @s SelectedItem run function tpa:menu/book/mainhand_busy
execute unless data entity @s SelectedItem run function tpa:menu/book/mainhand_avail