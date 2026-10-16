# Parent function: tpa:warp/menu
# Input:  List[5] temp.warp_result
# Output: List[5] temp.output.slots: \
            str|int temp.output.slots[].color, str temp.output.slots[].label, str temp.output.slots[].disabled.tooltip, \
            str temp.output.slots[].enabled.tooltip.x, str temp.output.slots[].enabled.tooltip.y, str temp.output.slots[].enabled.tooltip.z, \
            List[2] temp.output.slots[].enabled.tooltip.brackets, str temp.output.slots[].enabled.tooltip.space, \
            str temp.output.slots[].enabled.tooltip.dimension, str temp.output.slots[].enabled.tooltip.hoverevent_location, str temp.output.slots[].enabled.tooltip.desc, \
            Button temp.output.slots[].enabled.button_tp, Button temp.output.slots[].disabled.button_tp, Button temp.output.slots[].buttons.setpos, Button temp.output.slots[].buttons.setname, Button temp.output.slots[].buttons.setdesc, \
            Button temp.output.slots[].buttons.rm, Button temp.output.slots[].enabled.disable, Button temp.output.slots[].disabled.enable, \
            Button temp.output.slots[].buttons.moveup, Button temp.output.slots[].buttons.movedown \
#! Button = {brackets: [Literal["[", "§8["], Literal["]", "§8]"]], label: str, tooltip: str}
data modify storage tpa:tpa temp.output.slots set value []
data modify storage tpa:tpa temp.warp_result append value {sentinel: 1b}
execute unless data storage tpa:tpa temp.warp_result[0].sentinel run function tpa:warp/menu/prepare_output/loop
data remove storage tpa:tpa temp.warp_result[0]