# Parent Function: tpa:book/each_page, tpa:book/each_lines(loop)

data remove storage tpa:tpa book.arg
data remove storage tpa:tpa temp.name
execute store result storage tpa:tpa book.arg.id int 1 run scoreboard players get #i tpa.variables
execute as @a if score @s tpa.player_id = #i tpa.variables \
    run function tpa:get_id
data modify storage tpa:tpa book.arg.name set from storage tpa:tpa temp.name
execute if data storage tpa:tpa book.arg.name run function tpa:book/store_id with storage tpa:tpa book.arg

# Add empty lines to fill the page if there are not enough players
execute if score #j tpa.variables >= #avail_players tpa.variables run data modify storage tpa:tpa book.each_page append value "\n"
execute if score #j tpa.variables >= #avail_players tpa.variables run scoreboard players add #current_line tpa.variables 1

# i++
scoreboard players add #i tpa.variables 1

# current_line < 14
execute if score #current_line tpa.variables >= #14 tpa.variables run return 0

# Recursive call
function tpa:book/each_lines