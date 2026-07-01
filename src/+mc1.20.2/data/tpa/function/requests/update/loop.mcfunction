execute store result score #requests.current_reqer tpa.variables run data get storage tpa:tpa requests[0].reqer
execute store result score #requests.current_recver tpa.variables run data get storage tpa:tpa requests[0].recver
execute store result score #requests.current_timer tpa.variables run data get storage tpa:tpa requests[0].timer

# Validity check
execute if score #requests.current_timer tpa.variables matches 0 run scoreboard players set #requests.invalid tpa.variables 1

scoreboard players set #requests.vaild_players tpa.variables 0
execute as @a if score @s tpa.uid = #requests.current_recver tpa.variables if predicate tpa:available run scoreboard players add #requests.vaild_players tpa.variables 1
execute as @a if score @s tpa.uid = #requests.current_reqer tpa.variables if predicate tpa:available run scoreboard players add #requests.vaild_players tpa.variables 1
execute if score #requests.vaild_players tpa.variables matches ..1 run scoreboard players set #requests.invalid tpa.variables 2

# Tick timer
scoreboard players remove #requests.current_timer tpa.variables 1
execute store result storage tpa:tpa requests[0].timer int 1 run scoreboard players get #requests.current_timer tpa.variables

data modify storage tpa:tpa requests append from storage tpa:tpa requests[0]
execute if score #requests.invalid tpa.variables matches 1..2 run function tpa:requests/update/remove
data remove storage tpa:tpa requests[0]

execute unless data storage tpa:tpa requests[0].sentinel run function tpa:requests/update/loop