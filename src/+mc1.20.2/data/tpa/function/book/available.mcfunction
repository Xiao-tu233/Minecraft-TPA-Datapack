# Parent function: tpa:book/enabled

execute if data entity @s SelectedItem run function tpa:book/mainhand_busy
execute unless data entity @s SelectedItem run function tpa:book/mainhand_avail
