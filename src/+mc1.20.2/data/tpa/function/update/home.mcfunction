# Parent function: tpa:on_join
# Migrate the current player's legacy homes after the player has a UID.

function tpa:get_name
data remove storage tpa:tpa temp.args
execute store result storage tpa:tpa temp.update_hargsome.uid int 1 run scoreboard players get @s tpa.uid
data modify storage tpa:tpa temp.args.name set from storage tpa:tpa temp.name
function tpa:update/home/prepare with storage tpa:tpa temp.args
