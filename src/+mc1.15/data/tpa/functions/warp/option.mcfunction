# Called by: (player) Any OP, quoted by: tpa:options
scoreboard players set #is_editting_warp tpa.variables 1
scoreboard players operation #target_lang tpa.variables = #language tpa.config
tag @s add tpa.warp_editor
function tpa:warp/menu