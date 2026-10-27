# Parent function: tpa:update/from_206/warp/scan
# Normalize the legacy dimension key before appending the Warp entry.

data remove storage tpa:tpa temp.args.old_dim
data remove storage tpa:tpa temp.args.new_dim

execute unless data storage tpa:tpa temp.update.warp[0].dimension if data storage tpa:tpa temp.update.warp[0].dim run data modify storage tpa:tpa temp.update.warp[0].dimension set from storage tpa:tpa temp.update.warp[0].dim
execute unless data storage tpa:tpa temp.update.warp[0].dimension if data storage tpa:tpa temp.update.warp[0].Dimension run data modify storage tpa:tpa temp.update.warp[0].dimension set from storage tpa:tpa temp.update.warp[0].Dimension

execute if data storage tpa:tpa temp.update.warp[0].dimension run data modify storage tpa:tpa temp.args.old_dim set from storage tpa:tpa temp.update.warp[0].dimension
execute if data storage tpa:tpa temp.args.old_dim run function tpa:dimension/normalize
execute if data storage tpa:tpa temp.args.new_dim run data modify storage tpa:tpa temp.update.warp[0].dimension set from storage tpa:tpa temp.args.new_dim

data remove storage tpa:tpa temp.update.warp[0].dim
data remove storage tpa:tpa temp.update.warp[0].Dimension
data modify storage tpa:tpa warp append from storage tpa:tpa temp.update.warp[0]
