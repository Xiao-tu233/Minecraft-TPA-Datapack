# Parent function: tpa:home/get
# @input: #op (0 for get, 1 for set, 2 for remove), #uid, #home
# @output: temp.home, #uid_found

data modify storage tpa:tpa home append value {sentinel: 1b}

function tpa:home/iterator/iterate

# Remove the sentinel value from the home list
data remove storage tpa:tpa home[0]