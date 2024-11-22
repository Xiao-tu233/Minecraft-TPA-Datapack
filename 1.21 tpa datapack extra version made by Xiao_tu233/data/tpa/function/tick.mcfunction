scoreboard players enable @a tpa
scoreboard players enable @a help
scoreboard players enable @a language
scoreboard players enable @a tpaccept
scoreboard players enable @a idfix
scoreboard players enable @a back

function tpa:tpa
execute as @a[scores={idfix=1}] run function tpa:idfix
execute as @a[scores={help=1}] run function tpa:help
execute unless score #language tpa matches 0..2 run scoreboard players set #language tpa 0
execute as @a[scores={language=3..}] run scoreboard players set @s language 0
execute as @a unless score @s player_id matches 2.. run function tpa:giveid
