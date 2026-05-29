# Parent Function: tpa:home/menu
$tellraw @s[predicate=tpa:output/show_chatbar] [\
        {\
            text:"  ", \
            hover_event: {action: "show_text", value: {storage:"tpa:tpa", nbt:"loaded_lang.home_create_button_hoverevent"}}, \
            click_event:{action:"run_command",command: "/trigger tpa.sethome set $(id)"}\
        }, \
        "[", \
        {storage: "tpa:tpa", nbt: "loaded_lang.home_new"}, \
        {storage: "tpa:tpa", nbt: "loaded_lang.home_number", color: "aqua"}, \
        {storage: "tpa:tpa", nbt: "temp.args.id", color: "aqua"}, \
        {storage: "tpa:tpa", nbt: "temp.home.slash"}, \
        {storage: "tpa:tpa", nbt: "temp.home.limit"}, \
        "§r]" \
    ]


# Home Info Display
data modify storage tpa:tpa temp.args.dialog.actions append value {width: 100, action: {type: "minecraft:run_command", command: ""}, label: [{text: "", color: "green"}, {text: "", color: "aqua"}, {text: "", color: "aqua"}, {text: "", color: "white"}, {text: "", color: "white"}], tooltip: {text: ""}}

data modify entity @n[type=text_display, tag=tpa.text_display] text set from storage tpa:tpa loaded_lang.home_new
data modify storage tpa:tpa temp.args.dialog.actions[-1].label[0].text set from entity @n[type=text_display, tag=tpa.text_display] text
data modify entity @n[type=text_display, tag=tpa.text_display] text set from storage tpa:tpa loaded_lang.home_number
data modify storage tpa:tpa temp.args.dialog.actions[-1].label[1].text set from entity @n[type=text_display, tag=tpa.text_display] text

execute store result storage tpa:tpa temp.args.dialog.actions[-1].label[2].text int 1 run data get storage tpa:tpa temp.args.id
data modify storage tpa:tpa temp.args.dialog.actions[-1].label[2].text set string storage tpa:tpa temp.args.dialog.actions[-1].label[2].text

data modify entity @n[type=text_display, tag=tpa.text_display] text set from storage tpa:tpa temp.home.slash
data modify storage tpa:tpa temp.args.dialog.actions[-1].label[3].text set from entity @n[type=text_display, tag=tpa.text_display] text

execute store result storage tpa:tpa temp.args.dialog.actions[-1].label[4].text int 1 run data get storage tpa:tpa temp.home.limit
data modify storage tpa:tpa temp.args.dialog.actions[-1].label[4].text set string storage tpa:tpa temp.args.dialog.actions[-1].label[4].text

data modify entity @n[type=text_display, tag=tpa.text_display] text set from storage tpa:tpa loaded_lang.home_create_button_hoverevent
data modify storage tpa:tpa temp.args.dialog.actions[-1].tooltip.text set from entity @n[type=text_display, tag=tpa.text_display] text
$data modify storage tpa:tpa temp.args.dialog.actions[-1].action.command set value "trigger tpa.sethome set $(id)"
