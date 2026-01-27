execute store result score #i tpa if entity @a
scoreboard players set #is_recver_found tpa 0
execute if score #i tpa matches 1.. run function tpa:recver_loop
tag @a remove not_match