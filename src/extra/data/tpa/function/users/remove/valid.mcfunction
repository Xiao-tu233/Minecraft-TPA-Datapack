scoreboard players set #users.mode tpa.variables 6
function tpa:users/scan
execute if score #users.result tpa.variables matches 1 run function tpa:users/page/remove