# A candidate must not reuse another record's UID or UUID.
execute if score #users.current_uid tpa.variables = #users.uid tpa.variables run scoreboard players set #users.matches tpa.variables 1
execute if data storage tpa:tpa users[0].uuid run function tpa:users/scan/uuid
