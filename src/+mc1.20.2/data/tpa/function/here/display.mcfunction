# @macro parameter: {id: int, x: int, y: int, z: int, name: string(char[]), n: char, dimension: string, color: str, trans_color: str, \
                     x_trans: int|str[Literal['']], y_trans: int|str[Literal['']], z_trans: int|str[Literal['']], \
                     request_teleport_button_tooltip: str, request_teleport_button_action_leftpart: str, request_teleport_button_action_arg: int|str[Literal[""]], request_teleport_button_action_rightpart: str}

#! For 1.20.2-1.21.5:
#    Don't forget also change text component syntaxes in function tpa:here/available and tpa:here/unavailable

$tellraw @a[predicate=tpa:output/show_chatbar] [\
    {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.header"}, \
    {selector: "@s"}, \
    " §r@§r ", \
    {text: "", hover_event: { \
        action: "show_text", \
        value: [{text: "", color: "$(color)", extra: [{interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.here_dim_postion_hoverevent[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.args.dimension_before_trans"}, {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.here_dim_postion_hoverevent[1]"}]}, {text: "", color: "gray", extra: [" (", {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.here_postion_hoverevent"}, ")"]}] \
    }, extra: [ \
        {interpret: true, storage: "tpa:tpa", nbt: "temp.args.x", color: "$(color)"}, " ", \
        {interpret: true, storage: "tpa:tpa", nbt: "temp.args.y", color: "$(color)"}, " ", \
        {interpret: true, storage: "tpa:tpa", nbt: "temp.args.z", color: "$(color)"} \
    ], click_event: {\
        action: "copy_to_clipboard", \
        value: "$(x) $(y) $(z)" \
    }}, \
    {interpret: true, storage: "tpa:tpa", nbt: "temp.args.if_trans"}, \
    {text: "", hover_event: { \
        action: "show_text", \
        value: [{text: "", color: "$(trans_color)", extra: [{interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.here_dim_postion_hoverevent[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.args.dimension_after_trans"}, {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.here_dim_postion_hoverevent[1]"}]}, {text: "", color: "gray", extra: [" (", {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.here_postion_hoverevent"}, ")"]}] \
    }, extra: [ \
        {interpret: true, storage: "tpa:tpa", nbt: "temp.args.x_trans", color: "$(trans_color)"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.args.space_trans"}, \
        {interpret: true, storage: "tpa:tpa", nbt: "temp.args.y_trans", color: "$(trans_color)"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.args.space_trans"}, \
        {interpret: true, storage: "tpa:tpa", nbt: "temp.args.z_trans", color: "$(trans_color)"}, " " \
    ], click_event: {\
        action: "copy_to_clipboard", \
        value: "$(x_trans) $(y_trans) $(z_trans)" \
    }}, \
    {interpret: true, storage: "tpa:tpa", nbt: "temp.args.request_teleport_button_brackets[0]", extra: [{interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.here_button_tpa"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.args.request_teleport_button_brackets[1]"}], $(request_teleport_button_action_leftpart)$(request_teleport_button_action_arg)$(request_teleport_button_action_rightpart)hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.$(request_teleport_button_tooltip)"}}}, " ", \
    {text: "[§b+V§r]", click_event:{action:"run_command",command: "/newWaypoint x:$(x), y:$(y), z:$(z), dim:$(dimension)"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.here_voxel_hoverevent"}}}, " ", \
    {text: "[§6+X§r]", click_event:{action:"suggest_command",command: "xaero_waypoint_add:$(name):$(n):$(x):$(y):$(z):6:false:0:Internal_$(dimension)_waypoints"}, hover_event: {action: "show_text", value:{interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.here_xaero_hoverevent"}}}, " " \
]