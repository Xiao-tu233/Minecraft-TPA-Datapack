# Parent function: tpa:warp/edit/name/commit, tpa:warp/edit/desc/commit

data remove storage tpa:tpa temp.warp_result
scoreboard players set #warp.store_result tpa.variables 0
scoreboard players set #warp.remove_current tpa.variables 0
scoreboard players set #warp.replace_current tpa.variables 1
scoreboard players set #warp.scan_count tpa.variables 1
function tpa:warp/scan

data remove storage tpa:tpa temp.warp_edit
data remove storage tpa:tpa temp.warp
data remove storage tpa:tpa temp.warp_candidate
function tpa:warp/option
