# @parent function: tpa:back

# Initialize the inputs
data modify storage tpa:tpa temp.back set from storage tpa:tpa back
data remove storage tpa:tpa back
data remove storage tpa:tpa temp.back_got

function tpa:back/iter_pos