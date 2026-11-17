# Private: matching entries are updated in place before rotating.
scoreboard players set #users.page.remove_match tpa.variables 0
scoreboard players set #users.page.current_uid tpa.variables 0
execute store result score #users.page.current_uid tpa.variables run data get storage tpa:tpa users_pages[0].uid
execute if score #users.page.current_uid tpa.variables = #users.page.uid tpa.variables run function tpa:users/page/scan/match
execute unless score #users.page.remove_match tpa.variables matches 1 run data modify storage tpa:tpa users_pages append from storage tpa:tpa users_pages[0]
data remove storage tpa:tpa users_pages[0]
execute unless data storage tpa:tpa users_pages[0].sentinel run function tpa:users/page/scan/loop
