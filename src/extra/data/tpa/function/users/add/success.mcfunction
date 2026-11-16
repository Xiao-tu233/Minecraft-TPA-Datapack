# Private: called after the parent function's checks pass.
data modify storage tpa:tpa temp.users.result set from storage tpa:tpa temp.users.write
data modify storage tpa:tpa temp.users.results append from storage tpa:tpa temp.users.write
scoreboard players set #users.count tpa.variables 1
scoreboard players set #users.result tpa.variables 1
execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6Debug§r: users record added: ", {storage: "tpa:tpa", nbt: "temp.users.write"}]
