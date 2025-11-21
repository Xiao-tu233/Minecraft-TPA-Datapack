# Parent function: tpa:home/each_home
data remove storage tpa:tpa temp.string_map
data modify storage tpa:tpa temp.string_map set value {"overworld": 0b, "the_nether": -1b, "the_end": 1b}
data remove storage tpa:tpa temp.args.src
$data modify storage tpa:tpa temp.args.src set from storage tpa:tpa temp.home.$(id).dim
execute store result score #dim tpa.variables run function tpa:string_map with storage tpa:tpa temp.args

$execute if score #dim tpa.variables matches 1 run tellraw @s[scores={tpa.output=1..2}] [\
    "  ", \
    {\
        storage: "tpa:tpa", nbt: "temp.lang.home_number", color:"light_purple", \
        hover_event: {"action": "show_text", "value": [\
            {nbt: "temp.home.$(id).x", storage: "tpa:tpa",color:"light_purple"}, " ", \
            {nbt: "temp.home.$(id).y", storage: "tpa:tpa",color:"light_purple"}, " ", \
            {nbt: "temp.home.$(id).z", storage: "tpa:tpa",color:"light_purple"}\
        ]}\
    }, {storage: "tpa:tpa", nbt: "temp.args.id", color:"light_purple"}, " ", \
    {storage: "tpa:tpa", nbt: "temp.lang.home_display_tp_button", hover_event: {"action": "show_text","value": {storage: "tpa:tpa", nbt: "temp.lang.home_display_tp_button_hoverevent"}},click_event: {"action": "run_command","value": "/trigger tpa.home set $(id)"}}, " ", \
    {storage: "tpa:tpa", nbt: "temp.lang.home_display_rm_button", hover_event: {"action": "show_text", "value": {storage: "tpa:tpa", nbt: "temp.lang.home_display_rm_button_hoverevent"}},click_event: {"action": "run_command","value": "/trigger tpa.removehome set $(id)"}}, " ", \
    {storage: "tpa:tpa", nbt: "temp.lang.home_display_set_button", hover_event: {"action": "show_text","value": {storage: "tpa:tpa", nbt: "temp.lang.home_display_set_button_hoverevent"}},click_event: {"action": "run_command","value": "/trigger tpa.sethome set $(id)"}} \
]

$execute if score #dim tpa.variables matches 0 run tellraw @s[scores={tpa.output=1..2}] [\
    "  ", \
    {\
        storage: "tpa:tpa", nbt: "temp.lang.home_number", color:"green", \
        hover_event: {"action": "show_text", "value": [\
            {nbt: "temp.home.$(id).x", storage: "tpa:tpa",color:"green"}, " ", \
            {nbt: "temp.home.$(id).y", storage: "tpa:tpa",color:"green"}, " ", \
            {nbt: "temp.home.$(id).z", storage: "tpa:tpa",color:"green"}\
        ]}\
    }, {storage: "tpa:tpa", nbt: "temp.args.id", color:"green"}, " ", \
    {storage: "tpa:tpa", nbt: "temp.lang.home_display_tp_button", hover_event: {"action": "show_text","value": {storage: "tpa:tpa", nbt: "temp.lang.home_display_tp_button_hoverevent"}},click_event: {"action": "run_command","value": "/trigger tpa.home set $(id)"}}, " ", \
    {storage: "tpa:tpa", nbt: "temp.lang.home_display_rm_button", hover_event: {"action": "show_text", "value": {storage: "tpa:tpa", nbt: "temp.lang.home_display_rm_button_hoverevent"}},click_event: {"action": "run_command","value": "/trigger tpa.removehome set $(id)"}}, " ", \
    {storage: "tpa:tpa", nbt: "temp.lang.home_display_set_button", hover_event: {"action": "show_text","value": {storage: "tpa:tpa", nbt: "temp.lang.home_display_set_button_hoverevent"}},click_event: {"action": "run_command","value": "/trigger tpa.sethome set $(id)"}} \
]

$execute if score #dim tpa.variables matches -1 run tellraw @s[scores={tpa.output=1..2}] [\
    "  ", \
    {\
        storage: "tpa:tpa", nbt: "temp.lang.home_number", color:"red", \
        hover_event: {"action": "show_text", "value": [\
            {nbt: "temp.home.$(id).x", storage: "tpa:tpa",color:"red"}, " ", \
            {nbt: "temp.home.$(id).y", storage: "tpa:tpa",color:"red"}, " ", \
            {nbt: "temp.home.$(id).z", storage: "tpa:tpa",color:"red"}\
        ]}\
    }, {storage: "tpa:tpa", nbt: "temp.args.id", color:"red"}, " ", \
    {storage: "tpa:tpa", nbt: "temp.lang.home_display_tp_button", hover_event: {"action": "show_text","value": {storage: "tpa:tpa", nbt: "temp.lang.home_display_tp_button_hoverevent"}},click_event: {"action": "run_command","value": "/trigger tpa.home set $(id)"}}, " ", \
    {storage: "tpa:tpa", nbt: "temp.lang.home_display_rm_button", hover_event: {"action": "show_text", "value": {storage: "tpa:tpa", nbt: "temp.lang.home_display_rm_button_hoverevent"}},click_event: {"action": "run_command","value": "/trigger tpa.removehome set $(id)"}}, " ", \
    {storage: "tpa:tpa", nbt: "temp.lang.home_display_set_button", hover_event: {"action": "show_text","value": {storage: "tpa:tpa", nbt: "temp.lang.home_display_set_button_hoverevent"}},click_event: {"action": "run_command","value": "/trigger tpa.sethome set $(id)"}} \
]