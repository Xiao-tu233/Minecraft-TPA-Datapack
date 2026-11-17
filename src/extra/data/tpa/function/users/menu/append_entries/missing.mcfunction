# Parent function:  tpa:users/menu/append_entries

data modify storage tpa:tpa temp.users.menu_user_entries append value {}
execute store result storage tpa:tpa temp.users.menu_user_entries[-1].uid int 1 run scoreboard players get #users.uid tpa.variables
data modify storage tpa:tpa temp.users.menu_user_entries[-1].missing set value true