scoreboard players enable @a tpa
scoreboard players enable @a tpa.tpa
scoreboard players enable @a tpa.help
scoreboard players enable @a tpa.idfix

execute as @a[scores={tpa=1..}] run function tpa:tpa
execute as @a[scores={tpa.tpa=1..}] run function tpa:tpa
execute as @a[scores={tpa.idfix=1}] run function tpa:idfix
execute as @a[scores={tpa.help=1}] run function tpa:help

# offline detect
execute store result score #player_online_temp tpa if entity @a
execute if score #player_online_temp tpa < #player_online tpa run function tpa:remove_offline
scoreboard players operation #player_online tpa = #player_online_temp tpa


# show [TPA menu] whenever some1 logged on
execute as @a unless score @s tpa.player_id = @s tpa.player_id run function tpa:detect_join
execute as @p[scores={tpa.player_id=0..1}] run function tpa:giveid
