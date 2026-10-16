# Parent function: tpa:warp/edit/apply/not_occupied

data modify storage tpa:tpa temp.warp_candidate set from storage tpa:tpa temp.warp_result
data modify storage tpa:tpa temp.warp_candidate.name set from storage tpa:tpa temp.warp_edit.name
data modify storage tpa:tpa temp.warp_candidate.desc set from storage tpa:tpa temp.warp_edit.desc
execute store result score #warp tpa.variables run data get storage tpa:tpa temp.warp_edit.index
function tpa:warp/set
 
data remove storage tpa:tpa temp.warp_edit