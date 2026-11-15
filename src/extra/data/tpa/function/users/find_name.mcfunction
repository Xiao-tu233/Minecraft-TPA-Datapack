# Public: temp.users.input.name, optional include_previous_names: 1b.
# All matching users go into temp.users.results, once per UID record.
# A name match is a search result, never proof of ownership.
scoreboard players set #users.result tpa.variables 3
data remove storage tpa:tpa temp.users.result
data modify storage tpa:tpa temp.users.results set value []
execute if data storage tpa:tpa temp.users.input.name run function tpa:users/find_name/valid
