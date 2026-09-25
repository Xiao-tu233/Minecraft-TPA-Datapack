# Called by: (Player) Any OP, Quoted by: tpa:warp/edit/name, tpa:warp/edit/desc

function tpa:warp/edit/check_edittor

# function tpa:warp/edit/apply_prepare
# execute if data storage tpa:tpa temp.warp_result run function tpa:warp/edit/name/commit
# execute if data storage tpa:tpa temp.warp_result run function tpa:warp/edit/desc/commit
execute unless data storage tpa:tpa temp.warp_result run function tpa:warp/edit/invalid