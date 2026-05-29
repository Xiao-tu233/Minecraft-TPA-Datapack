# Parent function: tpa:cancel_req, tpa:tpa, tpa:tpahere, tpa:time_out

# Debugs
execute store result score #i tpa.variables if entity @a
execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §r",{"score":{"name":"#i","objective":"tpa.variables"}}, " players has been counted to be matched with the request."]
execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §rtarget receiver's id is: ", {"score":{"name":"#recver_id","objective":"tpa.variables"}}]

tag @a remove not_match
tag @a remove to_modify

# scoreboard players set #is_recver_found tpa.variables  chai: 
# in tpa:recver_loop                                                        | tpa:recver_test   | (Parent function)
# (recver_id == i + tpa.tpaccept_tgl[@a[scores={tpa.player_id=i}]] == 1) => #matching_status -> #is_recver_found
scoreboard players set #is_recver_found tpa.variables 0
execute if score #i tpa.variables matches 1.. run function tpa:recver_loop
tag @a remove not_match

execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §rLoop broke. Found receiver: [",{"color":"green","selector":"@a[tag=to_modify]"}, "]"]

execute if entity @p[tag=to_modify, scores={tpa.tpaccept_tgl=1}] run scoreboard players add #is_recver_found tpa.variables 1

