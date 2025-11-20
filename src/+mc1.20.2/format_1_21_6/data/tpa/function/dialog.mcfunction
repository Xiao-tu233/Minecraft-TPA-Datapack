
scoreboard players operation #dialog tpa.variables = @s tpa.dialog
scoreboard players set @s tpa.dialog 0
function tpa:load_lang
function tpa:sounds/levelup

data remove storage tpa:tpa temp.args
execute if score #dialog tpa.variables matches 1 run data modify storage tpa:tpa temp.args.direction set value "tpa"
execute if score #dialog tpa.variables matches 2 run data modify storage tpa:tpa temp.args.direction set value "tpahere"
execute if score #dialog tpa.variables matches 1 run data modify storage tpa:tpa temp.args.menu_switch_value set value 2
execute if score #dialog tpa.variables matches 2 run data modify storage tpa:tpa temp.args.menu_switch_value set value 1


summon minecraft:text_display ~ ~ ~ {alignment:"center",Tags:["tpa.text_display"]}
# Requests
data modify entity @n[type=text_display, tag=tpa.text_display] text set from storage tpa:tpa loaded_lang.tpa_menu_hoverevent_left_part
data modify storage tpa:tpa temp.args.hover_left set from entity @n[type=text_display, tag=tpa.text_display] text
data modify entity @n[type=text_display, tag=tpa.text_display] text set from storage tpa:tpa loaded_lang.tpa_menu_hoverevent_right_part
data modify storage tpa:tpa temp.args.hover_right set from entity @n[type=text_display, tag=tpa.text_display] text
data modify storage tpa:tpa temp.args merge value {id_0: 0, id_1: 0, id_2: 0, id_3: 0, id_4: 0, id_5: 0, id_6: 0, id_7: 0, id_8: 0, id_9: 0, id_10: 0, id_11: 0, id_12: 0, id_13: 0, id_14: 0, id_15: 0, id_16: 0, id_17: 0, id_18: 0, id_19: 0, name_0: "", name_1: "", name_2: "", name_3: "", name_4: "", name_5: "", name_6: "", name_7: "", name_8: "", name_9: "", name_10: "", name_11: "", name_12: "", name_13: "", name_14: "", name_15: "", name_16: "", name_17: "", name_18: "", name_19: ""}
function tpa:dialog/get_available_players

# Menu switch
execute if score #dialog tpa.variables matches 2 run data modify entity @n[type=text_display, tag=tpa.text_display] text set string storage tpa:tpa loaded_lang.tpa_menu_tpamenu_button 1 -1
execute if score #dialog tpa.variables matches 1 run data modify entity @n[type=text_display, tag=tpa.text_display] text set string storage tpa:tpa loaded_lang.tpa_menu_tpaheremenu_button 1 -1
data modify storage tpa:tpa temp.args.menu_switch set from entity @n[type=text_display, tag=tpa.text_display] text
execute if score #dialog tpa.variables matches 2 run data modify entity @n[type=text_display, tag=tpa.text_display] text set from storage tpa:tpa loaded_lang.tpa_menu_tpamenu_button_hoverevent
execute if score #dialog tpa.variables matches 1 run data modify entity @n[type=text_display, tag=tpa.text_display] text set from storage tpa:tpa loaded_lang.tpa_menu_tpaheremenu_button_hoverevent
data modify storage tpa:tpa temp.args.menu_switch_hover set from entity @n[type=text_display, tag=tpa.text_display] text
# Title
data modify entity @n[type=text_display, tag=tpa.text_display] text set from storage tpa:tpa loaded_lang.tpa_menu_dialog_title
data modify storage tpa:tpa temp.args.title set from entity @n[type=text_display, tag=tpa.text_display] text
# You
data modify entity @n[type=text_display, tag=tpa.text_display] text set from storage tpa:tpa loaded_lang.tpa_menu_you
data modify storage tpa:tpa temp.args.you set from entity @n[type=text_display, tag=tpa.text_display] text
# You hover
function tpa:get_name
data modify storage tpa:tpa temp.args.you_hover set from storage tpa:tpa temp.name
# Has id of
data modify entity @n[type=text_display, tag=tpa.text_display] text set from storage tpa:tpa loaded_lang.tpa_menu_has_id_of
data modify storage tpa:tpa temp.args.has_id_of set from entity @n[type=text_display, tag=tpa.text_display] text
# Has id of hover
data modify entity @n[type=text_display, tag=tpa.text_display] text set from storage tpa:tpa loaded_lang.tpa_menu_has_id_of_hoverevent
data modify storage tpa:tpa temp.args.has_id_of_hover set from entity @n[type=text_display, tag=tpa.text_display] text
# Id
tag @s add self
data modify entity @n[type=text_display, tag=tpa.text_display] text set value {score: {name: "@p[tag=self]", objective: "tpa.player_id"}}
tag @s remove self
data modify storage tpa:tpa temp.args.id set from entity @n[type=text_display, tag=tpa.text_display] text
# ID fix (Remove the outside brackets)
data modify entity @n[type=text_display, tag=tpa.text_display] text set string storage tpa:tpa loaded_lang.tpa_menu_idfix_button 1 -1
data modify storage tpa:tpa temp.args.idfix set from entity @n[type=text_display, tag=tpa.text_display] text
data modify entity @n[type=text_display, tag=tpa.text_display] text set from storage tpa:tpa loaded_lang.tpa_menu_idfix_button_hoverevent
data modify storage tpa:tpa temp.args.idfix_hover set from entity @n[type=text_display, tag=tpa.text_display] text
# Search ID (Remove the outside brackets)
data modify entity @n[type=text_display, tag=tpa.text_display] text set string storage tpa:tpa loaded_lang.tpa_menu_search_id_button 1 -1
data modify storage tpa:tpa temp.args.search_id set from entity @n[type=text_display, tag=tpa.text_display] text
data modify entity @n[type=text_display, tag=tpa.text_display] text set from storage tpa:tpa loaded_lang.tpa_menu_search_id_button_hoverevent
data modify storage tpa:tpa temp.args.search_id_hover set from entity @n[type=text_display, tag=tpa.text_display] text
# Back (Remove the outside brackets)
data modify entity @n[type=text_display, tag=tpa.text_display] text set string storage tpa:tpa loaded_lang.tpa_menu_back_button 1 -1
data modify storage tpa:tpa temp.args.back set from entity @n[type=text_display, tag=tpa.text_display] text
data modify entity @n[type=text_display, tag=tpa.text_display] text set from storage tpa:tpa loaded_lang.tpa_menu_back_button_hoverevent
data modify storage tpa:tpa temp.args.back_hover set from entity @n[type=text_display, tag=tpa.text_display] text
# Lang (Remove the outside brackets)
data modify entity @n[type=text_display, tag=tpa.text_display] text set string storage tpa:tpa loaded_lang.tpa_menu_lang_button 1 -1
data modify storage tpa:tpa temp.args.lang set from entity @n[type=text_display, tag=tpa.text_display] text
data modify entity @n[type=text_display, tag=tpa.text_display] text set from storage tpa:tpa loaded_lang.tpa_menu_lang_button_hoverevent
data modify storage tpa:tpa temp.args.lang_hover set from entity @n[type=text_display, tag=tpa.text_display] text
# Book (Remove the outside brackets)
data modify entity @n[type=text_display, tag=tpa.text_display] text set string storage tpa:tpa loaded_lang.tpa_menu_book_button 1 -1
data modify storage tpa:tpa temp.args.book set from entity @n[type=text_display, tag=tpa.text_display] text
data modify entity @n[type=text_display, tag=tpa.text_display] text set from storage tpa:tpa loaded_lang.tpa_menu_book_button_hoverevent
data modify storage tpa:tpa temp.args.book_hover set from entity @n[type=text_display, tag=tpa.text_display] text
# Pos (Remove the outside brackets)
data modify entity @n[type=text_display, tag=tpa.text_display] text set string storage tpa:tpa loaded_lang.tpa_menu_pos_button 1 -1
data modify storage tpa:tpa temp.args.pos set from entity @n[type=text_display, tag=tpa.text_display] text
data modify entity @n[type=text_display, tag=tpa.text_display] text set from storage tpa:tpa loaded_lang.tpa_menu_pos_button_hoverevent
data modify storage tpa:tpa temp.args.pos_hover set from entity @n[type=text_display, tag=tpa.text_display] text
# Here (Remove the outside brackets)
data modify entity @n[type=text_display, tag=tpa.text_display] text set string storage tpa:tpa loaded_lang.tpa_menu_here_button 1 -1
data modify storage tpa:tpa temp.args.here set from entity @n[type=text_display, tag=tpa.text_display] text
data modify entity @n[type=text_display, tag=tpa.text_display] text set from storage tpa:tpa loaded_lang.tpa_menu_here_button_hoverevent
data modify storage tpa:tpa temp.args.here_hover set from entity @n[type=text_display, tag=tpa.text_display] text
# Home (Remove the outside brackets)
data modify entity @n[type=text_display, tag=tpa.text_display] text set string storage tpa:tpa loaded_lang.tpa_menu_home_button 1 -1
data modify storage tpa:tpa temp.args.home set from entity @n[type=text_display, tag=tpa.text_display] text
data modify entity @n[type=text_display, tag=tpa.text_display] text set from storage tpa:tpa loaded_lang.tpa_menu_home_button_hoverevent
data modify storage tpa:tpa temp.args.home_hover set from entity @n[type=text_display, tag=tpa.text_display] text
# Warp (Remove the outside brackets)
data modify entity @n[type=text_display, tag=tpa.text_display] text set string storage tpa:tpa loaded_lang.tpa_menu_warp_button 1 -1
data modify storage tpa:tpa temp.args.warp set from entity @n[type=text_display, tag=tpa.text_display] text
data modify entity @n[type=text_display, tag=tpa.text_display] text set from storage tpa:tpa loaded_lang.tpa_menu_warp_button_hoverevent
data modify storage tpa:tpa temp.args.warp_hover set from entity @n[type=text_display, tag=tpa.text_display] text
# Switches hovers
data modify entity @n[type=text_display, tag=tpa.text_display] text set from storage tpa:tpa loaded_lang.tpa_menu_switch_hoverevent
data modify storage tpa:tpa temp.args.switch_hover set from entity @n[type=text_display, tag=tpa.text_display] text
# Accept toggle
data modify entity @n[type=text_display, tag=tpa.text_display] text set from storage tpa:tpa loaded_lang.tpa_menu_auto_accept
data modify storage tpa:tpa temp.args.auto_accept set from entity @n[type=text_display, tag=tpa.text_display] text
data modify entity @n[type=text_display, tag=tpa.text_display] text set value ""
execute if score @s tpa.tpaccept_toggle matches 0 run data modify entity @n[type=text_display, tag=tpa.text_display] text set from storage tpa:tpa loaded_lang.tpa_menu_disabled
execute if score @s tpa.tpaccept_toggle matches 1 run data modify entity @n[type=text_display, tag=tpa.text_display] text set from storage tpa:tpa loaded_lang.tpa_menu_enabled
data modify storage tpa:tpa temp.args.auto_accept_value set from entity @n[type=text_display, tag=tpa.text_display] text
# Mute
data modify entity @n[type=text_display, tag=tpa.text_display] text set from storage tpa:tpa loaded_lang.tpa_menu_mute
data modify storage tpa:tpa temp.args.mute set from entity @n[type=text_display, tag=tpa.text_display] text
data modify entity @n[type=text_display, tag=tpa.text_display] text set value ""
execute if score @s tpa.mute matches 0 run data modify entity @n[type=text_display, tag=tpa.text_display] text set from storage tpa:tpa loaded_lang.tpa_menu_disabled
execute if score @s tpa.mute matches 1 run data modify entity @n[type=text_display, tag=tpa.text_display] text set from storage tpa:tpa loaded_lang.tpa_menu_enabled
data modify storage tpa:tpa temp.args.mute_value set from entity @n[type=text_display, tag=tpa.text_display] text
# Output
data modify entity @n[type=text_display, tag=tpa.text_display] text set from storage tpa:tpa loaded_lang.tpa_menu_output
data modify storage tpa:tpa temp.args.output set from entity @n[type=text_display, tag=tpa.text_display] text
data modify entity @n[type=text_display, tag=tpa.text_display] text set value ""
execute if score @s tpa.output matches 0 run data modify entity @n[type=text_display, tag=tpa.text_display] text set from storage tpa:tpa loaded_lang.tpa_menu_output_no_hidden
execute if score @s tpa.output matches 1 run data modify entity @n[type=text_display, tag=tpa.text_display] text set from storage tpa:tpa loaded_lang.tpa_menu_output_chatbar_hidden
execute if score @s tpa.output matches 2 run data modify entity @n[type=text_display, tag=tpa.text_display] text set from storage tpa:tpa loaded_lang.tpa_menu_output_actionbar_hidden
data modify storage tpa:tpa temp.args.output_value set from entity @n[type=text_display, tag=tpa.text_display] text

kill @n[type=text_display, tag=tpa.text_display]

function tpa:dialog/menu with storage tpa:tpa temp.args