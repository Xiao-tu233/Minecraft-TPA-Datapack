# @return: data storage tpa:tpa temp.name
summon minecraft:text_display ~ ~ ~ {alignment:"center",Tags:["tpa.text_display"]}
tag @s add self
data remove storage tpa:tpa temp.text
data modify entity @n[type=minecraft:text_display,tag=tpa.text_display] text set value {selector:"@p[tag=self]"}

# Use key insertion instead of name because key text become empty string when a player was in a team with a team color
data modify storage tpa:tpa temp.name set from entity @n[type=minecraft:text_display,tag=tpa.text_display] text.insertion

# debug
execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §rGot id: ",{storage:"tpa:tpa",nbt:"temp.name"}]

kill @n[type=text_display,tag=tpa.text_display]
tag @s remove self