# Parent function: tpa:tp_pos/dialog
# @macro: {
#     x: Literal["$(x)"], y: Literal["$(y)"], z: Literal["$(z)"], 
#     cancel_tooltip: str, done_tooltip: str, 
#     set_x: str, set_x_tooltip: str, set_y: str, set_y_tooltip: str, set_z: str, set_z_tooltip: str, 
#     set: str,
#     x_initial: int, y_initial: int, z_initial: int
# }

$dialog show @s {\
    type: "minecraft:multi_action", \
    columns: 3,  \
    title: "",  \
    can_close_with_escape: true,  \
    exit_action: {\
        label: {translate: "gui.cancel"},  \
        tooltip: "$(cancel_tooltip)",  \
        action: {\
        type: "run_command",  \
            command: "/trigger tpa.pos set -1"\
        }\
    },  \
    inputs: [\
        {\
        type: "minecraft:text", \
            key: "x", \
            label: ["X: ($(set)", {"color": "aqua", "text":"$(x_initial)"}, ")"], \
            width: 200, \
            initial: "$(x_initial)"\
        }, \
        {\
        type: "minecraft:text", \
            key: "y", \
            label: ["Y: ($(set)", {"color": "aqua", "text":"$(y_initial)"}, ")"], \
            width: 200, \
            initial: "$(y_initial)"\
        }, \
        {\
        type: "minecraft:text", \
            key: "z", \
            label: ["Z: ($(set)", {"color": "aqua", "text":"$(z_initial)"}, ")"], \
            width: 200, \
            initial: "$(z_initial)"\
        }\
    ], \
    actions: [\
        {\
            label: "$(set_x)", \
            tooltip: "$(set_x_tooltip)", \
            action: {\
                type: "minecraft:dynamic/run_command", \
                template: "/trigger tpa.pos.x set $(x)"\
            }\
        }, \
        {\
            label: "$(set_y)", \
            tooltip: "$(set_y_tooltip)", \
            action: {\
                type: "minecraft:dynamic/run_command", \
                template: "/trigger tpa.pos.y set $(y)"\
            }\
        }, \
        {\
            label: "$(set_z)",  \
            tooltip: "$(set_z_tooltip)", \
            action: {\
                type: "minecraft:dynamic/run_command", \
                template: "/trigger tpa.pos.z set $(z)"\
            }\
        }, \
        {\
            label: {translate: "gui.done"}, \
            tooltip: "$(done_tooltip)", \
            action: {\
                type: "run_command", \
                command: "/trigger tpa.pos set -2"\
            }\
        }\
    ]\
}