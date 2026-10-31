# Parent function: tpa:home/scan/loop
#! This is a private function, shouldn't be called by functions outside tpa:home/ folder or even players

# Menu mode is UID-only. Store the result under its per-player id so the
# existing Home menu can address entries as temp.home.<id>.
execute store result storage tpa:tpa temp.home_menu_id int 1 run data get storage tpa:tpa home[0].id
data modify storage tpa:tpa temp.home_menu_id set string storage tpa:tpa temp.home_menu_id
execute if score #home.store_result tpa.variables matches 1 run data modify storage tpa:tpa temp.home_result.$(home_menu_id) set from storage tpa:tpa home[0]
execute unless score #home.remove_current tpa.variables matches 1 run data modify storage tpa:tpa home append from storage tpa:tpa home[0]
scoreboard players set #home.matched tpa.variables 1
