# Public: temp.users.input.{start,end}, inclusive 1-based menu positions.
# Returns temp.users.results in storage order; positions are NOT persistent UIDs.
scoreboard players set #users.result tpa.variables 3
data remove storage tpa:tpa temp.users.result
data modify storage tpa:tpa temp.users.results set value []
scoreboard players set #users.start tpa.variables 0
scoreboard players set #users.end tpa.variables 0
execute store result score #users.start tpa.variables run data get storage tpa:tpa temp.users.input.start
execute store result score #users.end tpa.variables run data get storage tpa:tpa temp.users.input.end
execute if score #users.start tpa.variables matches 1.. if score #users.end tpa.variables >= #users.start tpa.variables run function tpa:users/get_range/valid
