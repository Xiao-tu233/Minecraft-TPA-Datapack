# Parent: tpa:detect_join
scoreboard players set #is_fake_player tpa.variables 0
$execute store result score #is_fake_player tpa.variables run $(cmd)$(fake)
execute if score #is_fake_player tpa.variables matches 1 run tag @s add tpa.fake_player