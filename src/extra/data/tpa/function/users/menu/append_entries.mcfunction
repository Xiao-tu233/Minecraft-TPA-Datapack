# Parent function: tpa:users/menu

scoreboard players add #users.uid tpa.variables 1
function tpa:users/get

execute if score #users.result tpa.variables matches 1 run data modify storage tpa:tpa temp.users.menu_user_entries append from storage tpa:tpa temp.users.result
execute if score #users.result tpa.variables matches 0 run function tpa:users/menu/append_entries/missing