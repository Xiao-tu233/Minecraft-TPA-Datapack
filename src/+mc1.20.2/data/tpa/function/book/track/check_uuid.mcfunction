# Parent function: tpa:book/track/check_entity
scoreboard players set #uuid_match tpa.variables 0
execute store result score #uuid tpa.variables run data get storage bs:out raycast.targeted_entity[0]
execute store result score #uuid_ tpa.variables run data get entity @s UUID[0]
execute if score #uuid tpa.variables = #uuid_ tpa.variables run scoreboard players add #uuid_match tpa.variables 1
execute store result score #uuid tpa.variables run data get storage bs:out raycast.targeted_entity[1]
execute store result score #uuid_ tpa.variables run data get entity @s UUID[1]
execute if score #uuid tpa.variables = #uuid_ tpa.variables run scoreboard players add #uuid_match tpa.variables 1
execute store result score #uuid tpa.variables run data get storage bs:out raycast.targeted_entity[2]
execute store result score #uuid_ tpa.variables run data get entity @s UUID[2]
execute if score #uuid tpa.variables = #uuid_ tpa.variables run scoreboard players add #uuid_match tpa.variables 1
execute store result score #uuid tpa.variables run data get storage bs:out raycast.targeted_entity[3]
execute store result score #uuid_ tpa.variables run data get entity @s UUID[3]
execute if score #uuid tpa.variables = #uuid_ tpa.variables run scoreboard players add #uuid_match tpa.variables 1

execute if score #uuid_match tpa.variables matches 4 run function tpa:book/track/check_entity_slots