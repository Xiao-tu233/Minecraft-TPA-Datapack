# Parent function: tpa:language_menu_loop
# @macro: {id: int}

data modify storage tpa:tpa temp.args.dialog.actions append value {width: 300, action: {type: "minecraft:run_command", command: ""}}

data modify entity @n[type=text_display, tag=tpa.text_display] text set from storage tpa:tpa loaded_language[0].name_display
data modify storage tpa:tpa temp.args.dialog.actions[-1].label set from entity @n[type=text_display, tag=tpa.text_display] text

data modify entity @n[type=text_display, tag=tpa.text_display] text set from storage tpa:tpa loaded_language[0].name
data modify storage tpa:tpa temp.args.dialog.actions[-1].tooltip set from entity @n[type=text_display, tag=tpa.text_display] text

$execute unless score #is_server_selecting tpa.variables matches 1 run data modify storage tpa:tpa temp.args.dialog.actions[-1].action.command set value "trigger tpa.language set $(id)"
$execute if score #is_server_selecting tpa.variables matches 1 run data modify storage tpa:tpa temp.args.dialog.actions[-1].action.command set value "scoreboard players set #language tpa.config $(id)"
