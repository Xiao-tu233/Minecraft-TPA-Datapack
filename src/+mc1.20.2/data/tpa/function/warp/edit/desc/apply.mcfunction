# Called by: tpa:warp/edit/desc/menu

function tpa:warp/edit/apply_prepare
execute if data storage tpa:tpa temp.warp_result run function tpa:warp/edit/desc/commit
execute unless data storage tpa:tpa temp.warp_result run function tpa:warp/edit/invalid
