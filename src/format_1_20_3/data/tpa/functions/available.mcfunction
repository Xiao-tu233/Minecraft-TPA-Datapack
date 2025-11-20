# Parent function: tpa:tick(mc version: 1.20.2 - 1.20.4)

# (
#     ( (tp_spec == 0 且 非旁观者) ) 
#     或 (tp_spec == 1)
# )
# 且
# (
#     (carpet_fake_player_fix == 0)
#     或 (carpet_fake_player_fix == 1 且 实体带 tag=tpa.fake_player)
# )

scoreboard players set @s tpa.available 0
scoreboard players set #match_count tpa.variables 0

execute if score #tp_spec tpa.config matches 0 if entity @s[gamemode=!spectator] run scoreboard players add #match_count tpa.variables 1
execute if score #tp_spec tpa.config matches 1 run scoreboard players add #match_count tpa.variables 1

execute if score #carpet_fake_player_fix tpa.config matches 1 if entity @s[tag=tpa.fake_player] run scoreboard players add #match_count tpa.variables 1
execute if score #carpet_fake_player_fix tpa.config matches 0 run scoreboard players add #match_count tpa.variables 1

execute if score #match_count tpa.variables matches 2 run scoreboard players set @s tpa.available 1