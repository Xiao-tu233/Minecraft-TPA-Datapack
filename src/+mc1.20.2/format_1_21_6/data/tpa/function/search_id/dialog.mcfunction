# Parent function: tpa:search_id/call_keyboard
# @macro: {input: tuple(Array)[str, compound[Literal["text", "underlined"], str]], caps: str, cancel: str, cancel_tooltip: str, done: str, done_tooltip: str}
$dialog show @s {\
    type: "minecraft:multi_action", \
    columns: 13, \
    title: "", \
    can_close_with_escape: true, \
    after_action: "none", \
    pause: false, \
    exit_action: {\
        label: {translate: "gui.cancel"}, \
        tooltip: "$(cancel_tooltip)", \
        action: {\
            type: "run_command", \
            command: "/trigger tpa.search_id.key set -1"\
        }\
    }, \
    body: { \
        type: "minecraft:plain_message", \
        contents: $(input) \
    }, \
    actions: [\
        {\        
            label: {\                
                text: "ESC", \
                color: "aqua"\
            }, \
            tooltip: {\
                text: "Abort key inputs"\
            }, \
            action: {\
                type: "run_command", \
                command: "/trigger tpa.search_id.key set -1"\
            }, \
            width: 45\
        }, \
        {\
            label: {\
                text: "1", \
                color: "aqua"\
            }, \
            tooltip: {\
                text: "1"\
            }, \
            action: {\
                type: "run_command", \
                command: "/trigger tpa.search_id.key set 1"\
            }, \
            width: 30\
        }, \
        {\
            label: {\
                text: "2", \
                color: "aqua"\
            }, \
            tooltip: {\
                text: "2"\
            }, \
            action: {\
                type: "run_command", \
                command: "/trigger tpa.search_id.key set 2"\
            }, \
            width: 30\
        }, \
        {\
            label: {\
                text: "3", \
                color: "aqua"\
            }, \
            tooltip: {\
                text: "3"\
            }, \
            action: {\
                type: "run_command", \
                command: "/trigger tpa.search_id.key set 3"\
            }, \
            width: 30\
        }, \
        {\
            label: {\
                text: "4", \
                color: "aqua"\
            }, \
            tooltip: {\
                text: "4"\
            }, \
            action: {\
                type: "run_command", \
                command: "/trigger tpa.search_id.key set 4"\
            }, \
            width: 30\
        }, \
        {\
            label: {\
                text: "5", \
                color: "aqua"\
            }, \
            tooltip: {\
                text: "5"\
            }, \
            action: {\
                type: "run_command", \
                command: "/trigger tpa.search_id.key set 5"\
            }, \
            width: 30\
        }, \
        {\
            label: {\
                text: "6", \
                color: "aqua"\
            }, \
            tooltip: {\
                text: "6"\
            }, \
            action: {\
                type: "run_command", \
                command: "/trigger tpa.search_id.key set 6"\
            }, \
            width: 30\
        }, \
        {\
            label: {\
                text: "7", \
                color: "aqua"\
            }, \
            tooltip: {\
                text: "7"\
            }, \
            action: {\
                type: "run_command", \
                command: "/trigger tpa.search_id.key set 7"\
            }, \
            width: 30\
        }, \
        {\
            label: {\
                text: "8", \
                color: "aqua"\
            }, \
            tooltip: {\
                text: "8"\
            }, \
            action: {\
                type: "run_command", \
                command: "/trigger tpa.search_id.key set 8"\
            }, \
            width: 30\
        }, \
        {\
            label: {\
                text: "9", \
                color: "aqua"\
            }, \
            tooltip: {\
                text: "9"\
            }, \
            action: {\
                type: "run_command", \
                command: "/trigger tpa.search_id.key set 9"\
            }, \
            width: 30\
        }, \
        {\
            label: {\
                text: "0", \
                color: "aqua"\
            }, \
            tooltip: {\
                text: "0"\
            }, \
            action: {\
                type: "run_command", \
                command: "/trigger tpa.search_id.key set 10"\
            }, \
            width: 30\
        }, \
        {\
            label: {\
                text: "_", \
                color: "aqua"\
            }, \
            tooltip: {\
                text: "_"\
            }, \
            action: {\
                type: "run_command", \
                command: "/trigger tpa.search_id.key set 11"\
            }, \
            width: 30\
        }, \
        {\
            label: {\
                text: "Backspace", \
                color: "aqua"\
            }, \
            tooltip: {\
                text: "backspace"\
            }, \
            action: {\
                type: "run_command", \
                command: "/trigger tpa.search_id.key set 12"\
            }, \
            width: 60\
        }, \
        {\
            label: "", \
            width: 45\
        }, \
        {\
            label: {\
                text: "q", \
                color: "aqua"\
            }, \
            tooltip: {\
                text: "q"\
            }, \
            action: {\
                type: "run_command", \
                command: "/trigger tpa.search_id.key set 13"\
            }, \
            width: 30\
        }, \
        {\
            label: {\
                text: "w", \
                color: "aqua"\
            }, \
            tooltip: {\
                text: "w"\
            }, \
            action: {\
                type: "run_command", \
                command: "/trigger tpa.search_id.key set 14"\
            }, \
            width: 30\
        }, \
        {\
            label: {\
                text: "e", \
                color: "aqua"\
            }, \
            tooltip: {\
                text: "e"\
            }, \
            action: {\
                type: "run_command", \
                command: "/trigger tpa.search_id.key set 15"\
            }, \
            width: 30\
        }, \
        {\
            label: {\
                text: "r", \
                color: "aqua"\
            }, \
            tooltip: {\
                text: "r"\
            }, \
            action: {\
                type: "run_command", \
                command: "/trigger tpa.search_id.key set 16"\
            }, \
            width: 30\
        }, \
        {\
            label: {\
                text: "t", \
                color: "aqua"\
            }, \
            tooltip: {\
                text: "t"\
            }, \
            action: {\
                type: "run_command", \
                command: "/trigger tpa.search_id.key set 17"\
            }, \
            width: 30\
        }, \
        {\
            label: {\
                text: "y", \
                color: "aqua"\
            }, \
            tooltip: {\
                text: "y"\
            }, \
            action: {\
                type: "run_command", \
                command: "/trigger tpa.search_id.key set 18"\
            }, \
            width: 30\
        }, \
        {\
            label: {\
                text: "u", \
                color: "aqua"\
            }, \
            tooltip: {\
                text: "u"\
            }, \
            action: {\
                type: "run_command", \
                command: "/trigger tpa.search_id.key set 19"\
            }, \
            width: 30\
        }, \
        {\
            label: {\
                text: "i", \
                color: "aqua"\
            }, \
            tooltip: {\
                text: "i"\
            }, \
            action: {\
                type: "run_command", \
                command: "/trigger tpa.search_id.key set 20"\
            }, \
            width: 30\
        }, \
        {\
            label: {\
                text: "o", \
                color: "aqua"\
            }, \
            tooltip: {\
                text: "o"\
            }, \
            action: {\
                type: "run_command", \
                command: "/trigger tpa.search_id.key set 21"\
            }, \
            width: 30\
        }, \
        {\
            label: {\
                text: "p", \
                color: "aqua"\
            }, \
            tooltip: {\
                text: "p"\
            }, \
            action: {\
                type: "run_command", \
                command: "/trigger tpa.search_id.key set 22"\
            }, \
            width: 30\
        }, \
        {\
            label: "", \
            width: 30\
        }, \
        {\
            label: "", \
            width: 60\
        }, \
        {\
            label: {\
                text: "$(caps)", \
            }, \
            tooltip: {\
                text: "capslock"\
            }, \
            action: {\
                type: "run_command", \
                command: "/trigger tpa.search_id.key set 23"\
            }, \
            width: 45\
        }, \
        {\
            label: {\
                text: "a", \
                color: "aqua"\
            }, \
            tooltip: {\
                text: "a"\
            }, \
            action: {\
                type: "run_command", \
                command: "/trigger tpa.search_id.key set 24"\
            }, \
            width: 30\
        }, \
        {\
            label: {\
                text: "s", \
                color: "aqua"\
            }, \
            tooltip: {\
                text: "s"\
            }, \
            action: {\
                type: "run_command", \
                command: "/trigger tpa.search_id.key set 25"\
            }, \
            width: 30\
        }, \
        {\
            label: {\
                text: "d", \
                color: "aqua"\
            }, \
            tooltip: {\
                text: "d"\
            }, \
            action: {\
                type: "run_command", \
                command: "/trigger tpa.search_id.key set 26"\
            }, \
            width: 30\
        }, \
        {\
            label: {\
                text: "f", \
                color: "aqua"\
            }, \
            tooltip: {\
                text: "f"\
            }, \
            action: {\
                type: "run_command", \
                command: "/trigger tpa.search_id.key set 27"\
            }, \
            width: 30\
        }, \
        {\
            label: {\
                text: "g", \
                color: "aqua"\
            }, \
            tooltip: {\
                text: "g"\
            }, \
            action: {\
                type: "run_command", \
                command: "/trigger tpa.search_id.key set 28"\
            }, \
            width: 30\
        }, \
        {\
            label: {\
                text: "h", \
                color: "aqua"\
            }, \
            tooltip: {\
                text: "h"\
            }, \
            action: {\
                type: "run_command", \
                command: "/trigger tpa.search_id.key set 29"\
            }, \
            width: 30\
        }, \
        {\
            label: {\
                text: "j", \
                color: "aqua"\
            }, \
            tooltip: {\
                text: "j"\
            }, \
            action: {\
                type: "run_command", \
                command: "/trigger tpa.search_id.key set 30"\
            }, \
            width: 30\
        }, \
        {\
            label: {\
                text: "k", \
                color: "aqua"\
            }, \
            tooltip: {\
                text: "k"\
            }, \
            action: {\
                type: "run_command", \
                command: "/trigger tpa.search_id.key set 31"\
            }, \
            width: 30\
        }, \
        {\
            label: {\
                text: "l", \
                color: "aqua"\
            }, \
            tooltip: {\
                text: "l"\
            }, \
            action: {\
                type: "run_command", \
                command: "/trigger tpa.search_id.key set 32"\
            }, \
            width: 30\
        }, \
        {\
            label: "", \
            width: 30\
        }, \
        {\
            label: "", \
            width: 30\
        }, \
        {\
            label: {\
                text: "Enter", \
                color: "aqua"\
            }, \
            tooltip: {\
                text: "enter"\
            }, \
            action: {\
                type: "run_command", \
                command: "/trigger tpa.search_id.key set 33"\
            }, \
            width: 60\
        }, \
        {\
            label: "", \
            width: 45\
        }, \
        {\
            label: {\
                text: "z", \
                color: "aqua"\
            }, \
            tooltip: {\
                text: "z"\
            }, \
            action: {\
                type: "run_command", \
                command: "/trigger tpa.search_id.key set 34"\
            }, \
            width: 30\
        }, \
        {\
            label: {\
                text: "x", \
                color: "aqua"\
            }, \
            tooltip: {\
                text: "x"\
            }, \
            action: {\
                type: "run_command", \
                command: "/trigger tpa.search_id.key set 35"\
            }, \
            width: 30\
        }, \
        {\
            label: {\
                text: "c", \
                color: "aqua"\
            }, \
            tooltip: {\
                text: "c"\
            }, \
            action: {\
                type: "run_command", \
                command: "/trigger tpa.search_id.key set 36"\
            }, \
            width: 30\
        }, \
        {\
            label: {\
                text: "v", \
                color: "aqua"\
            }, \
            tooltip: {\
                text: "v"\
            }, \
            action: {\
                type: "run_command", \
                command: "/trigger tpa.search_id.key set 37"\
            }, \
            width: 30\
        }, \
        {\
            label: {\
                text: "b", \
                color: "aqua"\
            }, \
            tooltip: {\
                text: "b"\
            }, \
            action: {\
                type: "run_command", \
                command: "/trigger tpa.search_id.key set 38"\
            }, \
            width: 30\
        }, \
        {\
            label: {\
                text: "n", \
                color: "aqua"\
            }, \
            tooltip: {\
                text: "n"\
            }, \
            action: {\
                type: "run_command", \
                command: "/trigger tpa.search_id.key set 39"\
            }, \
            width: 30\
        }, \
        {\
            label: {\
                text: "m", \
                color: "aqua"\
            }, \
            tooltip: {\
                text: "m"\
            }, \
            action: {\
                type: "run_command", \
                command: "/trigger tpa.search_id.key set 40"\
            }, \
            width: 30\
        }, \
        {\
            label: "", \
            width: 30\
        }, \
        {\
            label: "", \
            width: 30\
        }, \
        {\
            label: "", \
            width: 30\
        }, \
        {\
            label: "", \
            width: 30\
        }, \
        {\
            label: "", \
            width: 60\
        }, \
        {\
            label: "", \
            width: 45\
        }, \
        {\
            label: "", \
            width: 30\
        }, \
        {\
            label: "", \
            width: 30\
        }, \
        {\
            label: "", \
            width: 30\
        }, \
        {\
            label: {\
                text: "S", \
                color: "aqua"\
            }, \
            tooltip: {\
                text: "space"\
            }, \
            action: {\
                type: "run_command", \
                command: "/trigger tpa.search_id.key set 41"\
            }, \
            width: 30\
        }, \
        {\
            label: {\
                text: "P", \
                color: "aqua"\
            }, \
            tooltip: {\
                text: "space"\
            }, \
            action: {\
                type: "run_command", \
                command: "/trigger tpa.search_id.key set 41"\
            }, \
            width: 30\
        }, \
        {\
            label: {\
                text: "A", \
                color: "aqua"\
            }, \
            tooltip: {\
                text: "space"\
            }, \
            action: {\
                type: "run_command", \
                command: "/trigger tpa.search_id.key set 41"\
            }, \
            width: 30\
        }, \
        {\
            label: {\
                text: "C", \
                color: "aqua"\
            }, \
            tooltip: {\
                text: "space"\
            }, \
            action: {\
                type: "run_command", \
                command: "/trigger tpa.search_id.key set 41"\
            }, \
            width: 30\
        }, \
        {\
            label: {\
                text: "E", \
                color: "aqua"\
            }, \
            tooltip: {\
                text: "space"\
            }, \
            action: {\
                type: "run_command", \
                command: "/trigger tpa.search_id.key set 41"\
            }, \
            width: 30\
        }, \
        {\
            label: "", \
            width: 30\
        }, \
        {\
            label: "", \
            width: 30\
        }, \
        {\
            label: "", \
            width: 30\
        }, \
        {\
            label: "", \
            width: 60\
        }, \
        {\
            label: {translate: "gui.done"}, \
            tooltip: "$(done_tooltip)", \
            action: {\
                type: "run_command", \
                command: "/trigger tpa.search_id.key set 33"\
            }\
        }\
    ]\
}