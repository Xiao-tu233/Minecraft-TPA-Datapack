# Parent function: tpa:warp/get
# @input: #warp
# @output: temp.warp

data remove storage tpa:tpa warp[0]
data modify storage tpa:tpa warp append value {sentinel: 1b}

function tpa:warp/iterator/iterate

# Remove the sentinel value from the warp list
data modify storage tpa:tpa warp[0] set value {}