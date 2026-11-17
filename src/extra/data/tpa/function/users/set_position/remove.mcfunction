# Private: capture the unique record while removing it from its old position.
scoreboard players set #users.mode tpa.variables 6
scoreboard players set #users.store_result tpa.variables 1
scoreboard players set #users.remove_current tpa.variables 1
scoreboard players set #users.replace_current tpa.variables 0
scoreboard players set #users.scan_count tpa.variables 1
function tpa:users/scan
execute if score #users.result tpa.variables matches 1 run function tpa:users/set_position/insert
