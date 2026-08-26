
# Usage: /trigger tpa.mute add 4
execute if score @s tpa.mute matches 4 run scoreboard players set @s tpa.mute 3
execute if score @s tpa.mute matches 5 run scoreboard players set @s tpa.mute 2


# 1: mute(Feature enabled) 0: unmute(feature disabled)
function tpa:load_lang
function tpa:sounds/click
execute as @s[scores={tpa.mute=2}] run function tpa:mute/disable
execute as @s[scores={tpa.mute=3}] run function tpa:mute/enable

scoreboard players remove @s tpa.mute 2