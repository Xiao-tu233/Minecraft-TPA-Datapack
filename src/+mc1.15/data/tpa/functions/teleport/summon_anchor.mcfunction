# Parent function: tpa:teleport/cal_sim_dist, tpa:teleport/summon_anchor(loop), tpa:teleport/summon_destin_anchor

scoreboard players set #summon_success tpa.variables 0
execute store result score #summon_success tpa.variables run summon armor_stand ~ ~ ~ {Tags: ["tpa.teleport_anchor"], Invisible:1b, Marker:1b, NoGravity:1b, Invulnerable:1b, Silent:1b}

# Debugs
execute unless score #summon_success tpa.variables matches 1 if entity @e[sort=nearest, limit=1, tag=tpa.teleport_anchor] if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §rSucessfully summoned a anchor @ ", {"entity":"@e[sort=nearest, limit=1, tag=tpa.teleport_anchor]","nbt":"Pos", "color":"green"}]

scoreboard players set #summon_again tpa.variables 0
execute unless score #summon_success tpa.variables matches 1 run scoreboard players set #summon_again tpa.variables 1
execute unless entity @e[sort=nearest, limit=1, tag=tpa.teleport_anchor] run scoreboard players set #summon_again tpa.variables 1
execute if score #summon_again tpa.variables matches 1 run function tpa:teleport/summon_anchor