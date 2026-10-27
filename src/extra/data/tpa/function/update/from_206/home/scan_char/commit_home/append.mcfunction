# Parent function: tpa:update/from_206/home/scan_char/commit_home
# The source entry is deleted only after the complete normalized entry has
# been appended to the new list.
data modify storage tpa:tpa temp.args.output set value {}
$execute store result storage tpa:tpa temp.args.output.uid int 1 run scoreboard players get $(current_name) tpa.uid
data modify storage tpa:tpa temp.args.output.x set from storage tpa:tpa temp.args.current.x
data modify storage tpa:tpa temp.args.output.y set from storage tpa:tpa temp.args.current.y
data modify storage tpa:tpa temp.args.output.z set from storage tpa:tpa temp.args.current.z
data modify storage tpa:tpa temp.args.output.dimension set from storage tpa:tpa temp.args.current.dimension
$data modify storage tpa:tpa temp.args.output.id set value $(current_id)
data modify storage tpa:tpa home append from storage tpa:tpa temp.args.output
$data remove storage tpa:tpa option.home_legacy.$(current_name).$(current_id)
