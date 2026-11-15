# Parent function: tpa:warp/movedown/slot_*

function tpa:warp/edit/slot_offset
scoreboard players operation #warp.edit.index tpa.variables = #warp.movedown.slot tpa.variables
scoreboard players operation #warp.edit.index tpa.variables += #warp.page.offset tpa.variables

# A Warp can move down only when its absolute slot is before the last slot.
execute if score #warp.edit.index tpa.variables matches 1.. if score #warp.edit.index tpa.variables < #warp tpa.config run function tpa:warp/movedown/swap

function tpa:warp/option