# Parent function: tpa:tick, tpa:home/set, tpa:home/remove, tpa:home/available

data remove storage tpa:tpa temp.home_result
data modify storage tpa:tpa temp.home_result set value []
scoreboard players set #home.match_all tpa.variables 1
scoreboard players set #home.store_result tpa.variables 1
scoreboard players set #home.remove_current tpa.variables 0
scoreboard players set #home.replace_current tpa.variables 0
scoreboard players operation #uid tpa.variables = @s tpa.uid
function tpa:home/scan
function tpa:home/page/set_max_id

# Calc total pages
scoreboard players operation #home.total_pages tpa.variables = #home.max_id tpa.variables
scoreboard players add #home.total_pages tpa.variables 4
scoreboard players operation #home.total_pages tpa.variables /= #5 tpa.variables

execute store result score #home_owns tpa.variables run data get storage tpa:tpa temp.home_result

execute if score #home_owns tpa.variables matches 0 run function tpa:home/menu/create_tip
execute if score #home_owns tpa.variables matches 1.. run function tpa:home/menu/has_home
