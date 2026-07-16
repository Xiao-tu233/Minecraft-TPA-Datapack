# Parent function: tpa:initialize, tpa:tick
forceload add 29999984 29999984
execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug§r: Attempting to summon Text Display for component parsing."]
summon minecraft:text_display 29999984 336 29999984 {alignment:"center", Tags: ["tpa.text_display"]}