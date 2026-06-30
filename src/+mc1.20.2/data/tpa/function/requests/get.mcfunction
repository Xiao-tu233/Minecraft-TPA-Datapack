# Args: #reqer, #recver, #direction
data modify storage tpa:tpa requests append value {sentinel: 1b}
data modify storage tpa:tpa temp.matched_requests set value []
scoreboard players set #requests.popping tpa.variables 0
execute unless data storage tpa:tpa requests[0].sentinel run function tpa:requests/loop
data remove storage tpa:tpa requests[0]


execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §rMatched Requests Gotten: ", {storage: "tpa:tpa", nbt: "temp.matched_requests"}]
