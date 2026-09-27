# Parent function: tpa:warp/remove/slot_*
#! tpa:warp/remove is taken as the interface for warp scanning
function tpa:warp/edit/slot_offset
scoreboard players operation #warp.edit.index tpa.variables = #warp.remove.slot tpa.variables
scoreboard players operation #warp.edit.index tpa.variables += #warp.page.offset tpa.variables

scoreboard players operation #warp tpa.variables = #warp.edit.index tpa.variables
function tpa:warp/remove

function tpa:warp/option