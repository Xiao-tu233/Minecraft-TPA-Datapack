# Parent function: tpa:warp/disable/slot_*
function tpa:warp/edit/slot_offset
scoreboard players operation #warp.edit.index tpa.variables = #warp.disable.slot tpa.variables
scoreboard players operation #warp.edit.index tpa.variables += #warp.page.offset tpa.variables

scoreboard players operation #warp tpa.variables = #warp.edit.index tpa.variables
function tpa:warp/get

data modify storage tpa:tpa temp.warp_candidate set from storage tpa:tpa temp.warp_result
data modify storage tpa:tpa temp.warp_candidate.disabled set value true
scoreboard players operation #warp tpa.variables = #warp.edit.index tpa.variables
function tpa:warp/set
 
function tpa:warp/option