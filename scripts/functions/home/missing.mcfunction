# Parent function: tpa:each_home
$tellraw @s[predicate=tpa:output/show_chatbar] [\
    "  ", \
    {storage: "tpa:tpa", nbt: "loaded_lang.home_number", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.home_missing_hoverevent"}}}, \
    {storage: "tpa:tpa", nbt: "temp.args.id"}, \
    " ", \
    {\
        storage: "tpa:tpa", \
        nbt: "loaded_lang.home_create_button", \
        hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.home_create_button_hoverevent"}}, \
        click_event: {action: "run_command", command: "/trigger tpa.sethome set $(id)"}\
    }\
]

# Home Info Display
data modify storage tpa:tpa temp.args.dialog.actions append value {width: 100, label: [{text: "", color: "white"}, {text: "", color: "white"}], tooltip: {text: ""}}

data modify entity @n[type=text_display, tag=tpa.text_display] text set from storage tpa:tpa loaded_lang.home_number
data modify storage tpa:tpa temp.args.dialog.actions[-1].label[0].text set from entity @n[type=text_display, tag=tpa.text_display] text

execute store result storage tpa:tpa temp.args.dialog.actions[-1].label[1].text int 1 run data get storage tpa:tpa temp.args.id
data modify storage tpa:tpa temp.args.dialog.actions[-1].label[1].text set string storage tpa:tpa temp.args.dialog.actions[-1].label[1].text

data modify entity @n[type=text_display, tag=tpa.text_display] text set from storage tpa:tpa loaded_lang.home_missing_hoverevent
data modify storage tpa:tpa temp.args.dialog.actions[-1].tooltip.text set from entity @n[type=text_display, tag=tpa.text_display] text

# Home Create Button
data modify storage tpa:tpa temp.args.dialog.actions append value {width: 100, action: {type: "minecraft:run_command", command: ""}, label: {text: "", color: "green"}, tooltip: {text: ""}}
data modify entity @n[type=text_display, tag=tpa.text_display] text set string storage tpa:tpa loaded_lang.home_create_button 1 -1
data modify storage tpa:tpa temp.args.dialog.actions[-1].label.text set from entity @n[type=text_display, tag=tpa.text_display] text
data modify entity @n[type=text_display, tag=tpa.text_display] text set from storage tpa:tpa loaded_lang.home_create_button_hoverevent
data modify storage tpa:tpa temp.args.dialog.actions[-1].tooltip.text set from entity @n[type=text_display, tag=tpa.text_display] text
$data modify storage tpa:tpa temp.args.dialog.actions[-1].action.command set value "trigger tpa.sethome set $(id)"

# Place Holders
data modify storage tpa:tpa temp.args.dialog.actions append value {width: 100, label: " "}
data modify storage tpa:tpa temp.args.dialog.actions append value {width: 100, label: " "}