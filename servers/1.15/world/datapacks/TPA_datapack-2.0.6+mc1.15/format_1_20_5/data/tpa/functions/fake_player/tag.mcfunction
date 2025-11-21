scoreboard players set #i tpa.variables 0

# First check: switch to hotbar 9
$execute as @p[tag=__tpa__] run player $(name) hotbar 9
scoreboard players set #slot tpa.variables 0
execute store result score #slot tpa.variables run data get entity @s SelectedItemSlot
execute if score #slot tpa.variables matches 8 run scoreboard players add #i tpa.variables 1

# Second check: switch to hotbar 8
$execute as @p[tag=__tpa__] run player $(name) hotbar 8
scoreboard players set #slot tpa.variables 0
execute store result score #slot tpa.variables run data get entity @s SelectedItemSlot
execute if score #slot tpa.variables matches 7 run scoreboard players add #i tpa.variables 1

# Two checks passed, tag fake player
execute if score #i tpa.variables matches 2 run tag @s add fake_player
execute if score #i tpa.variables matches 2 run tag @s remove TPA_user
execute if score #i tpa.variables matches 2 run scoreboard players reset @s tpa.player_id

# switch back slot 1
$player $(name) hotbar 1