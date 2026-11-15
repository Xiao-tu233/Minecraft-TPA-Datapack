# Private: current name or an observed previous name, once per record.
execute if data storage tpa:tpa users[0].name run function tpa:users/scan/current_name
execute if data storage tpa:tpa temp.users.input{include_previous_names: 1b} if data storage tpa:tpa users[0].previous_names[0] unless score #users.matches tpa.variables matches 1 run function tpa:users/scan/previous_names
