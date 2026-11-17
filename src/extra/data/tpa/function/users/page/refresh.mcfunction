# Private: five user records per page; empty storage keeps page 1 available.
# TODO: the UID-slot menu must replace this record-count bound with a UID bound.
scoreboard players set #users.total tpa.variables 0
execute store result score #users.total tpa.variables run data get storage tpa:tpa users
scoreboard players set #users.page_size tpa.variables 5
scoreboard players operation #users.total_pages tpa.variables = #users.total tpa.variables
scoreboard players add #users.total_pages tpa.variables 4
scoreboard players operation #users.total_pages tpa.variables /= #users.page_size tpa.variables
execute if score #users.total_pages tpa.variables matches ..0 run scoreboard players set #users.total_pages tpa.variables 1
