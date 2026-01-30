# Parent function: tpa:tp_pos/modify,  tpa:tp_pos/main

summon minecraft:text_display ~ ~ ~ {alignment:"center",Tags:["tpa.text_display"]}

data remove storage tpa:tpa temp.args

tag @s add self
# X
data modify entity @n[type=text_display, tag=tpa.text_display] text set value {score: {name: "@p[tag=self]", objective: "tpa.pos.x"}}
data modify storage tpa:tpa temp.args.x_initial set from entity @n[type=text_display, tag=tpa.text_display] text
# Y
data modify entity @n[type=text_display, tag=tpa.text_display] text set value {score: {name: "@p[tag=self]", objective: "tpa.pos.y"}}
data modify storage tpa:tpa temp.args.y_initial set from entity @n[type=text_display, tag=tpa.text_display] text
# Z
data modify entity @n[type=text_display, tag=tpa.text_display] text set value {score: {name: "@p[tag=self]", objective: "tpa.pos.z"}}
data modify storage tpa:tpa temp.args.z_initial set from entity @n[type=text_display, tag=tpa.text_display] text
tag @s remove self

# Langs've been loaded in parent function
data modify entity @n[type=text_display, tag=tpa.text_display] text set value ""
data modify entity @n[type=text_display, tag=tpa.text_display] text set from storage tpa:tpa loaded_lang.tp_pos_dialog_cancel_tooltip
data modify storage tpa:tpa temp.args.cancel_tooltip set from entity @n[type=text_display, tag=tpa.text_display] text
data modify entity @n[type=text_display, tag=tpa.text_display] text set from storage tpa:tpa loaded_lang.tp_pos_dialog_done_tooltip
data modify storage tpa:tpa temp.args.done_tooltip set from entity @n[type=text_display, tag=tpa.text_display] text

data modify entity @n[type=text_display, tag=tpa.text_display] text set from storage tpa:tpa loaded_lang.tp_pos_dialog_set_x
data modify storage tpa:tpa temp.args.set_x set from entity @n[type=text_display, tag=tpa.text_display] text
data modify entity @n[type=text_display, tag=tpa.text_display] text set from storage tpa:tpa loaded_lang.tp_pos_dialog_set_x_tooltip
data modify storage tpa:tpa temp.args.set_x_tooltip set from entity @n[type=text_display, tag=tpa.text_display] text

data modify entity @n[type=text_display, tag=tpa.text_display] text set from storage tpa:tpa loaded_lang.tp_pos_dialog_set_y
data modify storage tpa:tpa temp.args.set_y set from entity @n[type=text_display, tag=tpa.text_display] text
data modify entity @n[type=text_display, tag=tpa.text_display] text set from storage tpa:tpa loaded_lang.tp_pos_dialog_set_y_tooltip
data modify storage tpa:tpa temp.args.set_y_tooltip set from entity @n[type=text_display, tag=tpa.text_display] text

data modify entity @n[type=text_display, tag=tpa.text_display] text set from storage tpa:tpa loaded_lang.tp_pos_dialog_set_z
data modify storage tpa:tpa temp.args.set_z set from entity @n[type=text_display, tag=tpa.text_display] text
data modify entity @n[type=text_display, tag=tpa.text_display] text set from storage tpa:tpa loaded_lang.tp_pos_dialog_set_z_tooltip
data modify storage tpa:tpa temp.args.set_z_tooltip set from entity @n[type=text_display, tag=tpa.text_display] text

data modify entity @n[type=text_display, tag=tpa.text_display] text set from storage tpa:tpa loaded_lang.tp_pos_dialog_set
data modify storage tpa:tpa temp.args.set set from entity @n[type=text_display, tag=tpa.text_display] text

data modify storage tpa:tpa temp.args merge value {x: "$(x)", y: "$(y)", z: "$(z)"}

kill @n[type=text_display, tag=tpa.text_display]

function tpa:tp_pos/dialog_ with storage tpa:tpa temp.args