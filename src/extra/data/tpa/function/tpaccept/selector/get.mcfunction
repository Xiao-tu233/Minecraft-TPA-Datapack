# Args: #uid

data modify storage tpa:tpa request_selector.recv append value {sentinel: 1b}
data modify storage tpa:tpa temp.matched_selector set value {}
scoreboard players set #request_selector.setting tpa.variables 0
scoreboard players set #request_selector.removing tpa.variables 0
execute unless data storage tpa:tpa request_selector.recv[0].sentinel run function tpa:tpaccept/selector/loop
data remove storage tpa:tpa request_selector.recv[0]

execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[TPA] Debug: Matched Receive Selector Gotten: ", {storage: "tpa:tpa", nbt: "temp.matched_selector"}]
