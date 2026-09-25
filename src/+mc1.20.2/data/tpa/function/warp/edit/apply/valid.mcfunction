# Parent function: tpa:warp/edit/apply

function tpa:warp/edit/check_edittor
execute unless score #warp.occupied tpa.variables matches 1 run function tpa:warp/edit/desc

# function tpa:warp/edit/apply_prepare
# execute if data storage tpa:tpa temp.warp_result run function tpa:warp/edit/name/commit
# execute if data storage tpa:tpa temp.warp_result run function tpa:warp/edit/desc/commit