# Public: temp.users.input.uuid (native UUID int array) -> result/status.
scoreboard players set #users.result tpa.variables 3
data remove storage tpa:tpa temp.users.result
data modify storage tpa:tpa temp.users.results set value []
execute if data storage tpa:tpa temp.users.input.uuid[3] unless data storage tpa:tpa temp.users.input.uuid[4] run function tpa:users/find_uuid/valid
