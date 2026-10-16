# reqer uid, recver uid, req direction(bool), time out(int, 单位tick)

execute store result score #requests.current_reqer tpa.variables run data get storage tpa:tpa requests[0].reqer
execute store result score #requests.current_recver tpa.variables run data get storage tpa:tpa requests[0].recver
execute store result score #requests.current_direction tpa.variables run data get storage tpa:tpa requests[0].direction

scoreboard players set #requests.conditions_met tpa.variables 0
execute if score #requests.current_reqer tpa.variables = #reqer tpa.variables run scoreboard players add #requests.conditions_met tpa.variables 1
execute unless score #reqer tpa.variables = #reqer tpa.variables run scoreboard players add #requests.conditions_met tpa.variables 1
execute if score #requests.current_recver tpa.variables = #recver tpa.variables run scoreboard players add #requests.conditions_met tpa.variables 1
execute unless score #recver tpa.variables = #recver tpa.variables run scoreboard players add #requests.conditions_met tpa.variables 1
execute if score #requests.current_direction tpa.variables = #direction tpa.variables run scoreboard players add #requests.conditions_met tpa.variables 1
execute unless score #direction tpa.variables = #direction tpa.variables run scoreboard players add #requests.conditions_met tpa.variables 1

execute if score #requests.conditions_met tpa.variables matches 3 run data modify storage tpa:tpa temp.matched_requests append from storage tpa:tpa requests[0]

data modify storage tpa:tpa requests append from storage tpa:tpa requests[0]
execute if score #requests.popping tpa.variables matches 1 if score #requests.conditions_met tpa.variables matches 3 run data remove storage tpa:tpa requests[-1]
data remove storage tpa:tpa requests[0]

execute unless data storage tpa:tpa requests[0].sentinel run function tpa:requests/loop