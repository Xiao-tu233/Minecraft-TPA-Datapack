# Parent Function: tpa:book, tpa:each_page(loop)
data remove storage tpa:tpa book.each_page
data modify storage tpa:tpa book.each_page set value [""]
scoreboard players set #current_line tpa.variables 1
function tpa:book/each_lines

execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §rNow gotten page ",{score: {name: "#pages_current",objective: "tpa.variables"}}," content: §a",{storage:"tpa:tpa",nbt:"book.each_page"}]

item modify entity @s weapon.mainhand {function:"minecraft:set_written_book_pages", mode: "append", pages: [{storage:"tpa:tpa", nbt:"book.each_page[]", separator: '', interpret: 1b }]}

# j >= avail_players
execute if score #j tpa.variables >= #avail_players tpa.variables run return 0

# Recuisive call
function tpa:book/each_page