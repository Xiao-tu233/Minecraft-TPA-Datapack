# Parent function: tpa:users/menu

scoreboard players add #users.menu.uid tpa.variables 1
execute store result storage tpa:tpa temp.users.input.uid int 1 run scoreboard players get #users.menu.uid tpa.variables
function tpa:users/get

execute if score #users.result tpa.variables matches 1 run function tpa:users/menu/append_entries/found
execute if score #users.result tpa.variables matches 0 run function tpa:users/menu/append_entries/missing