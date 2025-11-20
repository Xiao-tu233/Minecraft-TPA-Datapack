# Parent function: tpa:home/each_home
# @macro: {id: int, dim_color: str}

$tellraw @s[predicate=tpa:output/show_chatbar] [\
    "  ", \
    {\
        storage: "tpa:tpa", nbt: "loaded_lang.home_number", color:"$(dim_color)", \
        hover_event: {action: "show_text", value: [\
            {nbt: "temp.home.$(id).x", storage: "tpa:tpa",color:"$(dim_color)"}, " ", \
            {nbt: "temp.home.$(id).y", storage: "tpa:tpa",color:"$(dim_color)"}, " ", \
            {nbt: "temp.home.$(id).z", storage: "tpa:tpa",color:"$(dim_color)"}\
        ]}\
    }, {storage: "tpa:tpa", nbt: "temp.args.id", color:"$(dim_color)"}, " ", \
    {storage: "tpa:tpa", nbt: "loaded_lang.home_display_tp_button", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.home_display_tp_button_hoverevent"}},click_event: {action: "run_command", command: "/trigger tpa.home set $(id)"}}, " ", \
    {storage: "tpa:tpa", nbt: "loaded_lang.home_display_rm_button", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.home_display_rm_button_hoverevent"}},click_event: {action: "run_command", command: "/trigger tpa.removehome set $(id)"}}, " ", \
    {storage: "tpa:tpa", nbt: "loaded_lang.home_display_set_button", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.home_display_set_button_hoverevent"}},click_event: {action: "run_command", command: "/trigger tpa.sethome set $(id)"}} \
]


# Home Info Display
$data modify storage tpa:tpa temp.args.dialog.actions append value {width: 100, label: [{text: "", color: "$(dim_color)"}, {text: "", color: "$(dim_color)"}], tooltip: [{text: "", color: "$(dim_color)"}, " ", {text: "", color: "$(dim_color)"}, " ", {text: "", color: "$(dim_color)"}]}
data modify entity @n[type=text_display, tag=tpa.text_display] text set from storage tpa:tpa loaded_lang.home_number
data modify storage tpa:tpa temp.args.dialog.actions[-1].label[0].text set from entity @n[type=text_display, tag=tpa.text_display] text
execute store result storage tpa:tpa temp.args.dialog.actions[-1].label[1].text int 1 run data get storage tpa:tpa temp.args.id
data modify storage tpa:tpa temp.args.dialog.actions[-1].label[1].text set string storage tpa:tpa temp.args.dialog.actions[-1].label[1].text
$execute store result storage tpa:tpa temp.args.dialog.actions[-1].tooltip[0].text int 1 run data get storage tpa:tpa temp.home.$(id).x
data modify storage tpa:tpa temp.args.dialog.actions[-1].tooltip[0].text set string storage tpa:tpa temp.args.dialog.actions[-1].tooltip[0].text
$execute store result storage tpa:tpa temp.args.dialog.actions[-1].tooltip[2].text int 1 run data get storage tpa:tpa temp.home.$(id).y
data modify storage tpa:tpa temp.args.dialog.actions[-1].tooltip[2].text set string storage tpa:tpa temp.args.dialog.actions[-1].tooltip[2].text
$execute store result storage tpa:tpa temp.args.dialog.actions[-1].tooltip[4].text int 1 run data get storage tpa:tpa temp.home.$(id).z
data modify storage tpa:tpa temp.args.dialog.actions[-1].tooltip[4].text set string storage tpa:tpa temp.args.dialog.actions[-1].tooltip[4].text

# Home Teleport Button
data modify storage tpa:tpa temp.args.dialog.actions append value {width: 100, action: {type: "minecraft:run_command", command: ""}, label: {text: "", color: "aqua"}, tooltip: {text: ""}}
data modify entity @n[type=text_display, tag=tpa.text_display] text set string storage tpa:tpa loaded_lang.home_display_tp_button 1 -1
data modify storage tpa:tpa temp.args.dialog.actions[-1].label.text set from entity @n[type=text_display, tag=tpa.text_display] text
$data modify storage tpa:tpa temp.args.dialog.actions[-1].action.command set value "trigger tpa.home set $(id)"
data modify storage tpa:tpa temp.args.dialog.actions[-1].tooltip.text set from storage tpa:tpa loaded_lang.home_display_tp_button_hoverevent

# Home Remove Button
data modify storage tpa:tpa temp.args.dialog.actions append value {width: 100, action: {type: "minecraft:run_command", command: ""}, label: {text: "", color: "red"}, tooltip: {text: ""}}
data modify entity @n[type=text_display, tag=tpa.text_display] text set string storage tpa:tpa loaded_lang.home_display_rm_button 1 -1
data modify storage tpa:tpa temp.args.dialog.actions[-1].label.text set from entity @n[type=text_display, tag=tpa.text_display] text
$data modify storage tpa:tpa temp.args.dialog.actions[-1].action.command set value "trigger tpa.removehome set $(id)"
data modify storage tpa:tpa temp.args.dialog.actions[-1].tooltip.text set from storage tpa:tpa loaded_lang.home_display_rm_button_hoverevent

# Home Set Button
data modify storage tpa:tpa temp.args.dialog.actions append value {width: 100, action: {type: "minecraft:run_command", command: ""}, label: {text: "", color: "green"}, tooltip: {text: ""}}
data modify entity @n[type=text_display, tag=tpa.text_display] text set string storage tpa:tpa loaded_lang.home_display_set_button 1 -1
data modify storage tpa:tpa temp.args.dialog.actions[-1].label.text set from entity @n[type=text_display, tag=tpa.text_display] text
$data modify storage tpa:tpa temp.args.dialog.actions[-1].action.command set value "trigger tpa.sethome set $(id)"
data modify storage tpa:tpa temp.args.dialog.actions[-1].tooltip.text set from storage tpa:tpa loaded_lang.home_display_set_button_hoverevent
