# Parent function: tpa:users/movedown/slot_*
function tpa:users/edit/slot_offset
execute if score #users.edit.index tpa.variables matches 1.. if score #users.edit.index tpa.variables < #users.total tpa.variables run function tpa:users/movedown/swap
function tpa:users/option
