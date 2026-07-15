function tpa:back/set
execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §r", {selector:"@s"}, "'s death was detected, back pos set."]