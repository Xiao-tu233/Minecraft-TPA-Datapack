# Parent function: tpa:warp/edit/desc/apply

execute if data storage tpa:tpa temp.warp_edit.desc run data modify storage tpa:tpa temp.warp_candidate.desc set from storage tpa:tpa temp.warp_edit.desc
execute unless data storage tpa:tpa temp.warp_edit.desc run function tpa:warp/edit/no_value
execute if data storage tpa:tpa temp.warp_edit.desc run function tpa:warp/edit/commit
