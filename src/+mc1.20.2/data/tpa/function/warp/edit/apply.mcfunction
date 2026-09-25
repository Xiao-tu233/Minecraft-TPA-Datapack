# Called by: (Player) Any OP, Quoted by: tpa:warp/edit/name, tpa:warp/edit/desc

function tpa:load_lang

execute store result storage tpa:tpa temp.warp_edit.uid int 1 run scoreboard players get @s tpa.uid
execute store result storage tpa:tpa temp.warp_edit.index int 1 run scoreboard players get #warp.edit.index tpa.variables
execute store result score #warp tpa.variables run data get storage tpa:tpa temp.warp_edit.index

data remove storage tpa:tpa temp.warp
data remove storage tpa:tpa temp.warp_candidate
function tpa:warp/get
execute if data storage tpa:tpa temp.warp_result run data modify storage tpa:tpa temp.warp_candidate set from storage tpa:tpa temp.warp_result

#! Validation here donesn't mean is result input, it means if index exists
execute if data storage tpa:tpa temp.warp_result run function tpa:warp/edit/apply/valid
execute unless data storage tpa:tpa temp.warp_result run function tpa:warp/edit/apply/invalid