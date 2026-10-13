# Parent function: tpa:initialize
# The current format is a list of {x, y, z, dimension, uid, id} compounds.

data modify storage tpa:tpa temp.args.home set from storage tpa:tpa home
execute unless data storage tpa:tpa option.home_legacy run data modify storage tpa:tpa option.home_legacy set from storage tpa:tpa home
data modify storage tpa:tpa home set value []
function tpa:update/home/convert_snbt with storage tpa:tpa temp.args

scoreboard players set #option.update.in_string tpa.variables 0
scoreboard players set #option.update.depth tpa.variables 0
data modify storage tpa:tpa temp.args.current_key set value ""
data modify storage tpa:tpa temp.args.token set value ""
data remove storage tpa:tpa temp.args.current

function tpa:update/home/scan_char with storage tpa:tpa temp.args
