# Parent function: tpa:tpa_menu/book/enabled

execute if data entity @s SelectedItem run function tpa:dialog/menu/book/mainhand_busy
execute unless data entity @s SelectedItem run data modify storage tpa:tpa temp.dialog.actions[-1].tooltip.action set value {type: "minecraft:run_command", command: "/trigger tpa.book"}