# Parent Function: tpa:book/each_page, tpa:book/each_lines(loop)

data remove storage tpa:tpa temp.args
execute store result storage tpa:tpa temp.args.id int 1 run scoreboard players get #i tpa.variables
# execute store result storage tpa:tpa temp.args.key int 1 run scoreboard players get #j tpa.variables

# Get the name of the matching player
data remove storage tpa:tpa temp.name
execute as @a[scores={tpa.player_id=2..}] if score @s tpa.player_id = #i tpa.variables \
    run function tpa:get_name

# Append name to the text
execute if data storage tpa:tpa temp.name \
    run function tpa:book/store_id with storage tpa:tpa temp.args

# i++
scoreboard players add #i tpa.variables 1

# If Player amount < 14, this function will work forever, so we do math below
# #flag = ( lines_of_last_page == #lines ) and (#pages == #max_page)
# Break if #flag is True
execute if score #pages tpa.variables >= #max_page tpa.variables if score #lines tpa.variables >= #lines_of_last_page tpa.variables run return 0
execute if score #j tpa.variables >= #14 tpa.variables run return 0
function tpa:book/each_lines