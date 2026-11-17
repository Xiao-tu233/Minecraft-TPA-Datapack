# Private: scan the flat users list with sentinel rotation, starting at [0].
# Records: {uid: int, uuid: int[4] (optional for unbound legacy records),
#           name: string, previous_names: List[string]}.
# Modes: 0 UID, 1 UUID, 2 name, 3 candidate UID/UUID conflict,
#        4 replace a validated UID, 6 remove UID.
data remove storage tpa:tpa temp.users.result
data modify storage tpa:tpa temp.users.results set value []
scoreboard players set #users.count tpa.variables 0
scoreboard players set #users.removed tpa.variables 0
scoreboard players set #users.result tpa.variables 3
# Reject the legacy name list explicitly, including versions with mixed NBT lists.
scoreboard players set #users.scan_valid tpa.variables 1
execute if data storage tpa:tpa users[0] unless data storage tpa:tpa users[0].uid run scoreboard players set #users.scan_valid tpa.variables 0
execute if score #users.scan_valid tpa.variables matches 1 run function tpa:users/scan/start
