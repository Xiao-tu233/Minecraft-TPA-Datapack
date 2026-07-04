# Args: #uid

data modify storage tpa:tpa request_selector.req append value {sentinel: 1b}
data modify storage tpa:tpa temp.matched_selector set value {}
scoreboard players set #request_selector.setting tpa.variables 0
execute unless data storage tpa:tpa request_selector.req[0].sentinel run function tpa:cancel_req/selector/loop
data remove storage tpa:tpa request_selector.req[0]

execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §rMatched Selector Gotten: ", {storage: "tpa:tpa", nbt: "temp.matched_selector"}]