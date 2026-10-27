# Parent function: tpa:update/from_206/warp/scan
# The first element is metadata and must remain byte-for-byte equivalent.
data modify storage tpa:tpa warp append from storage tpa:tpa temp.update.warp[0]
scoreboard players set #option.update.warp_metadata tpa.variables 1
