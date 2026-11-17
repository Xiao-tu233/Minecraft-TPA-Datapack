# Private: record the 1-based physical position of a matching UID.
scoreboard players operation #users.position tpa.variables = #users.current_slot tpa.variables
scoreboard players set #users.matches tpa.variables 1
