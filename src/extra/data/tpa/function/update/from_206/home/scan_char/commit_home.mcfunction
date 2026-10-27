# Parent function: tpa:update/from_206/home/scan_char/right_bracket
# The temporary reverse users index lets this work for offline players too.
data remove storage tpa:tpa temp.args.current.dimension
execute if data storage tpa:tpa temp.args.current.dim run data modify storage tpa:tpa temp.args.current.dimension set from storage tpa:tpa temp.args.current.dim
execute unless data storage tpa:tpa temp.args.current.dimension if data storage tpa:tpa temp.args.current.Dimension run data modify storage tpa:tpa temp.args.current.dimension set from storage tpa:tpa temp.args.current.Dimension

data modify storage tpa:tpa temp.args.old_dim set from storage tpa:tpa temp.args.current.dimension
function tpa:dimension/normalize
data modify storage tpa:tpa temp.args.current.dimension set from storage tpa:tpa temp.args.new_dim

$execute if data storage tpa:tpa temp.args.current.x if data storage tpa:tpa temp.args.current.y if data storage tpa:tpa temp.args.current.z if data storage tpa:tpa temp.args.current.dimension if data storage tpa:tpa temp.args.current_name if data storage tpa:tpa temp.args.current_id if score $(current_name) tpa.uid = $(current_name) tpa.uid run function tpa:update/from_206/home/scan_char/commit_home/append with storage tpa:tpa temp.args
