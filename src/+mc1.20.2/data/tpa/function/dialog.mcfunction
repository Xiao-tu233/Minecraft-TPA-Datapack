
scoreboard players operation #dialog tpa.variables = @s tpa.dialog
scoreboard players set @s tpa.dialog 0
function tpa:load_lang
function tpa:sounds/levelup
data modify storage tpa:tpa temp.output set from storage tpa:tpa loaded_lang.dialog
function tpa:output/standard


data modify storage tpa:tpa temp.dialog_action_template set value {width: 100, label: ""}

# Dialog initialization
function tpa:dialog/initialize

# Request menu
scoreboard players operation #request_menu.direction tpa.variables = #dialog tpa.variables
scoreboard players remove #request_menu.direction tpa.variables 1
scoreboard players set #request_menu.page tpa.variables 1
scoreboard players set #request_menu.render tpa.variables 2
function tpa:request_menu/prepare
function tpa:request_menu/display

# UID display
data modify storage tpa:tpa temp.dialog.body.contents append value {text: "", color: "gold", hover_event: {action: "show_text"}}
data modify storage tpa:tpa temp.dialog.body.contents[-1].text set from storage tpa:tpa loaded_lang.tpa_menu_you
function tpa:get_name
data modify storage tpa:tpa temp.dialog.body.contents[-1].hover_event.value set from storage tpa:tpa temp.name

data modify storage tpa:tpa temp.dialog.body.contents append value {text: "", color: "white", hover_event: {action: "show_text"}}
data modify storage tpa:tpa temp.dialog.body.contents[-1].text set from storage tpa:tpa loaded_lang.tpa_menu_has_id_of
data modify storage tpa:tpa temp.dialog.body.contents[-1].hover_event.value set from storage tpa:tpa loaded_lang.tpa_menu_has_id_of_hoverevent

data modify storage tpa:tpa temp.dialog.body.contents append value {text: "", color: "aqua"}
execute store result storage tpa:tpa temp.dialog_uid int 1 run scoreboard players get @s tpa.uid
data modify storage tpa:tpa temp.dialog_uid set string storage tpa:tpa temp.dialog_uid
data modify storage tpa:tpa temp.dialog.body.contents[-1].text set from storage tpa:tpa temp.dialog_uid

# Menu function buttons

# Search ID
data modify storage tpa:tpa temp.dialog.actions append from storage tpa:tpa temp.dialog_action_template
data modify storage tpa:tpa temp.dialog.actions[-1].label set from storage tpa:tpa loaded_lang.tpa_menu_search_id_button
data modify storage tpa:tpa temp.dialog.actions[-1].tooltip.text set from storage tpa:tpa loaded_lang.tpa_menu_search_id_button_hoverevent
execute if score #search_id tpa.config matches 0 run data modify storage tpa:tpa temp.dialog.actions[-1].action set value {type: "minecraft:run_command", command: "/trigger tpa.search_id"}
execute if score #search_id tpa.config matches 1 run function tpa:dialog/menu/search_id_disabled

# Tpahere Menu

data modify storage tpa:tpa temp.dialog.actions append from storage tpa:tpa temp.dialog_action_template
execute if score #dialog tpa.variables matches 1 run function tpa:dialog/menu/switch/tpa
execute if score #dialog tpa.variables matches 2 run function tpa:dialog/menu/switch/tpahere
data modify storage tpa:tpa temp.dialog.actions[-1].action.type set value "minecraft:run_command"

# Back
data modify storage tpa:tpa temp.dialog.actions append from storage tpa:tpa temp.dialog_action_template
data modify storage tpa:tpa temp.dialog.actions[-1].label set from storage tpa:tpa loaded_lang.tpa_menu_back_button
data modify storage tpa:tpa temp.dialog.actions[-1].tooltip.text set from storage tpa:tpa loaded_lang.tpa_menu_back_button_hoverevent
execute if score #back tpa.config matches 1 run function tpa:dialog/menu/back/disabled
execute if score #back tpa.config matches 0 run function tpa:dialog/menu/back/enabled

# Language Menu
data modify storage tpa:tpa temp.dialog.actions append from storage tpa:tpa temp.dialog_action_template
data modify storage tpa:tpa temp.dialog.actions[-1].label set from storage tpa:tpa loaded_lang.tpa_menu_lang_button
data modify storage tpa:tpa temp.dialog.actions[-1].tooltip.text set from storage tpa:tpa loaded_lang.tpa_menu_lang_button_hoverevent
scoreboard players set #language_selection_blocked tpa.variables 0
execute if score #player_lang tpa.config matches 0 if score #language tpa.config matches 1.. run scoreboard players set #language_selection_blocked tpa.variables 1
execute if score #language_selection_blocked tpa.variables matches 0 run data modify storage tpa:tpa temp.dialog.actions[-1].action set value {type: "minecraft:run_command", command: "/trigger tpa.language set -1"}
execute if score #language_selection_blocked tpa.variables matches 1 run function tpa:dialog/menu/language/block

# Place holder for line 1 button 5
data modify storage tpa:tpa temp.dialog.actions append from storage tpa:tpa temp.dialog_action_template


# Book
data modify storage tpa:tpa temp.dialog.actions append from storage tpa:tpa temp.dialog_action_template
data modify storage tpa:tpa temp.dialog.actions[-1].label set from storage tpa:tpa loaded_lang.tpa_menu_book_button
data modify storage tpa:tpa temp.dialog.actions[-1].tooltip.text set from storage tpa:tpa loaded_lang.tpa_menu_book_button_hoverevent
execute if score #book tpa.config matches 0 run function tpa:dialog/menu/book/disabled
execute if score #book tpa.config matches 1 run function tpa:dialog/menu/book/enabled

# Pos
data modify storage tpa:tpa temp.dialog.actions append from storage tpa:tpa temp.dialog_action_template
data modify storage tpa:tpa temp.dialog.actions[-1].label set from storage tpa:tpa loaded_lang.tpa_menu_pos_button
data modify storage tpa:tpa temp.dialog.actions[-1].tooltip.text set from storage tpa:tpa loaded_lang.tpa_menu_pos_button_hoverevent
data modify storage tpa:tpa temp.dialog.actions[-1].action set value {type: "minecraft:run_command", command: "/trigger tpa.pos"}

# Here
data modify storage tpa:tpa temp.dialog.actions append from storage tpa:tpa temp.dialog_action_template
data modify storage tpa:tpa temp.dialog.actions[-1].label set from storage tpa:tpa loaded_lang.tpa_menu_here_button
data modify storage tpa:tpa temp.dialog.actions[-1].tooltip.text set from storage tpa:tpa loaded_lang.tpa_menu_here_button_hoverevent
data modify storage tpa:tpa temp.dialog.actions[-1].action set value {type: "minecraft:run_command", command: "/trigger tpa.here"}

# Home
data modify storage tpa:tpa temp.dialog.actions append from storage tpa:tpa temp.dialog_action_template
data modify storage tpa:tpa temp.dialog.actions[-1].label set from storage tpa:tpa loaded_lang.tpa_menu_home_button
data modify storage tpa:tpa temp.dialog.actions[-1].tooltip set from storage tpa:tpa loaded_lang.tpa_menu_home_button_hoverevent
execute if score #home tpa.config matches 0 run function tpa:dialog/menu/home/disabled
execute if score #home tpa.config matches 1.. run function tpa:dialog/menu/home/enabled

# Warp
data modify storage tpa:tpa temp.dialog.actions append from storage tpa:tpa temp.dialog_action_template
data modify storage tpa:tpa temp.dialog.actions[-1].label set from storage tpa:tpa loaded_lang.tpa_menu_warp_button
data modify storage tpa:tpa temp.dialog.actions[-1].tooltip set from storage tpa:tpa loaded_lang.tpa_menu_warp_button_hoverevent
execute if score #warp tpa.config matches 0 run function tpa:dialog/menu/warp/disabled
execute if score #warp tpa.config matches 1.. run function tpa:dialog/menu/warp/enabled

# Auto accept
data modify storage tpa:tpa temp.dialog.actions append from storage tpa:tpa temp.dialog_action_template
data modify storage tpa:tpa temp.dialog.actions[-1].label set value []
data modify storage tpa:tpa temp.dialog.actions[-1].label append from storage tpa:tpa loaded_lang.tpa_menu_auto_accept
execute if score @s tpa.tpaccept_toggle matches 0 run data modify storage tpa:tpa temp.dialog.actions[-1].label append from storage tpa:tpa loaded_lang.tpa_menu_disabled
execute if score @s tpa.tpaccept_toggle matches 1 run data modify storage tpa:tpa temp.dialog.actions[-1].label append from storage tpa:tpa loaded_lang.tpa_menu_enabled
data modify storage tpa:tpa temp.dialog.actions[-1].tooltip set from storage tpa:tpa loaded_lang.tpa_menu_switch_hoverevent
data modify storage tpa:tpa temp.dialog.actions[-1].action set value {type: "minecraft:run_command", command: "/trigger tpa.tpaccpet_toggle add 4"}

# Mute
data modify storage tpa:tpa temp.dialog.actions append from storage tpa:tpa temp.dialog_action_template
data modify storage tpa:tpa temp.dialog.actions[-1].label set value []
data modify storage tpa:tpa temp.dialog.actions[-1].label append from storage tpa:tpa loaded_lang.tpa_menu_mute
execute if score @s tpa.mute matches 0 run data modify storage tpa:tpa temp.dialog.actions[-1].label append from storage tpa:tpa loaded_lang.tpa_menu_disabled
execute if score @s tpa.mute matches 1 run data modify storage tpa:tpa temp.dialog.actions[-1].label append from storage tpa:tpa loaded_lang.tpa_menu_enabled
data modify storage tpa:tpa temp.dialog.actions[-1].tooltip set from storage tpa:tpa loaded_lang.tpa_menu_switch_hoverevent
data modify storage tpa:tpa temp.dialog.actions[-1].action set value {type: "minecraft:run_command", command: "/trigger tpa.mute add 4"}

# Output
data modify storage tpa:tpa temp.dialog.actions append from storage tpa:tpa temp.dialog_action_template
data modify storage tpa:tpa temp.dialog.actions[-1].label set value []
data modify storage tpa:tpa temp.dialog.actions[-1].label append from storage tpa:tpa loaded_lang.tpa_menu_output
execute if score @s tpa.output matches 0 run data modify storage tpa:tpa temp.dialog.actions[-1].label append from storage tpa:tpa loaded_lang.tpa_menu_output_no_hidden
execute if score @s tpa.output matches 1 run data modify storage tpa:tpa temp.dialog.actions[-1].label append from storage tpa:tpa loaded_lang.tpa_menu_output_chatbar_hidden
execute if score @s tpa.output matches 2 run data modify storage tpa:tpa temp.dialog.actions[-1].label append from storage tpa:tpa loaded_lang.tpa_menu_output_actionbar_hidden
data modify storage tpa:tpa temp.dialog.actions[-1].tooltip set from storage tpa:tpa loaded_lang.tpa_menu_switch_hoverevent
data modify storage tpa:tpa temp.dialog.actions[-1].action set value {type: "minecraft:run_command", command: "/trigger tpa.output add 6"}


# Macro call
data remove storage tpa:tpa temp.args
data modify storage tpa:tpa temp.args.dialog set from storage tpa:tpa temp.dialog
function tpa:dialog/display with storage tpa:tpa temp.args