# Parent function: tpa:book/each_lines, tpa:book/store_interaction_context, tpa:first_join, tpa:here, tpa:home
# @return: data storage tpa:tpa temp.name
summon minecraft:text_display ~ ~ ~ {alignment:"center",Tags:["tpa.text_display"]}
tag @s add self
data remove storage tpa:tpa temp.text
data modify entity @e[sort=nearest, limit=1, type=minecraft:text_display,tag=tpa.text_display] text set value '{"selector":"@p[tag=self]"}'

# Remove a quote by using macro function
function tpa:get_name_macro with entity @e[sort=nearest, limit=1, type=minecraft:text_display,tag=tpa.text_display]
  # Use key insertion instead of name because key text become empty string when a player was in a team with a team color
data modify storage tpa:tpa temp.name set from storage tpa:tpa temp.name.insertion

# debug
execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug§r: Got name: ",{"storage":"tpa:tpa","nbt":"temp.name"}]

kill @e[sort=nearest, limit=1, type=text_display,tag=tpa.text_display]
tag @s remove self