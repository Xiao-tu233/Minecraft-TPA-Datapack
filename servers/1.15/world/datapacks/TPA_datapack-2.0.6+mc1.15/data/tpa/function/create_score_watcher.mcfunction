# @param: {objective: str = "tpa.variables", name: str}
execute if score #debug_mode tpa.variables matches 1 if entity @s run tellraw @s ["[§bTPA§r] §6 Debug§r: Function caller must be a command block instead of a entity."]
execute if entity @s run return 0

data modify storage tpa:tpa temp.empty_string set value ""
$execute store result score #is_variable tpa.variables run data modify storage tpa:tpa temp.empty_string set value "$(objective)"

execute align y run summon text_display ~ ~2 ~ {alignment: "center", Rotation: [180.0f, 0.0f]}
$execute if score #is_variable tpa.variables matches 1 run setblock ~ ~ ~ minecraft:repeating_command_block[conditional=false]{Command:"data modify entity @n[type=minecraft:text_display] text set value '[\"$(name): $(objective): \", {\"score\": {\"name\": \"$(name)\", \"objective\": \"$(objective)\"}}]'",auto:1b,conditionMet:1b,powered:0b}
$execute unless score #is_variable tpa.variables matches 1 run setblock ~ ~ ~ minecraft:repeating_command_block[conditional=false]{Command:"data modify entity @n[type=minecraft:text_display] text set value '[\"$(name): \", {\"score\": {\"name\": \"$(name)\", \"objective\": \"tpa.variables\"}}]'",auto:1b,conditionMet:1b,powered:0b}
