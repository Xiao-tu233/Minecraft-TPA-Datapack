# Parent function: tpa:back/available

data remove storage tpa:tpa temp.back_result 
scoreboard players set #back.store_result tpa.variables 1
scoreboard players set #back.remove_current tpa.variables 0
scoreboard players set #back.replace_current tpa.variables 0
scoreboard players operation #uid tpa.variables = @s tpa.uid
function tpa:back/scan

execute if score #debug_mode tpa.config matches 1 if data storage tpa:tpa temp.back_result run \
    tellraw @a ["[§bTPA§r] §6 Debug§r: Back get: found for ", {selector: "@s"}, {translate: "(UID:§a%s§r)", with: [{score: {name: "#uid", objective: "tpa.variables"}}]}]
execute if score #debug_mode tpa.config matches 1 unless data storage tpa:tpa temp.back_result run \
    tellraw @a ["[§bTPA§r] §6 Debug§r: Back get: not found for ", {selector: "@s"}, {translate: "(UID:§a%s§r)", with: [{score: {name: "#uid", objective: "tpa.variables"}}]}]