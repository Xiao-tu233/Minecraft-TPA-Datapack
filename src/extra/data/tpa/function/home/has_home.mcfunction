# Parent function: tpa:home/within_range

scoreboard players set #home.match_all tpa.variables 0
function tpa:home/get

# If the UID+id pair is not valid, tell him Home is not found.
execute unless data storage tpa:tpa temp.home_result run function tpa:home/not_found
execute if data storage tpa:tpa temp.home_result run function tpa:home/teleport
