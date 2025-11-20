# Parent Function: tpa:book, tpa:each_page(loop)
data modify storage tpa:tpa temp.book.lines set value []
scoreboard players set #lines tpa.variables 0
function tpa:book/each_lines
execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §rNow gotten page ",{score: {name: "#pages_current",objective: "tpa.variables"}}," content: §a",{storage:"tpa:tpa",nbt:"temp.book.lines"}]

function tpa:book/store_page

scoreboard players add #pages tpa.variables 1
execute if score #pages tpa.variables <= #max_page tpa.variables run function tpa:book/each_page