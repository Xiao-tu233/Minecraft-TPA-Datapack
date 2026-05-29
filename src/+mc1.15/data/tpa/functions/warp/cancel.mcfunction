# Called by: (Player) Any Op, Quoted by tpa:warp/menu
# @macro: {index: int}
scoreboard players operation #warp tpa.variables = #editting_warp tpa.variables
data modify storage tpa:tpa temp.editted_warp set value {}
scoreboard players set #editting_warp tpa.variables 0
scoreboard players set #editting_warp.trigger tpa.variables 0
tag @a remove tpa.warp_editor