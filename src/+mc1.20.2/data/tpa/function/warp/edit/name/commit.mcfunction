# Parent function: tpa:warp/edit/name/apply

execute if data storage tpa:tpa temp.warp_edit.name run data modify storage tpa:tpa temp.warp_candidate.name set from storage tpa:tpa temp.warp_edit.name
execute unless data storage tpa:tpa temp.warp_edit.name run function tpa:warp/edit/no_value
execute if data storage tpa:tpa temp.warp_edit.name run function tpa:warp/edit/commit
