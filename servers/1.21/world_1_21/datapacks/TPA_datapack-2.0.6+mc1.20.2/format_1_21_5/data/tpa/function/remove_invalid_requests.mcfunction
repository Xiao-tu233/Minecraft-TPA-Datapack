# sum: int = 0
# for player in players:
#     sum += player.id
# offline_id = sum_temp - sum

# Use spec's id if player is spec
execute if score @s tpa.player_id = @s tpa.player_id run scoreboard players operation #offline_id tpa.variables = @s tpa.player_id

# Invalid requests: @a[tp_to = #offline_id] -> offline_id
# lang keys: reqer_recver_invalid

scoreboard players set #i tpa.variables 0
execute store result score #j tpa.variables if entity @a[scores={tpa.tp_to=2..}]
execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §rLoop starts, times: ",{score:{name:"#i",objective:"tpa.variables"}}]

tag @a remove not_match
tag @a remove to_modify

scoreboard players set #is_reqer_found tpa.variables 0
execute if score #j tpa.variables matches 1.. run function tpa:remove_invalid_requests_
tag @a remove not_match

execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §r",{selector:"@s"},"'s tp status changed to not available, whose id is ", {score: {name: "#offline_id", objective: "tpa.variables"}}, ". Canceled requests to him."]
