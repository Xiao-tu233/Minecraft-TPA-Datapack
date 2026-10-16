# Parent function: tpa:warp

data remove storage tpa:tpa temp.warp_result
scoreboard players set #warp.store_result tpa.variables 1
scoreboard players set #warp.remove_current tpa.variables 0
scoreboard players set #warp.replace_current tpa.variables 0
scoreboard players set #warp.scan_count tpa.variables 1
function tpa:warp/scan

execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug§r: Warp get: found for ", {selector: "@s"}, {translate: "(UID:§a%s§r)", with: [{score: {name: "#uid", objective: "tpa.variables"}}]}]