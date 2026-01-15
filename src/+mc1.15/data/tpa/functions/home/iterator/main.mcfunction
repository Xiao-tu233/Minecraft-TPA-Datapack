# Parent function: tpa:home/get
# @input: #op (0 for get, 1 for set, 2 for remove, 3 for menu), #uid, #home temp.home(#op==1)
# @output: temp.home(#op==0, 2, 3), #uid_found

data modify storage tpa:tpa home append value {sentinel: 1b}
execute unless score #op tpa.variables matches 1 run data remove storage tpa:tpa temp.home
execute if score #op tpa.variables matches 3 run data modify storage tpa:tpa temp.home set value []

function tpa:home/iterator/iterate

# Remove the sentinel value from the home list
data remove storage tpa:tpa home[0]