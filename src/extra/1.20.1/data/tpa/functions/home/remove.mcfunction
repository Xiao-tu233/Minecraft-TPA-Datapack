# Parent function: tpa:removehome

scoreboard players set #op tpa.variables 2
function tpa:home/iterator/main

scoreboard players set #home_exists tpa.variables 0
execute if data storage tpa:tpa temp.home.x run scoreboard players set #home_exists tpa.variables 1