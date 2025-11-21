# @input: {key:key:temp.commands: list[str]}

data modify storage tpa:tpa temp.key_commands set from storage key:key temp.commands
data modify storage tpa:tpa temp.not_matching_commands set value []

scoreboard players set #i tpa.variables 0
function tpa:key_handler_loop

data modify storage key:key temp.commands set from storage tpa:tpa temp.not_matching_commands