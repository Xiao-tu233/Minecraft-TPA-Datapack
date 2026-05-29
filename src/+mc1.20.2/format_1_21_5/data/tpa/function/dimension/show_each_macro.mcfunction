# Parent function: tpa:dimension/show_each
# @macro: {index: int, color: str}

execute store result score #current_dimension tpa.variables run data get storage tpa:tpa temp.option.dimension[0].id

$execute unless score #current_dimension tpa.variables matches -1..1 run tellraw @s ["  ", \
    {\
        storage: "tpa:tpa", \
        nbt: "temp.option.dimension[0].name", \
        color: "$(color)", \
        hover_event: {\
            action: "show_text", \
            value: {\
                storage: "tpa:tpa", \
                nbt: "temp.option.dimension[0].namespaceid" \
            } \
        } \
    }, "(", \
    {storage: "tpa:tpa", nbt: "temp.option.dimension[0].id", color: "$(color)"}, ") ", \
    {\
        storage: "tpa:tpa", \
        nbt: "loaded_lang.option_dimension_button_edit_id", \
        hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.option_dimension_button_edit_id_hoverevent"}}, \
        click_event: {\
            action: "suggest_command", \
            command: "/function tpa:dimension/edit_id {index: $(index), id: }" \
        } \
    }, " ", \
    {\
        storage: "tpa:tpa", \
        nbt: "loaded_lang.option_dimension_button_edit_name", \
        hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.option_dimension_button_edit_name_hoverevent"}}, \
        click_event: {\
            action: "suggest_command", \
            command: "/function tpa:dimension/edit_name {index: $(index), name: \"\"}" \
        } \
    }, " ", \
    {\
        storage: "tpa:tpa", \
        nbt: "loaded_lang.option_dimension_button_edit_color", \
        hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.option_dimension_button_edit_color_hoverevent"}}, \
        click_event: {\
            action: "suggest_command", \
            command: "/function tpa:dimension/edit_color {index: $(index), color: \"\"}" \
        } \
    }, " ", \
    {\
        storage: "tpa:tpa", \
        nbt: "loaded_lang.option_dimension_button_edit_namespaceid", \
        hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.option_dimension_button_edit_namespaceid_hoverevent"}}, \
        click_event: {\
            action: "suggest_command", \
            command: "/function tpa:dimension/edit_namespaceid {index: $(index), namespaceid: \"\"}" \
        } \
    }, " ", \
    {\
        storage: "tpa:tpa", \
        nbt: "loaded_lang.option_dimension_button_remove", \
        hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.option_dimension_button_remove_hoverevent"}}, \
        click_event: {\
            action: "run_command", \
            command: "/function tpa:dimension/remove {index: $(index)}" \
        } \
    } \
]

$execute if score #current_dimension tpa.variables matches -1..1 run tellraw @s ["  ", \
    {\
        storage: "tpa:tpa", \
        nbt: "temp.option.dimension[0].name", \
        color: "$(color)", \
        hover_event: {\
            action: "show_text", \
            value: {\
                storage: "tpa:tpa", \
                nbt: "temp.option.dimension[0].namespaceid" \
            } \
        } \
    }, "(", \
    {storage: "tpa:tpa", nbt: "temp.option.dimension[0].id", color: "$(color)"}, ") ", \
    {\
        storage: "tpa:tpa", \
        nbt: "loaded_lang.option_dimension_button_edit_id", \
        hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.option_dimension_button_edit_id_hoverevent"}}, \
        click_event: {\
            action: "suggest_command", \
            command: "/function tpa:dimension/edit_id {index: $(index), id: }" \
        } \
    }, " ", \
    {\
        storage: "tpa:tpa", \
        nbt: "loaded_lang.option_dimension_button_edit_name", \
        hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.option_dimension_button_edit_name_hoverevent"}}, \
        click_event: {\
            action: "suggest_command", \
            command: "/function tpa:dimension/edit_name {index: $(index), name: \"\"}" \
        } \
    }, " ", \
    {\
        storage: "tpa:tpa", \
        nbt: "loaded_lang.option_dimension_button_edit_color", \
        hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.option_dimension_button_edit_color_hoverevent"}}, \
        click_event: {\
            action: "suggest_command", \
            command: "/function tpa:dimension/edit_color {index: $(index), color: \"\"}" \
        } \
    }, " ", \
    {\
        storage: "tpa:tpa", \
        nbt: "loaded_lang.option_dimension_button_edit_namespaceid", \
        hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.option_dimension_button_edit_namespaceid_hoverevent"}}, \
        click_event: {\
            action: "suggest_command", \
            command: "/function tpa:dimension/edit_namespaceid {index: $(index), namespaceid: \"\"}" \
        } \
    }, " ", \
    {\
        color: "gray", \
        storage: "tpa:tpa", \
        nbt: "loaded_lang.option_dimension_button_remove", \
        hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.option_dimension_button_remove_notavail_hoverevent"}} \
    } \
]