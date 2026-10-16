# Parent function: tpa:tick (tpa.language triggered in range 1..)
# tpa.selected_language(tpa.slct_lang) is a dummy objective, tpa.language is a trigger objective 

# Trigger inits
scoreboard players operation #language tpa.variables = @s tpa.language
scoreboard players set @s tpa.language 0

# If *1. server has a language chosen* and *2. player is not allowed to choose a language*, block player from selecting a language
scoreboard players set #language_selection_blocked tpa.variables 0
execute if score #player_lang tpa.config matches 0 if score #language tpa.config matches 1.. run scoreboard players set #language_selection_blocked tpa.variables 1

execute if score #language_selection_blocked tpa.variables matches 1 run function tpa:language/block
execute if score #language_selection_blocked tpa.variables matches 0 run function tpa:language/allow