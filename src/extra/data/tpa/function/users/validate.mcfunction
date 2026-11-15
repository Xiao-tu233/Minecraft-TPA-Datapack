# Private: validate temp.users.candidate without changing it.
scoreboard players set #users.valid tpa.variables 0
scoreboard players set #users.uid tpa.variables 0
execute store result score #users.uid tpa.variables run data get storage tpa:tpa temp.users.candidate.uid
execute if score #users.uid tpa.variables matches 1.. if data storage tpa:tpa temp.users.candidate.name unless data storage tpa:tpa temp.users.candidate{name: ""} if data storage tpa:tpa temp.users.candidate.uuid[3] unless data storage tpa:tpa temp.users.candidate.uuid[4] run scoreboard players set #users.valid tpa.variables 1
