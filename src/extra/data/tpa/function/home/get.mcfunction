# Parent function: tpa:home/menu, tpa:home/has_home

data remove storage tpa:tpa temp.home_result
execute if score #home.match_all tpa.variables matches 1 run data modify storage tpa:tpa temp.home_result set value {}
scoreboard players set #home.store_result tpa.variables 1
scoreboard players set #home.remove_current tpa.variables 0
scoreboard players set #home.replace_current tpa.variables 0
scoreboard players operation #uid tpa.variables = @s tpa.uid
function tpa:home/scan

execute if score #debug_mode tpa.config matches 1 if data storage tpa:tpa temp.home_result run tellraw @a ["[§bTPA§r] §6 Debug§r: Home get: found for ", {selector: "@s"}, {translate: "(UID:§a%s§r)", with: [{score: {name: "#uid", objective: "tpa.variables"}}]}]
execute if score #debug_mode tpa.config matches 1 unless data storage tpa:tpa temp.home_result run tellraw @a ["[§bTPA§r] §6 Debug§r: Home get: not found for ", {selector: "@s"}, {translate: "(UID:§a%s§r)", with: [{score: {name: "#uid", objective: "tpa.variables"}}]}]
