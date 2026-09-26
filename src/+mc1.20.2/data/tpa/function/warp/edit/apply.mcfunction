# Called by: (Player) Any OP, Quoted by: tpa:warp/edit/name, tpa:warp/edit/desc

execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug§r: Warp edit applied: ", {storage: "tpa:tpa", nbt: "temp.warp_edit"}]

function tpa:load_lang

execute store result score #warp tpa.variables run data get storage tpa:tpa temp.warp_edit.index
function tpa:warp/get

dialog clear @s
#! Validation here donesn't mean is result input, it means if index exists
execute unless data storage tpa:tpa temp.warp_result run function tpa:warp/edit/apply/invalid
execute if data storage tpa:tpa temp.warp_result run function tpa:warp/edit/apply/valid
function tpa:warp/option
