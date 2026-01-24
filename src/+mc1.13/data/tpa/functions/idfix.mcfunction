scoreboard players set @s tpa.idfix 0
scoreboard players set #condition tpa.variables 0

execute if score #idfix_cooldown tpa.config matches -1 run scoreboard players set #condition tpa.variables 1
execute if score @s tpa.idfix_cd matches 1.. run scoreboard players set #condition tpa.variables 2

execute if score #condition tpa.variables matches 1 run function tpa:sounds/no
execute if score #condition tpa.variables matches 1 run tellraw @s[scores={tpa.output_=1..2}] [{"text": "[§bTPA§r] "}, {"text": "服务器不允许§aID修复§r"}, ". "]
execute if score #condition tpa.variables matches 1 run title @s[scores={tpa.output_=0..1}] actionbar [{"text": "服务器不允许§aID修复§r", "color":"red"}]

execute if score #condition tpa.variables matches 2 run function tpa:sounds/no
execute if score #condition tpa.variables matches 2 run tellraw @s[scores={tpa.output_=1..2}] [{"text": "[§bTPA§r] "}, {"text": "§aID修复§r还在冷却中"}, ". "]
execute if score #condition tpa.variables matches 2 run title @s[scores={tpa.output_=0..1}] actionbar [{"text": "§aID修复§r还在冷却中", "color":"red"}]

execute if score #condition tpa.variables matches 0 run function tpa:idfix/main