# Parent function: tpa:warp/slot_*
function tpa:warp/edit/slot_offset
scoreboard players operation #warp.edit.index tpa.variables = #warp.setname.slot tpa.variables
scoreboard players operation #warp.edit.index tpa.variables += #warp.page.offset tpa.variables

scoreboard players operation #warp tpa.variables = #warp.edit.index tpa.variables
function tpa:warp/get

function tpa:warp/edit/check_edittor
execute unless score #warp.occupied tpa.variables matches 1 run function tpa:warp/edit/name