# Parent function: tpa:warp/get
# @input: #op (0 for get, 1 for set, 2 for remove, 3 for menu), #warp temp.warp(#op==1)
# @output: temp.warp(#op==0, 2, 3),　#warp_editted(#op==1)

data remove storage tpa:tpa warp[0]
data modify storage tpa:tpa warp append value {sentinel: 1b}
execute unless score #op tpa.variables matches 1 run data remove storage tpa:tpa temp.warp
execute if score #op tpa.variables matches 3 run data modify storage tpa:tpa temp.warp set value []
scoreboard players set #warp_editted tpa.variables 0

function tpa:warp/iterator/iterate

# Remove the sentinel value from the warp list
data modify storage tpa:tpa warp[0] set value {}