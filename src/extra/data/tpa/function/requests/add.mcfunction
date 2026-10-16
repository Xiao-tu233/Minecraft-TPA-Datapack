# Args: #reqer, #recver, #direction
data modify storage tpa:tpa temp.request set value {reqer: 0, recver: 0, direction: 0, timer: 0}
execute store result storage tpa:tpa temp.request.reqer int 1 run scoreboard players get #reqer tpa.variables
execute store result storage tpa:tpa temp.request.recver int 1 run scoreboard players get #recver tpa.variables
execute store result storage tpa:tpa temp.request.direction int 1 run scoreboard players get #direction tpa.variables
execute store result storage tpa:tpa temp.request.timer int 1 run scoreboard players get #time_out tpa.config

execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §rA new Request has been added: ", {storage: "tpa:tpa", nbt: "temp.request"}]

data modify storage tpa:tpa requests append from storage tpa:tpa temp.request