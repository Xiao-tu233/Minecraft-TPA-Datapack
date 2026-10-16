# Parent function: tpa:dialog
execute unless predicate tpa:available run function tpa:dialog/menu/home/unavailable
execute if predicate tpa:available run data modify storage tpa:tpa temp.dialog.actions[-1].action set value {type: "minecraft:run_command", command: "/trigger tpa.home set -1"}