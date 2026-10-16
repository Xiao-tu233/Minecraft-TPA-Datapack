# Parent function: tpa:home/removehome_has_home

# Because empty NBT compounds {} returns 1 when use execute store,
# we need further check when removing home:
# remove the whole path if the length of home is 1
scoreboard players set #home_owns tpa.variables 0
execute store result score #home_owns tpa.variables run data get storage tpa:tpa temp.home

execute if score #home_owns tpa.variables matches 1 run function tpa:home/clear with storage tpa:tpa temp.args
scoreboard players set #clear_dialog tpa.variables 0
execute if score #home_owns tpa.variables matches 1 run scoreboard players set #clear_dialog tpa.variables 1

# If length of home is 2.., compounds cannot be empty: remove the specific home with the given id
execute if score #home_owns tpa.variables matches 2.. run function tpa:home/remove with storage tpa:tpa temp.args

function tpa:home/menu
execute if score #clear_dialog tpa.variables matches 1 run dialog clear @s
function tpa:home/remove_done
