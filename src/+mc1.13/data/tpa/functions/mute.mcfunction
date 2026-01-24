
# Usage: /trigger tpa.tpaccept_toggle add 4
execute if score @s tpa.mute matches 4 run scoreboard players set @s tpa.mute 3
execute if score @s tpa.mute matches 5 run scoreboard players set @s tpa.mute 2

# 1: mute(Feature enabled) 0: unmute(feature disabled)
function tpa:load_lang
execute as @s[scores={tpa.mute=2}] run tellraw @s[scores={tpa.output_=1..2}] ["[§bTPA§r]", {"text": "你开启了§a数据包音效§r"}, ". "]
execute as @s[scores={tpa.mute=2}] run title @s[scores={tpa.output_=0..1}] actionbar [{"text": "你开启了§a数据包音效§r", "color":"gold"}]
execute as @s[scores={tpa.mute=3}] run tellraw @s[scores={tpa.output_=1..2}] ["[§bTPA§r]", {"text": "你§a静音§r了数据包"}, ". "]
execute as @s[scores={tpa.mute=3}] run title @s[scores={tpa.output_=0..1}] actionbar [{"text": "你§a静音§r了数据包", "color":"gold"}]
scoreboard players remove @s tpa.mute 2
function tpa:sounds/click
