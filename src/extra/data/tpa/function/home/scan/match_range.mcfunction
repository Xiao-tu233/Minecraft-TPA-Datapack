# Parent function: tpa:home/scan/loop
#! This is a private function, shouldn't be called by functions outside tpa:home/ folder or even players

# Menu mode is UID-only. Return a list of matching Home compounds and keep the
# largest Home id separately for page calculation and new-slot selection.
execute if score #home.current_id tpa.variables > #home.max_id tpa.variables run scoreboard players operation #home.max_id tpa.variables = #home.current_id tpa.variables
execute if score #home.store_result tpa.variables matches 1 run data modify storage tpa:tpa temp.home_result append from storage tpa:tpa home[0]
execute unless score #home.remove_current tpa.variables matches 1 run data modify storage tpa:tpa home append from storage tpa:tpa home[0]
scoreboard players set #home.matched tpa.variables 1
