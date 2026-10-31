# Parent Function: tpa:removehome

data remove storage tpa:tpa temp.home_result
scoreboard players set #home.match_all tpa.variables 0
scoreboard players set #home.store_result tpa.variables 0
scoreboard players set #home.remove_current tpa.variables 1
scoreboard players set #home.replace_current tpa.variables 0
scoreboard players operation #uid tpa.variables = @s tpa.uid
function tpa:home/scan

# Refresh the menu after a removal, keeping the same UID-based view.
function tpa:home/menu
