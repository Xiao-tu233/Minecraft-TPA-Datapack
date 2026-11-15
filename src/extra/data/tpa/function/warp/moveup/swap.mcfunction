# Parent function: tpa:warp/moveup

# Save the current slot and the slot immediately above it.
data remove storage tpa:tpa temp.warp_move_current
data remove storage tpa:tpa temp.warp_move_neighbor

scoreboard players operation #warp tpa.variables = #warp.edit.index tpa.variables
function tpa:warp/get
data modify storage tpa:tpa temp.warp_move_current set from storage tpa:tpa temp.warp_result

scoreboard players operation #warp.moveup.neighbor tpa.variables = #warp.edit.index tpa.variables
scoreboard players remove #warp.moveup.neighbor tpa.variables 1
scoreboard players operation #warp tpa.variables = #warp.moveup.neighbor tpa.variables
function tpa:warp/get
data modify storage tpa:tpa temp.warp_move_neighbor set from storage tpa:tpa temp.warp_result

# Replace the current slot with the upper slot, then replace the upper slot
# with the original current entry.
data modify storage tpa:tpa temp.warp_candidate set from storage tpa:tpa temp.warp_move_neighbor
scoreboard players operation #warp tpa.variables = #warp.edit.index tpa.variables
function tpa:warp/set

data modify storage tpa:tpa temp.warp_candidate set from storage tpa:tpa temp.warp_move_current
scoreboard players operation #warp tpa.variables = #warp.moveup.neighbor tpa.variables
function tpa:warp/set

function tpa:warp/option
