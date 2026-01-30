# Parent function: tpa:dialog
# @macro_param: {...(Components, see parent)}

$dialog show @s {\
    type: "minecraft:multi_action", \
    pause: false, \
    after_action: "close", \
    title: "$(title)", \
    columns: 5, \
    body: {\
        type: "minecraft:plain_message", \
        contents: [\
            "", \
            {\
                text: "$(you)", \
                color: "gold", \
                hover_event: {\
                    action: "show_text", \
                    value: "$(you_hover)"\
                }\
        }, \
        {\
                text: "$(has_id_of)", \
                hover_event: {\
                    action: "show_text", \
                    value: "$(has_id_of_hover)"\
                }\
        }, \
        {\
                color: "aqua", \
                text: "$(id)"\
            }\
        ]\
    }, \
    actions: [\
        {\
            label: "$(name_0)", \
            tooltip: "$(hover_left)$(name_0)$(hover_right)", \
            width: 100, \
            action: \
            {type: "minecraft:run_command", command: "trigger tpa.$(direction) set $(id_0)"} \
        }, \
        {\
            label: "$(name_1)", \
            tooltip: "$(hover_left)$(name_1)$(hover_right)", \
            width: 100, \
            action: \
            {type: "minecraft:run_command", command: "trigger tpa.$(direction) set $(id_1)"} \
        }, \
        {\
            label: "$(name_2)", \
            tooltip: "$(hover_left)$(name_2)$(hover_right)", \
            width: 100, \
            action: \
            {type: "minecraft:run_command", command: "trigger tpa.$(direction) set $(id_2)"} \
        }, \
        {\
            label: "$(name_3)", \
            tooltip: "$(hover_left)$(name_3)$(hover_right)", \
            width: 100, \
            action: \
            {type: "minecraft:run_command", command: "trigger tpa.$(direction) set $(id_3)"} \
        }, \
        {\
            label: "$(name_4)", \
            tooltip: "$(hover_left)$(name_4)$(hover_right)", \
            width: 100, \
            action: \
            {type: "minecraft:run_command", command: "trigger tpa.$(direction) set $(id_4)"} \
        }, \
        {\
            label: "$(name_5)", \
            tooltip: "$(hover_left)$(name_5)$(hover_right)", \
            width: 100, \
            action: \
            {type: "minecraft:run_command", command: "trigger tpa.$(direction) set $(id_5)"} \
        }, \
        {\
            label: "$(name_6)", \
            tooltip: "$(hover_left)$(name_6)$(hover_right)", \
            width: 100, \
            action: \
            {type: "minecraft:run_command", command: "trigger tpa.$(direction) set $(id_6)"} \
        }, \
        {\
            label: "$(name_7)", \
            tooltip: "$(hover_left)$(name_7)$(hover_right)", \
            width: 100, \
            action: \
            {type: "minecraft:run_command", command: "trigger tpa.$(direction) set $(id_7)"} \
        }, \
        {\
            label: "$(name_8)", \
            tooltip: "$(hover_left)$(name_8)$(hover_right)", \
            width: 100, \
            action: \
            {type: "minecraft:run_command", command: "trigger tpa.$(direction) set $(id_8)"} \
        }, \
        {\
            label: "$(name_9)", \
            tooltip: "$(hover_left)$(name_9)$(hover_right)", \
            width: 100, \
            action: \
            {type: "minecraft:run_command", command: "trigger tpa.$(direction) set $(id_9)"} \
        }, \
        {\
            label: "$(name_10)", \
            tooltip: "$(hover_left)$(name_10)$(hover_right)", \
            width: 100, \
            action: \
            {type: "minecraft:run_command", command: "trigger tpa.$(direction) set $(id_10)"} \
        }, \
        {\
            label: "$(name_11)", \
            tooltip: "$(hover_left)$(name_11)$(hover_right)", \
            width: 100, \
            action: \
            {type: "minecraft:run_command", command: "trigger tpa.$(direction) set $(id_11)"} \
        }, \
        {\
            label: "$(name_12)", \
            tooltip: "$(hover_left)$(name_12)$(hover_right)", \
            width: 100, \
            action: \
            {type: "minecraft:run_command", command: "trigger tpa.$(direction) set $(id_12)"} \
        }, \
        {\
            label: "$(name_13)", \
            tooltip: "$(hover_left)$(name_13)$(hover_right)", \
            width: 100, \
            action: \
            {type: "minecraft:run_command", command: "trigger tpa.$(direction) set $(id_13)"} \
        }, \
        {\
            label: "$(name_14)", \
            tooltip: "$(hover_left)$(name_14)$(hover_right)", \
            width: 100, \
            action: \
            {type: "minecraft:run_command", command: "trigger tpa.$(direction) set $(id_14)"} \
        }, \
        {\
            label: "$(name_15)", \
            tooltip: "$(hover_left)$(name_15)$(hover_right)", \
            width: 100, \
            action: \
            {type: "minecraft:run_command", command: "trigger tpa.$(direction) set $(id_15)"} \
        }, \
        {\
            label: "$(name_16)", \
            tooltip: "$(hover_left)$(name_16)$(hover_right)", \
            width: 100, \
            action: \
            {type: "minecraft:run_command", command: "trigger tpa.$(direction) set $(id_16)"} \
        }, \
        {\
            label: "$(name_17)", \
            tooltip: "$(hover_left)$(name_17)$(hover_right)", \
            width: 100, \
            action: \
            {type: "minecraft:run_command", command: "trigger tpa.$(direction) set $(id_17)"} \
        }, \
        {\
            label: "$(name_18)", \
            tooltip: "$(hover_left)$(name_18)$(hover_right)", \
            width: 100, \
            action: \
            {type: "minecraft:run_command", command: "trigger tpa.$(direction) set $(id_18)"} \
        }, \
        {\
            label: "$(name_19)", \
            tooltip: "$(hover_left)$(name_19)$(hover_right)", \
            width: 100, \
            action: \
            {type: "minecraft:run_command", command: "trigger tpa.$(direction) set $(id_19)"} \
        }, \
        {\
            label: "§8================", \
            width: 100\
        }, \
        {\
            label: "§8================", \
            width: 100\
        }, \
        {\
            label: "§8================", \
            width: 100\
        }, \
        {\
            label: "§8================", \
            width: 100\
        }, \
        {\
            label: "§8================", \
            width: 100\
        }, \
        {\
            label: "$(idfix)", \
            tooltip: "$(idfix_hover)", \
            width: 100, \
            action: \
            {type: "minecraft:run_command", "command": "trigger tpa.idfix"} \
        }, \
        {\
            label: "$(search_id)", \
            tooltip: "$(search_id_hover)", \
            width: 100, \
            action: \
            {type: "minecraft:run_command", "command": "trigger tpa.search_id"} \
        }, \
        {\
            label: "$(back)", \
            tooltip: "$(back_hover)", \
            width: 100, \
            action: \
            {type: "minecraft:run_command", "command": "trigger tpa.back"} \
        }, \
        {\
            label: "$(menu_switch)", \
            tooltip: "$(menu_switch_hover)", \
            width: 100, \
            action: \
            {type: "minecraft:run_command", "command": "trigger tpa.dialog set $(menu_switch_value)"} \
        }, \
        {\
            label: "$(lang)", \
            tooltip: "$(lang_hover)", \
            width: 100, \
            action: \
            {type: "minecraft:run_command", "command": "trigger tpa.language set -1"} \
        }, \
        {\
            label: "$(book)", \
            tooltip: "$(book_hover)", \
            width: 100, \
            action: \
            {type: "minecraft:run_command", "command": "trigger tpa.book"} \
        }, \
        {\
            label: "$(pos)", \
            tooltip: "$(pos_hover)", \
            action: \
            {type: "minecraft:run_command", "command": "trigger tpa.pos"}, \
            width: 100 \
        }, \
        {\
            label: "$(here)", \
            tooltip: "$(here_hover)", \
            action: \
            {type: "minecraft:run_command", "command": "trigger tpa.here"}, \
            width: 100 \
        }, \
        {\
            label: "$(home)", \
            tooltip: "$(home_hover)", \
            action: \
            {type: "minecraft:run_command", "command": "trigger tpa.home set -1"}, \
            width: 100 \
        }, \
        {\
            label: "$(warp)", \
            tooltip: "$(warp_hover)", \
            action: \
            {type: "minecraft:run_command", "command": "trigger tpa.warp set -1"}, \
            width: 100 \
        }, \
        {\
            label: "$(auto_accept)$(auto_accept_value)", \
            tooltip: "$(switch_hover)", \
            action: \
            {type: "minecraft:run_command", "command": "trigger tpa.tpaccpet_toggle add 4"}, \
            width: 100 \
        }, \
        {\
            label: "$(mute)$(mute_value)", \
            tooltip: "$(switch_hover)", \
            action: \
            {type: "minecraft:run_command", "command": "trigger tpa.mute add 4"}, \
            width: 100 \
        }, \
        {\
            label: "$(output)$(output_value)", \
            tooltip: "$(switch_hover)", \
            action: \
            {type: "minecraft:run_command", "command": "trigger tpa.output add 6"}, \
            width: 100 \
        }\
    ]\
}