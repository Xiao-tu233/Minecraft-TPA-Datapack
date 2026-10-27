# Parent function: tpa:update/from_206/warp/prepare ，tpa:update/from_206/warp/scan
# Rotate the copied list until its sentinel reaches the front.

execute unless data storage tpa:tpa temp.update.warp[0].sentinel if score #option.update.warp_metadata tpa.variables matches 0 run function tpa:update/from_206/warp/scan/metadata
execute unless data storage tpa:tpa temp.update.warp[0].sentinel if score #option.update.warp_metadata tpa.variables matches 1 run function tpa:update/from_206/warp/scan/entry
execute unless data storage tpa:tpa temp.update.warp[0].sentinel run data remove storage tpa:tpa temp.update.warp[0]
execute unless data storage tpa:tpa temp.update.warp[0].sentinel run function tpa:update/from_206/warp/scan
