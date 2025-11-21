# Parent Function: tpa:book/each_page, tpa:book/each_lines(loop)

data remove storage tpa:tpa book.arg
execute store result storage tpa:tpa book.arg.id int 1 run scoreboard players get #i tpa.variables
execute store result storage tpa:tpa book.arg.key int 1 run scoreboard players get #j tpa.variables
execute as @a[scores={tpa.player_id=2..}] if score @s tpa.player_id = #i tpa.variables \
run function tpa:get_id
data modify storage tpa:tpa book.arg.name set from storage tpa:tpa temp.name
execute as @a[scores={tpa.player_id=2..}] if score @s tpa.player_id = #i tpa.variables \
run function tpa:book/store_id with storage tpa:tpa book.arg
scoreboard players add #i tpa.variables 1



# If Player amount < 14, this function will work forever, so we do math below
# #flag = ( len(@a[scores={tpa.player_id=2..}]) % 14 == #j ) and (#page_current == #pages)
# Break if #flag is True
execute store result score #flag tpa.variables if entity @a[scores={tpa.player_id=2..}]
scoreboard players operation #flag tpa.variables %= #14 tpa.variables
execute if score #pages_current tpa.variables = #pages tpa.variables if score #flag tpa.variables = #j tpa.variables run return 0
execute if score #j tpa.variables < #14 tpa.variables run function tpa:book/each_lines