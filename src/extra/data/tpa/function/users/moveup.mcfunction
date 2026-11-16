# Parent function: tpa:users/moveup/slot_*
function tpa:users/edit/slot_offset
execute if score #users.edit.index tpa.variables matches 2.. run function tpa:users/moveup/swap
function tpa:users/option
