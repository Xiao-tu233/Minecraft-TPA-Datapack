# Parent function:  tpa:users/menu/append_entries

data modify storage tpa:tpa temp.users.menu_user_entries append from storage tpa:tpa temp.users.result
execute unless score #users.start_index tpa.variables = #users.start_index tpa.variables run scoreboard players operation #users.start_index tpa.variables = #users.menu.uid tpa.variables
scoreboard players operation #users.end_index tpa.variables = #users.menu.uid tpa.variables
