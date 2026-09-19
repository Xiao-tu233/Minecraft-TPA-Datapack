# Called by: tpa:warp/edit/name/menu

function tpa:warp/edit/apply_prepare
execute if data storage tpa:tpa temp.warp_result run function tpa:warp/edit/name/commit
execute unless data storage tpa:tpa temp.warp_result run function tpa:warp/edit/invalid