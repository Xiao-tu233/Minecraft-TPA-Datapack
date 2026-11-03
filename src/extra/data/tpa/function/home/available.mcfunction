# Parent function: tpa:home/enabled

# Get Page for slot start
function tpa:home/page/get
execute if score #home.page.result tpa.variables matches 0 run function tpa:home/page/create

execute if score #home tpa.variables matches -9 run function tpa:home/add

scoreboard players set #home.plays_menu_sound tpa.variables 0
execute if score #home tpa.variables matches -8 run scoreboard players set #home.plays_menu_sound tpa.variables 1
execute if score #home tpa.variables matches -2..-1 run scoreboard players set #home.plays_menu_sound tpa.variables 1

execute if score #home tpa.variables matches -8 run function tpa:home/page/next
execute if score #home tpa.variables matches -7..-3 run function tpa:home/resolve_slot
execute if score #home tpa.variables matches -2 run function tpa:home/page/previous
execute if score #home tpa.variables matches -1 run function tpa:home/menu

execute if score #home tpa.variables matches 1.. run function tpa:home/selected