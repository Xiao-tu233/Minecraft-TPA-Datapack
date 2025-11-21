# Parent Function: tpa:home/new
# Deal with condition len(home[uid].homes) < #home <= #home.tpa.config 

scoreboard players add #i tpa.variables 1

execute if score #i tpa.variables = #home tpa.variables run data modify storage tpa:tpa temp.home_notmatch append from storage tpa:tpa temp.home_src
execute unless score #i tpa.variables = #home tpa.variables run data modify storage tpa:tpa temp.home_notmatch append value {}
execute unless score #i tpa.variables = #home tpa.variables if score #i tpa.variables < #home tpa.config run function tpa:home/new