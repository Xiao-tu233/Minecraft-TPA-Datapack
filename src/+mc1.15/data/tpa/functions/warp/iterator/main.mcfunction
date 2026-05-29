# Parent function: tpa:warp/get
# @input: #op (0 for get, 1 for set, 2 for remove), #warp temp.warp(#op==1)
# @output: temp.warp(#op==0, 2),　#warp_editted(#op==1)

tellraw @a ["Debug @ tpa:warp/iterator/main: ", {"score": {"name": "#warp", "objective": "tpa.variables"}}]
data remove storage tpa:tpa warp[0]
data modify storage tpa:tpa warp append value {sentinel: 1b}
execute unless score #op tpa.variables matches 1 run data remove storage tpa:tpa temp.warp
scoreboard players set #warp_editted tpa.variables 0
execute unless data storage tpa:tpa warp[0].sentinel run function tpa:warp/iterator/iterate

# Remove the sentinel value from the warp list
data modify storage tpa:tpa warp[0] set value {}