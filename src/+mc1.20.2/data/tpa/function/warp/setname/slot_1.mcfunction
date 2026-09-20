# Called by: (Player) Any OP, quoted by: tpa:warp/menu

function tpa:warp/edit/slot_offset
scoreboard players set #warp.edit.index tpa.variables 1
scoreboard players operation #warp.edit.index tpa.variables += #warp.page.offset tpa.variables

function tpa:warp/edit/check_edittor
execute if score #warp.occupied tpa.variables matches 0 run function tpa:warp/edit/name