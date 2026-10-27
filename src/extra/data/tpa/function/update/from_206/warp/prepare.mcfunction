# Parent function: tpa:update/from_206/warp

data modify storage tpa:tpa temp.update.warp set from storage tpa:tpa warp
data modify storage tpa:tpa warp set value []
data modify storage tpa:tpa temp.update.warp append value {sentinel: 1b}
scoreboard players set #option.update.warp_metadata tpa.variables 0
execute unless data storage tpa:tpa temp.update.warp[0].sentinel run function tpa:update/from_206/warp/scan
data remove storage tpa:tpa temp.update.warp
