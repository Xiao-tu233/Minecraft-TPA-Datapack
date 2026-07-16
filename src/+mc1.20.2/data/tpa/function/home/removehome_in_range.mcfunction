# Parent function: tpa:home/removehome_available

function tpa:get_name
data modify storage tpa:tpa temp.args.name set from storage tpa:tpa temp.name
function tpa:home/temp with storage tpa:tpa temp.args

# Tip the player if he hasn't had a home yet
execute unless data storage tpa:tpa temp.home run function tpa:home/create_tip
execute if data storage tpa:tpa temp.home run function tpa:home/removehome_has_home
