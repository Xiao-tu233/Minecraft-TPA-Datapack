# Parent function: tpa:tpaccept, tpa:tpadeny

execute store result score #i tpa.variables if entity @a[scores={tpa.tp_to=2..}]
execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §rLoop starts, times: ",{"score":{"name":"#i","objective":"tpa.variables"}}]

execute if score #debug_mode tpa.config matches 1 if score #reqer_id tpa.variables matches 2.. run tellraw @a ["[§bTPA§r] §6 Debug: §rtarget requester's id is: ", {"score":{"name":"#reqer_id","objective":"tpa.variables"}}]
execute if score #debug_mode tpa.config matches 1 unless score #reqer_id tpa.variables matches 2.. run tellraw @a ["[§bTPA§r] §6 Debug: §rtarget requester's is not designated"]

tag @a remove not_match
tag @a remove to_modify

# return chain: 
# in tpa:reqer_loop  | tpa:reqer_test   | (Parent function)
# (player_id == tp_to ( reqer's player_id == reqer_id )) => #matching_status -> #is_reqer_found
scoreboard players set #is_reqer_found tpa.variables 0
execute if score #i tpa.variables matches 1.. run function tpa:reqer_loop
tag @a remove not_match

execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §rLoop broke. Found requester: [",{"color":"green","selector":"@a[tag=to_modify]"}, "]"]
execute if score @p[tag=to_modify] tpa.tp_here matches 1 run scoreboard players add #is_reqer_found tpa.variables 1