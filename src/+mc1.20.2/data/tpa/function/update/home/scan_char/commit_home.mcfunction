# Parent function: tpa:update/home/scan_char/right_bracket
# Resolve the legacy dimension field before committing this Home.
scoreboard players set #option.update.slot_migrated tpa.variables 0
data remove storage tpa:tpa temp.args.current.dimension
data remove storage tpa:tpa temp.args.old_dim
data remove storage tpa:tpa temp.args.new_dim
execute if data storage tpa:tpa temp.args.current.dim run data modify storage tpa:tpa temp.args.current.dimension set from storage tpa:tpa temp.args.current.dim
execute unless data storage tpa:tpa temp.args.current.dimension if data storage tpa:tpa temp.args.current.Dimension run data modify storage tpa:tpa temp.args.current.dimension set from storage tpa:tpa temp.args.current.Dimension

execute if data storage tpa:tpa temp.args.current.dimension run data modify storage tpa:tpa temp.args.old_dim set from storage tpa:tpa temp.args.current.dimension
execute if data storage tpa:tpa temp.args.current.dimension run function tpa:dimension/normalize
execute if data storage tpa:tpa temp.args.new_dim run data modify storage tpa:tpa temp.args.current.dimension set from storage tpa:tpa temp.args.new_dim

$execute store result storage tpa:tpa temp.args.uid int 1 run scoreboard players get $(current_name) tpa.uid
$data modify storage tpa:tpa temp.args.id set value $(current_id)
$execute if data storage tpa:tpa temp.args.current.x if data storage tpa:tpa temp.args.current.y if data storage tpa:tpa temp.args.current.z if data storage tpa:tpa temp.args.current.dimension if data storage tpa:tpa temp.args.current_name if data storage tpa:tpa temp.args.current_id if score $(current_name) tpa.uid = $(current_name) tpa.uid run function tpa:update/home/scan_char/commit_home/append with storage tpa:tpa temp.args
execute unless score #option.update.slot_migrated tpa.variables matches 1 run scoreboard players set #option.update.player_incomplete tpa.variables 1
