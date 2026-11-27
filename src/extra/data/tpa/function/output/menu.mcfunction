# Input: minecraft:dialog(Inline Dialog) temp.output.menu \
            str temp.output.menu.chatbar_title, \
            str temp.output.menu.actions[].space, str temp.output.menu.actions[].brackets, \
            str temp.output.menu.actions[].slot_key // Temporary key for locating action entries \

data remove storage tpa:tpa temp.args
data remove storage tpa:tpa temp.output.menu.actions[].space
data remove storage tpa:tpa temp.output.menu.actions[].brackets
data remove storage tpa:tpa temp.output.menu.actions[].chatbar_label
data remove storage tpa:tpa temp.output.menu.actions[].slot_key
data remove storage tpa:tpa temp.output.menu.chatbar_title
data modify storage tpa:tpa temp.args.dialog set from storage tpa:tpa temp.output.menu
function tpa:util/dialog with storage tpa:tpa temp.args
