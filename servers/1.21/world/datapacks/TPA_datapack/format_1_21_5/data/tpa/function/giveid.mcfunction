scoreboard players operation @s tpa.player_id = #global_current tpa.player_id
scoreboard players add #global_current tpa.player_id 1
execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §rGave ID ", {score: {name: "@s", objective: "tpa.player_id"}, color: "aqua"}, " to ",{selector:"@s"},""]

function tpa:back/remove