scoreboard players set #condition tpa.variables 0
execute if score #tp_spec tpa.config matches 0 if entity @s[gamemode=spectator] run scoreboard players set #condition tpa.variables 1
execute if score #time_out tpa.config matches 0 run scoreboard players set #condition tpa.variables 2
execute if score #tp_to tpa.variables = @s tpa.player_id run scoreboard players set #condition tpa.variables 3
execute if score #tp_to tpa.variables = @s tpa.tp_to if score #tp_to tpa.variables matches 2.. run scoreboard players set #condition tpa.variables 4
execute if score @s tpa.tp_to matches 2.. run scoreboard players set #condition tpa.variables 5
# conditions:
# 0: no condition met
# 1: requester is spec
# 2: tp was disabled
# 3: target is requester himself
# 4: request has been sent before
# 5: request sent before was not the same as the current one
execute if score #condition tpa.variables matches 1..4 run function tpa:sounds/no
execute if score #condition tpa.variables matches 1 run tellraw @s[scores={tpa.output=1..2}] [{"storage":"tpa:tpa", "nbt":"temp.lang.header"}, {"storage":"tpa:tpa", "nbt":"temp.lang.reqer_spec"}, ". "]
execute if score #condition tpa.variables matches 1 run title @s[scores={tpa.output=0..1}] actionbar [{"storage":"tpa:tpa", "nbt":"temp.lang.reqer_spec", "color":"red"}]
execute if score #condition tpa.variables matches 2 run tellraw @s[scores={tpa.output=1..2}] [{"storage":"tpa:tpa", "nbt":"temp.lang.header"}, {"storage":"tpa:tpa", "nbt":"temp.lang.reqer_disabled"}, ". "]
execute if score #condition tpa.variables matches 2 run title @s[scores={tpa.output=0..1}] actionbar [{"storage":"tpa:tpa", "nbt":"temp.lang.reqer_disabled", "color":"red"}]
execute if score #condition tpa.variables matches 3 run tellraw @s[scores={tpa.output=1..2}] [{"storage":"tpa:tpa", "nbt":"temp.lang.header"}, {"storage":"tpa:tpa", "nbt":"temp.lang.reqer_self"}, ". "]
execute if score #condition tpa.variables matches 3 run title @s[scores={tpa.output=0..1}] actionbar [{"storage":"tpa:tpa", "nbt":"temp.lang.reqer_self", "color":"red"}]
execute if score #condition tpa.variables matches 4 run tellraw @s[scores={tpa.output=1..2}] [{"storage":"tpa:tpa", "nbt":"temp.lang.header"}, {"storage":"tpa:tpa", "nbt":"temp.lang.reqer_spam"}, ". "]
execute if score #condition tpa.variables matches 4 run title @s[scores={tpa.output=0..1}] actionbar [{"storage":"tpa:tpa", "nbt":"temp.lang.reqer_spam", "color":"red"}]
