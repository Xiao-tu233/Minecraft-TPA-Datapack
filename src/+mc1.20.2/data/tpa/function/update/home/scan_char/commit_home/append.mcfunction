# Parent function: tpa:update/home/scan_char/commit_home
# The source entry is deleted only after the complete normalized entry has
# been appended to the new list.
data modify storage tpa:tpa temp.args.output set value {}
$execute store result storage tpa:tpa temp.args.output.uid int 1 run scoreboard players get $(current_name) tpa.uid
data modify storage tpa:tpa temp.args.output.x set from storage tpa:tpa temp.args.current.x
data modify storage tpa:tpa temp.args.output.y set from storage tpa:tpa temp.args.current.y
data modify storage tpa:tpa temp.args.output.z set from storage tpa:tpa temp.args.current.z
data modify storage tpa:tpa temp.args.output.dimension set from storage tpa:tpa temp.args.current.dimension
$data modify storage tpa:tpa temp.args.output.id set value $(current_id)
data modify storage tpa:tpa temp.args.uid set from storage tpa:tpa temp.args.output.uid
data modify storage tpa:tpa temp.args.id set from storage tpa:tpa temp.args.output.id
scoreboard players set #option.update.home_conflict tpa.variables 0
scoreboard players set #option.update.home_appended tpa.variables 0
$execute if data storage tpa:tpa home[{uid:$(uid),id:$(id)}] run scoreboard players set #option.update.home_conflict tpa.variables 1
execute unless score #option.update.home_conflict tpa.variables matches 1 store success score #option.update.home_appended tpa.variables run data modify storage tpa:tpa home append from storage tpa:tpa temp.args.output
execute if score #option.update.home_conflict tpa.variables matches 1 run function tpa:update/home/scan_char/commit_home/remove_legacy with storage tpa:tpa temp.args
execute if score #option.update.home_appended tpa.variables matches 1 run function tpa:update/home/scan_char/commit_home/remove_legacy with storage tpa:tpa temp.args
