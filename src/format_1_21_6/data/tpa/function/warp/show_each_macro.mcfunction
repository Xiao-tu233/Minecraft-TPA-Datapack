# Parent function: tpa:warp/show_each
# @macro: {index: int, dim_color: char}
$execute if score #warp_disabled tpa.variables matches 0 if score #i tpa.variables matches 2.. run tellraw @s [\
    "  ", \
    {\
        storage: "tpa:tpa", nbt: "temp.warp[0].name", color:"$(dim_color)", \
        hover_event: {action: "show_text", value: [\
            {storage: "tpa:tpa", nbt: "temp.warp[0].desc"}, " (", \
            {nbt: "temp.warp[0].x", storage: "tpa:tpa", color:"$(dim_color)"}, " ", \
            {nbt: "temp.warp[0].y", storage: "tpa:tpa", color:"$(dim_color)"}, " ", \
            {nbt: "temp.warp[0].z", storage: "tpa:tpa", color:"$(dim_color)"}, ")" \
        ]}\
    }, " ", \
    {storage: "tpa:tpa", nbt: "loaded_lang.warp_button_tp", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.warp_button_tp_hoverevent"}}, click_event: {action: "run_command", command: "/trigger tpa.warp set $(index)"}}, " ", \
    {storage: "tpa:tpa", nbt: "warp[0].warp_button_setpos", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.warp_button_setpos_hoverevent"}},click_event: {action: "run_command", command: "/function tpa:warp/setpos {index: $(index)}"}}, " ", \
    {storage: "tpa:tpa", nbt: "warp[0].warp_button_setname", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.warp_button_setname_hoverevent"}},click_event: {action: "suggest_command", command: "/function tpa:warp/set_name {index: $(index), name: \"\"}"}}, " ", \
    {storage: "tpa:tpa", nbt: "warp[0].warp_button_setdesc", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.warp_button_setdesc_hoverevent"}},click_event: {action: "suggest_command", command: "/function tpa:warp/set_desc {index: $(index), desc: \"\"}"}}, " ", \
    {storage: "tpa:tpa", nbt: "warp[0].warp_button_rm", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.warp_button_rm_hoverevent"}},click_event: {action: "run_command", command: "/function tpa:warp/remove {index: $(index)}"}}, " ", \
    {storage: "tpa:tpa", nbt: "warp[0].warp_button_disable", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.warp_button_disable_hoverevent"}},click_event: {action: "run_command", command: "/function tpa:warp/disable {index: $(index)}"}}, " ", \
    {storage: "tpa:tpa", nbt: "warp[0].warp_button_moveup", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.warp_button_moveup_hoverevent"}},click_event: {action: "run_command", command: "/function tpa:warp/moveup {index: $(index)}"}}, " ", \
    {storage: "tpa:tpa", nbt: "warp[0].warp_button_movedown", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.warp_button_movedown_hoverevent"}},click_event: {action: "run_command", command: "/function tpa:warp/movedown {index: $(index)}"}}, " " \
]

$execute if score #warp_disabled tpa.variables matches 1 if score #i tpa.variables matches 2.. run tellraw @s [\
    "  ", \
    {\
        storage: "tpa:tpa", nbt: "temp.warp[0].name", color:"gray", \
        hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.warp_desc_disabled"}}\
    }, " ", \
    {storage: "tpa:tpa", nbt: "loaded_lang.warp_button_tp", color: "gray", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.warp_desc_disabled"}}}, " ", \
    {storage: "tpa:tpa", nbt: "warp[0].warp_button_setpos", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.warp_button_setpos_hoverevent"}},click_event: {action: "run_command", command: "/function tpa:warp/setpos {index: $(index)}"}}, " ", \
    {storage: "tpa:tpa", nbt: "warp[0].warp_button_setname", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.warp_button_setname_hoverevent"}},click_event: {action: "suggest_command", command: "/function tpa:warp/set_name {index: $(index), name: \"\"}"}}, " ", \
    {storage: "tpa:tpa", nbt: "warp[0].warp_button_setdesc", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.warp_button_setdesc_hoverevent"}},click_event: {action: "suggest_command", command: "/function tpa:warp/set_desc {index: $(index), desc: \"\"}"}}, " ", \
    {storage: "tpa:tpa", nbt: "warp[0].warp_button_rm", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.warp_button_rm_hoverevent"}},click_event: {action: "run_command", command: "/function tpa:warp/remove {index: $(index)}"}}, " ", \
    {storage: "tpa:tpa", nbt: "warp[0].warp_button_enable", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.warp_button_disable_hoverevent"}},click_event: {action: "run_command", command: "/function tpa:warp/enable {index: $(index)}"}}, " ", \
    {storage: "tpa:tpa", nbt: "warp[0].warp_button_moveup", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.warp_button_moveup_hoverevent"}},click_event: {action: "run_command", command: "/function tpa:warp/moveup {index: $(index)}"}}, " ", \
    {storage: "tpa:tpa", nbt: "warp[0].warp_button_movedown", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.warp_button_movedown_hoverevent"}},click_event: {action: "run_command", command: "/function tpa:warp/movedown {index: $(index)}"}}, " " \
]


$execute if score #warp_disabled tpa.variables matches 0 if score #i tpa.variables matches 1 run tellraw @s [\
    "  ", \
    {\
        storage: "tpa:tpa", nbt: "temp.warp[0].name", color:"$(dim_color)", \
        hover_event: {action: "show_text", value: [\
            {storage: "tpa:tpa", nbt: "temp.warp[0].desc"}, " (", \
            {nbt: "temp.warp[0].x", storage: "tpa:tpa", color:"$(dim_color)"}, " ", \
            {nbt: "temp.warp[0].y", storage: "tpa:tpa", color:"$(dim_color)"}, " ", \
            {nbt: "temp.warp[0].z", storage: "tpa:tpa", color:"$(dim_color)"}, ")" \
        ]}\
    }, " ", \
    {storage: "tpa:tpa", nbt: "loaded_lang.warp_button_tp", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.warp_button_tp_hoverevent"}}, click_event: {action: "run_command", command: "/trigger tpa.warp set $(index)"}}, " ", \
    {storage: "tpa:tpa", nbt: "warp[0].warp_button_setpos", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.warp_button_setpos_hoverevent"}},click_event: {action: "run_command", command: "/function tpa:warp/setpos {index: $(index)}"}}, " ", \
    {storage: "tpa:tpa", nbt: "warp[0].warp_button_setname", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.warp_button_setname_hoverevent"}},click_event: {action: "suggest_command", command: "/function tpa:warp/set_name {index: $(index), name: \"\"}"}}, " ", \
    {storage: "tpa:tpa", nbt: "warp[0].warp_button_setdesc", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.warp_button_setdesc_hoverevent"}},click_event: {action: "suggest_command", command: "/function tpa:warp/set_desc {index: $(index), desc: \"\"}"}}, " ", \
    {storage: "tpa:tpa", nbt: "warp[0].warp_button_rm", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.warp_button_rm_hoverevent"}},click_event: {action: "run_command", command: "/function tpa:warp/remove {index: $(index)}"}}, " ", \
    {storage: "tpa:tpa", nbt: "warp[0].warp_button_disable", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.warp_button_disable_hoverevent"}},click_event: {action: "run_command", command: "/function tpa:warp/disable {index: $(index)}"}}, " ", \
    {storage: "tpa:tpa", nbt: "warp[0].warp_button_moveup", color: "gray", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.warp_button_moveup_notavail_hoverevent"}}}, " ", \
    {storage: "tpa:tpa", nbt: "warp[0].warp_button_movedown", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.warp_button_movedown_hoverevent"}},click_event: {action: "run_command", command: "/function tpa:warp/movedown {index: $(index)}"}}, " " \
]

$execute if score #warp_disabled tpa.variables matches 1 if score #i tpa.variables matches 1 run tellraw @s [\
    "  ", \
    {\
        storage: "tpa:tpa", nbt: "temp.warp[0].name", color:"gray", \
        hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.warp_desc_disabled"}}\
    }, " ", \
    {storage: "tpa:tpa", nbt: "loaded_lang.warp_button_tp", color: "gray", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.warp_desc_disabled"}}}, " ", \
    {storage: "tpa:tpa", nbt: "warp[0].warp_button_setpos", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.warp_button_setpos_hoverevent"}},click_event: {action: "run_command", command: "/function tpa:warp/setpos {index: $(index)}"}}, " ", \
    {storage: "tpa:tpa", nbt: "warp[0].warp_button_setname", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.warp_button_setname_hoverevent"}},click_event: {action: "suggest_command", command: "/function tpa:warp/set_name {index: $(index), name: \"\"}"}}, " ", \
    {storage: "tpa:tpa", nbt: "warp[0].warp_button_setdesc", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.warp_button_setdesc_hoverevent"}},click_event: {action: "suggest_command", command: "/function tpa:warp/set_desc {index: $(index), desc: \"\"}"}}, " ", \
    {storage: "tpa:tpa", nbt: "warp[0].warp_button_rm", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.warp_button_rm_hoverevent"}},click_event: {action: "run_command", command: "/function tpa:warp/remove {index: $(index)}"}}, " ", \
    {storage: "tpa:tpa", nbt: "warp[0].warp_button_enable", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.warp_button_disable_hoverevent"}},click_event: {action: "run_command", command: "/function tpa:warp/enable {index: $(index)}"}}, " ", \
    {storage: "tpa:tpa", nbt: "warp[0].warp_button_moveup", color: "gray", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.warp_button_moveup_notavail_hoverevent"}}}, " ", \
    {storage: "tpa:tpa", nbt: "warp[0].warp_button_movedown", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.warp_button_movedown_hoverevent"}},click_event: {action: "run_command", command: "/function tpa:warp/movedown {index: $(index)}"}}, " " \
]

# Warp Name
$data modify storage tpa:tpa temp.args.dialog.actions append value {width: 100, label: {text: "", color: "$(dim_color)"}, tooltip: [{text: " "}, " (", {text: "", color: "$(dim_color)"}, " ", {text: "", color: "$(dim_color)"}, " ", {text: "", color: "$(dim_color)"}, ")"]}
data modify entity @n[type=text_display, tag=tpa.text_display] text set from storage tpa:tpa temp.warp[0].name
data modify storage tpa:tpa temp.args.dialog.actions[-1].label.text set from entity @n[type=text_display, tag=tpa.text_display] text
execute if score #warp_disabled tpa.variables matches 1 run data modify storage tpa:tpa temp.args.dialog.actions[-1].label.color set value "gray"

data modify entity @n[type=text_display, tag=tpa.text_display] text set from storage tpa:tpa temp.warp[0].desc
data modify storage tpa:tpa temp.args.dialog.actions[-1].tooltip[0].text set from entity @n[type=text_display, tag=tpa.text_display] text

execute store result storage tpa:tpa temp.args.dialog.actions[-1].tooltip[2].text int 1 run data get storage tpa:tpa temp.warp[0].x
data modify storage tpa:tpa temp.args.dialog.actions[-1].tooltip[2].text set string storage tpa:tpa temp.args.dialog.actions[-1].tooltip[2].text
execute store result storage tpa:tpa temp.args.dialog.actions[-1].tooltip[4].text int 1 run data get storage tpa:tpa temp.warp[0].y
data modify storage tpa:tpa temp.args.dialog.actions[-1].tooltip[4].text set string storage tpa:tpa temp.args.dialog.actions[-1].tooltip[4].text
execute store result storage tpa:tpa temp.args.dialog.actions[-1].tooltip[6].text int 1 run data get storage tpa:tpa temp.warp[0].z
data modify storage tpa:tpa temp.args.dialog.actions[-1].tooltip[6].text set string storage tpa:tpa temp.args.dialog.actions[-1].tooltip[6].text

data modify entity @n[type=text_display, tag=tpa.text_display] text set from storage tpa:tpa loaded_lang.warp_desc_disabled
execute if score #warp_disabled tpa.variables matches 1 run data modify storage tpa:tpa temp.args.dialog.actions[-1].tooltip set value {text: "", color: "red"}
execute if score #warp_disabled tpa.variables matches 1 run data modify storage tpa:tpa temp.args.dialog.actions[-1].tooltip.text set from entity @n[type=text_display, tag=tpa.text_display] text 

# Teleport Button
data modify storage tpa:tpa temp.args.dialog.actions append value {width: 300, action: {type: "minecraft:run_command", command: ""}, label: {text: "", color: "aqua"}, tooltip: {text: "", color: "aqua"}}
execute if score #is_editting_warp tpa.variables matches 1 run data modify storage tpa:tpa temp.args.dialog.actions[-1].width set value 50
data modify entity @n[type=text_display, tag=tpa.text_display] text set string storage tpa:tpa loaded_lang.warp_button_tp 1 -1
data modify storage tpa:tpa temp.args.dialog.actions[-1].label.text set from entity @n[type=text_display, tag=tpa.text_display] text
data modify entity @n[type=text_display, tag=tpa.text_display] text set from storage tpa:tpa loaded_lang.warp_button_tp_hoverevent
data modify storage tpa:tpa temp.args.dialog.actions[-1].tooltip.text set from entity @n[type=text_display, tag=tpa.text_display] text
$data modify storage tpa:tpa temp.args.dialog.actions[-1].action.command set value "trigger tpa.warp set $(index)"
data modify entity @n[type=text_display, tag=tpa.text_display] text set from storage tpa:tpa loaded_lang.warp_desc_disabled
execute if score #warp_disabled tpa.variables matches 1 run \
    data modify storage tpa:tpa temp.args.dialog.actions[-1].tooltip.text set from entity @n[type=text_display, tag=tpa.text_display] text
execute if score #warp_disabled tpa.variables matches 1 run data remove storage tpa:tpa temp.args.dialog.actions[-1].action


# Skip the following parts if menu is called by triggering
execute unless score #is_editting_warp tpa.variables matches 1 run return 0

# Set Pos Button
data modify storage tpa:tpa temp.args.dialog.actions append value {width: 50, action: {type: "minecraft:run_command", command: ""}, label: {text: "", color: "green"}, tooltip: {text: "", color: "aqua"}}
data modify entity @n[type=text_display, tag=tpa.text_display] text set string storage tpa:tpa warp[0].warp_button_setpos 1 -1
data modify storage tpa:tpa temp.args.dialog.actions[-1].label.text set from entity @n[type=text_display, tag=tpa.text_display] text
data modify entity @n[type=text_display, tag=tpa.text_display] text set from storage tpa:tpa loaded_lang.warp_button_setpos_hoverevent
data modify storage tpa:tpa temp.args.dialog.actions[-1].tooltip.text set from entity @n[type=text_display, tag=tpa.text_display] text
$data modify storage tpa:tpa temp.args.dialog.actions[-1].action.command set value "function tpa:warp/setpos {index: $(index)}"

# Set Name Button
data modify storage tpa:tpa temp.args.dialog.actions append value {width: 50, action: {type: "minecraft:run_command", command: ""}, label: {text: "", color: "green"}, tooltip: {text: "", color: "aqua"}}
data modify entity @n[type=text_display, tag=tpa.text_display] text set string storage tpa:tpa warp[0].warp_button_setname 1 -1
data modify storage tpa:tpa temp.args.dialog.actions[-1].label.text set from entity @n[type=text_display, tag=tpa.text_display] text
data modify entity @n[type=text_display, tag=tpa.text_display] text set from storage tpa:tpa loaded_lang.warp_button_setname_hoverevent
data modify storage tpa:tpa temp.args.dialog.actions[-1].tooltip.text set from entity @n[type=text_display, tag=tpa.text_display] text
$data modify storage tpa:tpa temp.args.dialog.actions[-1].action.command set value "function tpa:warp/set_name_dialog {index: $(index), name: \"(name)\"}"

# Set Desc Button
data modify storage tpa:tpa temp.args.dialog.actions append value {width: 50, action: {type: "minecraft:run_command", command: ""}, label: {text: "", color: "green"}, tooltip: {text: "", color: "aqua"}}
data modify entity @n[type=text_display, tag=tpa.text_display] text set string storage tpa:tpa warp[0].warp_button_setdesc 1 -1
data modify storage tpa:tpa temp.args.dialog.actions[-1].label.text set from entity @n[type=text_display, tag=tpa.text_display] text
data modify entity @n[type=text_display, tag=tpa.text_display] text set from storage tpa:tpa loaded_lang.warp_button_setdesc_hoverevent
data modify storage tpa:tpa temp.args.dialog.actions[-1].tooltip.text set from entity @n[type=text_display, tag=tpa.text_display] text
$data modify storage tpa:tpa temp.args.dialog.actions[-1].action.command set value "function tpa:warp/set_desc_dialog {index: $(index), desc: \"(desc)\"}"

# Remove Button
data modify storage tpa:tpa temp.args.dialog.actions append value {width: 50, action: {type: "minecraft:run_command", command: ""}, label: {text: "", color: "red"}, tooltip: {text: "", color: "aqua"}}
data modify entity @n[type=text_display, tag=tpa.text_display] text set string storage tpa:tpa warp[0].warp_button_rm 1 -1
data modify storage tpa:tpa temp.args.dialog.actions[-1].label.text set from entity @n[type=text_display, tag=tpa.text_display] text
data modify entity @n[type=text_display, tag=tpa.text_display] text set from storage tpa:tpa loaded_lang.warp_button_rm_hoverevent
data modify storage tpa:tpa temp.args.dialog.actions[-1].tooltip.text set from entity @n[type=text_display, tag=tpa.text_display] text
$data modify storage tpa:tpa temp.args.dialog.actions[-1].action.command set value "function tpa:warp/remove {index: $(index)}"

# Switch Status Button
data modify storage tpa:tpa temp.args.dialog.actions append value {width: 50, action: {type: "minecraft:run_command", command: ""}, label: {text: "", color: "red"}, tooltip: {text: "", color: "aqua"}}
execute if score #warp_disabled tpa.variables matches 1 run data modify storage tpa:tpa temp.args.dialog.actions[-1].label.color set value "green"
data modify entity @n[type=text_display, tag=tpa.text_display] text set string storage tpa:tpa warp[0].warp_button_disable 1 -1
execute if score #warp_disabled tpa.variables matches 1 run data modify entity @n[type=text_display, tag=tpa.text_display] text set string storage tpa:tpa warp[0].warp_button_enable 1 -1
data modify storage tpa:tpa temp.args.dialog.actions[-1].label.text set from entity @n[type=text_display, tag=tpa.text_display] text
data modify entity @n[type=text_display, tag=tpa.text_display] text set from storage tpa:tpa loaded_lang.warp_button_disable_hoverevent
execute if score #warp_disabled tpa.variables matches 1 run data modify entity @n[type=text_display, tag=tpa.text_display] text set from storage tpa:tpa loaded_lang.warp_button_enable_hoverevent
data modify storage tpa:tpa temp.args.dialog.actions[-1].tooltip.text set from entity @n[type=text_display, tag=tpa.text_display] text
$data modify storage tpa:tpa temp.args.dialog.actions[-1].action.command set value "function tpa:warp/disable {index: $(index)}"
$execute if score #warp_disabled tpa.variables matches 1 run data modify storage tpa:tpa temp.args.dialog.actions[-1].action.command set value "function tpa:warp/enable {index: $(index)}"

# Move Up Button
data modify storage tpa:tpa temp.args.dialog.actions append value {width: 50, action: {type: "minecraft:run_command", command: ""}, label: {text: "", color: "light_purple"}, tooltip: {text: "", color: "aqua"}}
data modify entity @n[type=text_display, tag=tpa.text_display] text set string storage tpa:tpa warp[0].warp_button_moveup 1 -1
data modify storage tpa:tpa temp.args.dialog.actions[-1].label.text set from entity @n[type=text_display, tag=tpa.text_display] text
data modify entity @n[type=text_display, tag=tpa.text_display] text set from storage tpa:tpa loaded_lang.warp_button_moveup_hoverevent
execute if score #i tpa.variables matches 1 run data modify entity @n[type=text_display, tag=tpa.text_display] text set from storage tpa:tpa loaded_lang.warp_button_moveup_notavail_hoverevent
data modify storage tpa:tpa temp.args.dialog.actions[-1].tooltip.text set from entity @n[type=text_display, tag=tpa.text_display] text
$data modify storage tpa:tpa temp.args.dialog.actions[-1].action.command set value "function tpa:warp/moveup {index: $(index)}"
execute if score #i tpa.variables matches 1 run data remove storage tpa:tpa temp.args.dialog.actions[-1].action

# Move Down Button
data modify storage tpa:tpa temp.args.dialog.actions append value {width: 50, action: {type: "minecraft:run_command", command: ""}, label: {text: "", color: "light_purple"}, tooltip: {text: "", color: "aqua"}}
data modify entity @n[type=text_display, tag=tpa.text_display] text set string storage tpa:tpa warp[0].warp_button_movedown 1 -1
data modify storage tpa:tpa temp.args.dialog.actions[-1].label.text set from entity @n[type=text_display, tag=tpa.text_display] text
data modify entity @n[type=text_display, tag=tpa.text_display] text set from storage tpa:tpa loaded_lang.warp_button_movedown_hoverevent
data modify storage tpa:tpa temp.args.dialog.actions[-1].tooltip.text set from entity @n[type=text_display, tag=tpa.text_display] text
$data modify storage tpa:tpa temp.args.dialog.actions[-1].action.command set value "function tpa:warp/movedown {index: $(index)}"