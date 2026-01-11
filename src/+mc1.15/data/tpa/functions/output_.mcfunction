# Parent function: tpa:tick_
# output | output_ | shows
# 1      | 0       | Action だけ
# 0      | 1       | Chat&Action
# 2      | 2       | Chat だけ

execute if score @s tpa.output matches 1 run scoreboard players set @s tpa.output_ 0
execute if score @s tpa.output matches 0 run scoreboard players set @s tpa.output_ 1
execute if score @s tpa.output matches 2 run scoreboard players set @s tpa.output_ 2