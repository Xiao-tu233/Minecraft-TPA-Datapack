# Parent function: tpa:home/menu
# Input:  List[5] temp.home_result
# Output: List[5] temp.output.slots: \
            str|int temp.output.slots[].color, List[2] temp.output.slots[].label.display, int temp.output.slots[].label.id, \
            str temp.output.slots[].tooltip.x, str temp.output.slots[].tooltip.y, str temp.output.slots[].tooltip.z, \
            str temp.output.slots[].tooltip.dimension, str temp.output.slots[].tooltip.hoverevent_location, \
            Button temp.output.slots[].button_tp, Button temp.output.slots[].button_set, Button temp.output.slots[].button_rm \
#! Button = {brackets: [Literal["[", "§8["], Literal["]", "§8]"]], label: str, tooltip: str}
data modify storage tpa:tpa temp.output.slots set value []
data modify storage tpa:tpa temp.home_result append value {sentinel: 1b}
execute unless data storage tpa:tpa temp.home_result[0].sentinel run function tpa:home/menu/prepare_output/loop
data remove storage tpa:tpa temp.home_result[0]