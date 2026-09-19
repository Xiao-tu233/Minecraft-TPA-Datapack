# Parent function: tpa:warp/edit/name/apply, tpa:warp/edit/desc/apply

# The input command only writes name/desc. The apply action binds the edit to
# the current player and the slot selected before the submenu was opened.
execute store result storage tpa:tpa temp.warp_edit.uid int 1 run scoreboard players get @s tpa.uid
execute store result storage tpa:tpa temp.warp_edit.index int 1 run scoreboard players get #warp.edit.index tpa.variables
execute store result score #warp tpa.variables run data get storage tpa:tpa temp.warp_edit.index

data remove storage tpa:tpa temp.warp
data remove storage tpa:tpa temp.warp_candidate
function tpa:warp/get
execute if data storage tpa:tpa temp.warp_result run data modify storage tpa:tpa temp.warp_candidate set from storage tpa:tpa temp.warp_result
