scoreboard players set #users.mode tpa.variables 7
scoreboard players set #users.store_result tpa.variables 0
scoreboard players set #users.remove_current tpa.variables 0
scoreboard players set #users.replace_current tpa.variables 0
scoreboard players set #users.scan_count tpa.variables 1
function tpa:users/scan
execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6Debug§r: users records swapped at positions ", {score: {name: "#users.swap_a", objective: "tpa.variables"}}, " and ", {score: {name: "#users.swap_b", objective: "tpa.variables"}}]
