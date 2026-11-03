# Parent function: tpa:home/menu/has_home
# Input:  Sorted List temp.home_result containing only existing Homes.
# Output: List[5] temp.output.slots: \
            str|int temp.output.slots[].color, List[str] temp.output.slots[].label, \
            str temp.output.slots[].tooltip.x, str temp.output.slots[].tooltip.y, str temp.output.slots[].tooltip.z, \
            str temp.output.slots[].tooltip.dimension, str temp.output.slots[].tooltip.hoverevent_location, int temp.output.slots[].tooltip.hoverevent_location_format, \
            Button temp.output.slots[].button_tp, Button temp.output.slots[].button_set, Button temp.output.slots[].button_rm \
#! Button = {brackets: [Literal["[", "§8["], Literal["]", "§8]"]], label: str, tooltip: str}
data modify storage tpa:tpa temp.output.slots set value []
scoreboard players set #home.output_slot tpa.variables 0
scoreboard players operation #home.current_id tpa.variables = #home.page.offset tpa.variables
function tpa:home/menu/prepare_output/loop
