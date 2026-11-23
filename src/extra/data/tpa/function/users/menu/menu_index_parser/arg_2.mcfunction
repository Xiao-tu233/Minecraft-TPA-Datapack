# Parent function: tpa:users/menu/page_normal, tpa:users/menu/page_empty

data modify storage tpa:tpa temp.output.menu.body.contents append value "TOTAL_USERS_VALUE_PLACEHOLDER"
execute store result storage tpa:tpa temp.output.menu.body.contents[-1] int 1 run scoreboard players get #users.total_users tpa.variables
data modify storage tpa:tpa temp.output.menu.body.contents[-1] set string storage tpa:tpa temp.output.menu.body.contents[-1]
