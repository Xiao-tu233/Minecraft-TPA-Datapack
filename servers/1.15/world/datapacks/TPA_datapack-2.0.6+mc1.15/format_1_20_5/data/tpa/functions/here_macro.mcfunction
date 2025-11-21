# @macro parameter: {id: int, x: int, y: int, z: int, name: string(char[]), n: char, dimension: string}

$execute if score #dim_num tpa.variables matches 0 run tellraw @a[scores={tpa.output=1..2}] [\
    {"storage": "tpa:tpa", "nbt": "temp.lang.header"}, \
    {"selector": "@s"}, \
    " §r@§r ", \
    {"storage": "tpa:tpa", "nbt": "temp.args.x", "color": "green"}, " ", \
    {"storage": "tpa:tpa", "nbt": "temp.args.y", "color": "green"}, " ", \
    {"storage": "tpa:tpa", "nbt": "temp.args.z", "color": "green"}, \
    {"storage": "tpa:tpa", "nbt": "temp.args.if_trans"}, \
    {"storage": "tpa:tpa", "nbt": "temp.args.x_trans", "color": "red"}, " ", \
    {"storage": "tpa:tpa", "nbt": "temp.args.y_trans", "color": "red"}, " ", \
    {"storage": "tpa:tpa", "nbt": "temp.args.z_trans", "color": "red"}, " ", \
    {"storage": "tpa:tpa", "nbt": "temp.lang.here_button_tpa", "clickEvent": {"action": "run_command", "value": "/trigger tpa.tpa set $(id)"}, "hoverEvent": {"action": "show_text", "value": {"storage": "tpa:tpa", "nbt": "temp.lang.here_button_tpa_hoverevent"}}}, " ", \
    {"text": "[§b+V§r]", "clickEvent": {"action": "run_command", "value": "/newWaypoint x:$(x), y:$(y), z:$(z), dim:$(dimension)"}, "hoverEvent": {"action": "show_text", "value": {"storage": "tpa:tpa", "nbt": "temp.lang.here_voxel_hoverevent"}}}, " ", \
    {"text": "[§6+X§r]", "clickEvent": {"action": "suggest_command", "value": "xaero_waypoint_add:$(name):$(n):$(x):$(y):$(z):6:false:0:Internal_$(dimension)_waypoints"}, "hoverEvent": {"action": "show_text", "value":{"storage": "tpa:tpa", "nbt": "temp.lang.here_xaero_hoverevent"}}}, " " \
]

$execute if score #dim_num tpa.variables matches -1 run tellraw @a[scores={tpa.output=1..2}] [\
    {"storage": "tpa:tpa", "nbt": "temp.lang.header"}, \
    {"selector": "@s"}, \
    " §r@§r ", \
    {"storage": "tpa:tpa", "nbt": "temp.args.x", "color": "red"}, " ", \
    {"storage": "tpa:tpa", "nbt": "temp.args.y", "color": "red"}, " ", \
    {"storage": "tpa:tpa", "nbt": "temp.args.z", "color": "red"}, \
    {"storage": "tpa:tpa", "nbt": "temp.args.if_trans"}, \
    {"storage": "tpa:tpa", "nbt": "temp.args.x_trans", "color": "green"}, " ", \
    {"storage": "tpa:tpa", "nbt": "temp.args.y_trans", "color": "green"}, " ", \
    {"storage": "tpa:tpa", "nbt": "temp.args.z_trans", "color": "green"}, " ", \
    {"storage": "tpa:tpa", "nbt": "temp.lang.here_button_tpa", "clickEvent": {"action": "run_command", "value": "/trigger tpa.tpa set $(id)"}, "hoverEvent": {"action": "show_text", "value": {"storage": "tpa:tpa", "nbt": "temp.lang.here_button_tpa_hoverevent"}}}, " ", \
    {"text": "[§b+V§r]", "clickEvent": {"action": "run_command", "value": "/newWaypoint x:$(x), y:$(y), z:$(z), dim:$(dimension)"}, "hoverEvent": {"action": "show_text", "value": {"storage": "tpa:tpa", "nbt": "temp.lang.here_voxel_hoverevent"}}}, " ", \
    {"text": "[§6+X§r]", "clickEvent": {"action": "suggest_command", "value": "xaero_waypoint_add:$(name):$(n):$(x):$(y):$(z):6:false:0:Internal_$(dimension)_waypoints"}, "hoverEvent": {"action": "show_text", "value":{"storage": "tpa:tpa", "nbt": "temp.lang.here_xaero_hoverevent"}}}, " " \
]

$execute if score #dim_num tpa.variables matches 1 run tellraw @a[scores={tpa.output=1..2}] [\
    {"storage": "tpa:tpa", "nbt": "temp.lang.header"}, \
    {"selector": "@s"}, \
    " §r@§r ", \
    {"storage": "tpa:tpa", "nbt": "temp.args.x", "color": "red"}, " ", \
    {"storage": "tpa:tpa", "nbt": "temp.args.y", "color": "red"}, " ", \
    {"storage": "tpa:tpa", "nbt": "temp.args.z", "color": "red"}, " ", \
    {"storage": "tpa:tpa", "nbt": "temp.lang.here_button_tpa", "clickEvent": {"action": "run_command", "value": "/trigger tpa.tpa set $(id)"}, "hoverEvent": {"action": "show_text", "value": {"storage": "tpa:tpa", "nbt": "temp.lang.here_button_tpa_hoverevent"}}}, " ", \
    {"text": "[§b+V§r]", "clickEvent": {"action": "run_command", "value": "/newWaypoint x:$(x), y:$(y), z:$(z), dim:$(dimension)"}, "hoverEvent": {"action": "show_text", "value": {"storage": "tpa:tpa", "nbt": "temp.lang.here_voxel_hoverevent"}}}, " ", \
    {"text": "[§6+X§r]", "clickEvent": {"action": "suggest_command", "value": "xaero_waypoint_add:$(name):$(n):$(x):$(y):$(z):6:false:0:Internal_$(dimension)_waypoints"}, "hoverEvent": {"action": "show_text", "value":{"storage": "tpa:tpa", "nbt": "temp.lang.here_xaero_hoverevent"}}}, " " \
]