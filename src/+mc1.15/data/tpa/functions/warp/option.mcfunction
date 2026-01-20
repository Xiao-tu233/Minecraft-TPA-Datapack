# Called by: (player) Any OP, quoted by: tpa:options
scoreboard players set #is_editting_warp tpa.variables 1
scoreboard players operation #target_lang tpa.variables = #language tpa.config
function tpa:warp/menu