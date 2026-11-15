# Parent function: tpa:warp/moveup/slot_*

function tpa:warp/edit/slot_offset
scoreboard players operation #warp.edit.index tpa.variables = #warp.moveup.slot tpa.variables
scoreboard players operation #warp.edit.index tpa.variables += #warp.page.offset tpa.variables

# A Warp can move up only when its absolute slot is between 2 and the last slot.
execute if score #warp.edit.index tpa.variables matches 2.. if score #warp.edit.index tpa.variables <= #warp tpa.config run function tpa:warp/moveup/swap

function tpa:warp/option