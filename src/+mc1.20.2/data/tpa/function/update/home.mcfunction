# Parent function: tpa:initialize
# The current format is a list of {x, y, z, dimension, uid, id} compounds.

data modify storage tpa:tpa temp.args.home set from storage tpa:tpa home
data modify storage tpa:tpa home set value []
function tpa:update/home/convert_snbt with storage tpa:tpa temp.args
function tpa:update/home/scan_char with storage tpa:tpa temp.args