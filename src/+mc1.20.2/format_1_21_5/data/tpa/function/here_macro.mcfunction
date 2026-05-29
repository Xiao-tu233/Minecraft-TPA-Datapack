# @macro parameter: {id: int, x: int, y: int, z: int, name: string(char[]), n: char, dimension: string, color: str, trans_color: str}

$execute unless score #player_available tpa.variables matches 1 run tellraw @a[predicate=tpa:output/show_chatbar] [\
    {storage: "tpa:tpa", nbt: "loaded_lang.header"}, \
    {selector: "@s"}, \
    " §r@§r ", \
    {storage: "tpa:tpa", nbt: "temp.args.x", color: "$(color)"}, " ", \
    {storage: "tpa:tpa", nbt: "temp.args.y", color: "$(color)"}, " ", \
    {storage: "tpa:tpa", nbt: "temp.args.z", color: "$(color)"}, \
    {storage: "tpa:tpa", nbt: "temp.args.if_trans"}, \
    {storage: "tpa:tpa", nbt: "temp.args.x_trans", color: "$(trans_color)"}, {storage: "tpa:tpa", nbt: "temp.args.space_trans"}, \
    {storage: "tpa:tpa", nbt: "temp.args.y_trans", color: "$(trans_color)"}, {storage: "tpa:tpa", nbt: "temp.args.space_trans"}, \
    {storage: "tpa:tpa", nbt: "temp.args.z_trans", color: "$(trans_color)"}, " ", \
    {storage: "tpa:tpa", nbt: "loaded_lang.here_button_tpa", color: "gray", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.here_button_tpa_notavail_hoverevent"}}}, " ", \
    {text: "[§b+V§r]", click_event:{action:"run_command",command: "/newWaypoint x:$(x), y:$(y), z:$(z), dim:$(dimension)"}, hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.here_voxel_hoverevent"}}}, " ", \
    {text: "[§6+X§r]", click_event:{action:"suggest_command",command: "xaero_waypoint_add:$(name):$(n):$(x):$(y):$(z):6:false:0:Internal_$(dimension)_waypoints"}, hover_event: {action: "show_text", value:{storage: "tpa:tpa", nbt: "loaded_lang.here_xaero_hoverevent"}}}, " " \
]

$execute if score #player_available tpa.variables matches 1 run tellraw @a[predicate=tpa:output/show_chatbar] [\
    {storage: "tpa:tpa", nbt: "loaded_lang.header"}, \
    {selector: "@s"}, \
    " §r@§r ", \
    {storage: "tpa:tpa", nbt: "temp.args.x", color: "$(color)"}, " ", \
    {storage: "tpa:tpa", nbt: "temp.args.y", color: "$(color)"}, " ", \
    {storage: "tpa:tpa", nbt: "temp.args.z", color: "$(color)"}, \
    {storage: "tpa:tpa", nbt: "temp.args.if_trans"}, \
    {storage: "tpa:tpa", nbt: "temp.args.x_trans", color: "$(trans_color)"}, {storage: "tpa:tpa", nbt: "temp.args.space_trans"}, \
    {storage: "tpa:tpa", nbt: "temp.args.y_trans", color: "$(trans_color)"}, {storage: "tpa:tpa", nbt: "temp.args.space_trans"}, \
    {storage: "tpa:tpa", nbt: "temp.args.z_trans", color: "$(trans_color)"}, " ", \
    {storage: "tpa:tpa", nbt: "loaded_lang.here_button_tpa", click_event:{action:"run_command",command: "/trigger tpa.tpa set $(id)"}, hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.here_button_tpa_hoverevent"}}}, " ", \
    {text: "[§b+V§r]", click_event:{action:"run_command",command: "/newWaypoint x:$(x), y:$(y), z:$(z), dim:$(dimension)"}, hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.here_voxel_hoverevent"}}}, " ", \
    {text: "[§6+X§r]", click_event:{action:"suggest_command",command: "xaero_waypoint_add:$(name):$(n):$(x):$(y):$(z):6:false:0:Internal_$(dimension)_waypoints"}, hover_event: {action: "show_text", value:{storage: "tpa:tpa", nbt: "loaded_lang.here_xaero_hoverevent"}}}, " " \
]

# $execute if score #dim_num tpa.variables matches -1 run tellraw @a[predicate=tpa:output/show_chatbar] [\
#     {storage: "tpa:tpa", nbt: "loaded_lang.header"}, \
#     {selector: "@s"}, \
#     " §r@§r ", \
#     {storage: "tpa:tpa", nbt: "temp.args.x", color: "red"}, " ", \
#     {storage: "tpa:tpa", nbt: "temp.args.y", color: "red"}, " ", \
#     {storage: "tpa:tpa", nbt: "temp.args.z", color: "red"}, \
#     {storage: "tpa:tpa", nbt: "temp.args.if_trans"}, \
#     {storage: "tpa:tpa", nbt: "temp.args.x_trans", color: "green"}, " ", \
#     {storage: "tpa:tpa", nbt: "temp.args.y_trans", color: "green"}, " ", \
#     {storage: "tpa:tpa", nbt: "temp.args.z_trans", color: "green"}, " ", \
#     {storage: "tpa:tpa", nbt: "loaded_lang.here_button_tpa", click_event:{action:"run_command",command: "/trigger tpa.tpa set $(id)"}, hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.here_button_tpa_hoverevent"}}}, " ", \
#     {text: "[§b+V§r]", click_event:{action:"run_command",command: "/newWaypoint x:$(x), y:$(y), z:$(z), dim:$(dimension)"}, hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.here_voxel_hoverevent"}}}, " ", \
#     {text: "[§6+X§r]", click_event:{action:"suggest_command",command: "xaero_waypoint_add:$(name):$(n):$(x):$(y):$(z):6:false:0:Internal_$(dimension)_waypoints"}, hover_event: {action: "show_text", value:{storage: "tpa:tpa", nbt: "loaded_lang.here_xaero_hoverevent"}}}, " " \
# ]

# $execute if score #dim_num tpa.variables matches 1 run tellraw @a[predicate=tpa:output/show_chatbar] [\
#     {storage: "tpa:tpa", nbt: "loaded_lang.header"}, \
#     {selector: "@s"}, \
#     " §r@§r ", \
#     {storage: "tpa:tpa", nbt: "temp.args.x", color: "light_purple"}, " ", \
#     {storage: "tpa:tpa", nbt: "temp.args.y", color: "light_purple"}, " ", \
#     {storage: "tpa:tpa", nbt: "temp.args.z", color: "light_purple"}, " ", \
#     {storage: "tpa:tpa", nbt: "loaded_lang.here_button_tpa", click_event:{action:"run_command",command: "/trigger tpa.tpa set $(id)"}, hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.here_button_tpa_hoverevent"}}}, " ", \
#     {text: "[§b+V§r]", click_event:{action:"run_command",command: "/newWaypoint x:$(x), y:$(y), z:$(z), dim:$(dimension)"}, hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.here_voxel_hoverevent"}}}, " ", \
#     {text: "[§6+X§r]", click_event:{action:"suggest_command",command: "xaero_waypoint_add:$(name):$(n):$(x):$(y):$(z):6:false:0:Internal_$(dimension)_waypoints"}, hover_event: {action: "show_text", value:{storage: "tpa:tpa", nbt: "loaded_lang.here_xaero_hoverevent"}}}, " " \
# ]