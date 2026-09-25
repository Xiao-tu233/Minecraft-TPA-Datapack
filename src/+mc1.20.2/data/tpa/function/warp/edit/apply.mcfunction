# Called by: (Player) Any OP, Quoted by: tpa:warp/edit/name, tpa:warp/edit/desc

function tpa:load_lang

execute unless data storage tpa:tpa temp.warp_result run function tpa:warp/edit/apply/valid
execute unless data storage tpa:tpa temp.warp_result run function tpa:warp/edit/apply/invalid