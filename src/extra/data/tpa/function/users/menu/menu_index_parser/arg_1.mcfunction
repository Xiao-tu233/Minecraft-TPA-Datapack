# Parent function: tpa:users/menu/page_normal

data modify storage tpa:tpa temp.output.menu.body.contents append value "START_INDEX_VALUE_PLACEHOLDER"
execute store result storage temp.output.menu.body.contents[-1] int 1 run scoreboard players get #users.start_index tpa.variables
data modify storage tpa:tpa temp.output.menu.body.contents[-1] set string storage tpa:tpa temp.output.menu.body.contents[-1]
data modify storage tpa:tpa temp.output.menu.body.contents append value "-"
data modify storage tpa:tpa temp.output.menu.body.contents append value "END_INDEX_VALUE_PLACEHOLDER"
execute store result storage temp.output.menu.body.contents[-1] int 1 run scoreboard players get #users.end_index tpa.variables
data modify storage tpa:tpa temp.output.menu.body.contents[-1] set string storage tpa:tpa temp.output.menu.body.contents[-1]
