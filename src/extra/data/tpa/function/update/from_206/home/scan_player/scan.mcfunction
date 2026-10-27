# Parent function: tpa:update/from_206/home/scan_player
$data modify storage tpa:tpa temp.args.home set from storage tpa:tpa option.home_legacy.$(name)
function tpa:update/from_206/home/convert_player_snbt with storage tpa:tpa temp.args

scoreboard players set #option.update.in_string tpa.variables 0
scoreboard players set #option.update.depth tpa.variables 0
data modify storage tpa:tpa temp.args.current_key set value ""
data modify storage tpa:tpa temp.args.token set value ""
data remove storage tpa:tpa temp.args.current

function tpa:update/from_206/home/scan_char with storage tpa:tpa temp.args
