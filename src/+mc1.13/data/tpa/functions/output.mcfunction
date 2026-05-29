# Usage: /trigger tpa.output add 6
execute if score @s tpa.output matches 6 run scoreboard players set @s tpa.output 4
execute if score @s tpa.output matches 7 run scoreboard players set @s tpa.output 5
execute if score @s tpa.output matches 8 run scoreboard players set @s tpa.output 3

function tpa:load_lang
function tpa:sounds/click
execute as @s[scores={tpa.output=3}] run tellraw @s [{"text": "[§bTPA§r] "}, {"text": "你将输出位置切换为§a聊天栏和动作栏§r"}, ". "]
execute as @s[scores={tpa.output=3}] run title @s actionbar [{"text": "你将输出位置切换为§a聊天栏和动作栏§r", "color":"gold"}]
execute as @s[scores={tpa.output=4}] run title @s actionbar [{"text": "你将输出位置切换为§a仅动作栏§r", "color":"gold"}]
execute as @s[scores={tpa.output=5}] run tellraw @s [{"text": "[§bTPA§r] "}, {"text": "你将输出位置切换为§a仅聊天栏§r"}, ". "]
scoreboard players remove @s tpa.output 3
