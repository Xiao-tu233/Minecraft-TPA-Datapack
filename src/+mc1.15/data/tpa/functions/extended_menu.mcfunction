#! Originally named tpa:tpamenu
# Parent Function tpa:tick
scoreboard players operation #page tpa.variables = @s tpa.extended_menu
scoreboard players set @s tpa.extended_menu 0
data remove storage tpa:tpa temp.extended_menu
# C style:
# page += 1
# next = page
# page -= 2
# previous = page
# page += 1
# 
# int indexes[6];
# for (
# 	int index = (page - 1) * 5; 
#   index <= page * 5;
#   index++
# ) {indexes[index % 5] = index;}
execute store result storage tpa:tpa temp.extended_menu.page int 1 run scoreboard players get #page tpa.variables
scoreboard players add #page tpa.variables 1
execute store result storage tpa:tpa temp.extended_menu.next int 1 run scoreboard players get #page tpa.variables
scoreboard players remove #page tpa.variables 2
execute store result storage tpa:tpa temp.extended_menu.previous int 1 run scoreboard players get #page tpa.variables
scoreboard players add #page tpa.variables 1

scoreboard players operation #index tpa.variables = #page tpa.variables
scoreboard players remove #index tpa.variables 1
scoreboard players operation #index tpa.variables *= #5 tpa.variables
execute store result storage tpa:tpa temp.extended_menu.index_0 int 1 run scoreboard players get #index tpa.variables
scoreboard players add #index tpa.variables 1
execute store result storage tpa:tpa temp.extended_menu.index_1 int 1 run scoreboard players get #index tpa.variables
scoreboard players add #index tpa.variables 1
execute store result storage tpa:tpa temp.extended_menu.index_2 int 1 run scoreboard players get #index tpa.variables
scoreboard players add #index tpa.variables 1
execute store result storage tpa:tpa temp.extended_menu.index_3 int 1 run scoreboard players get #index tpa.variables
scoreboard players add #index tpa.variables 1
execute store result storage tpa:tpa temp.extended_menu.index_4 int 1 run scoreboard players get #index tpa.variables
scoreboard players add #index tpa.variables 1
execute store result storage tpa:tpa temp.extended_menu.index_5 int 1 run scoreboard players get #index tpa.variables
scoreboard players add #index tpa.variables 1
# ---- end C style ----

function tpa:extended_menu_pages with storage tpa:tpa temp.extended_menu
