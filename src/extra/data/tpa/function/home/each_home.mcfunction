# Parent Function: tpa:home/menu
data remove storage tpa:tpa temp.args.id
execute store result storage tpa:tpa temp.args.id int 1 run scoreboard players get #i tpa.variables

# Check is home exist
scoreboard players set #is_exist tpa.variables 0
function tpa:home/is_exist with storage tpa:tpa temp.args

# if not exist, show new button
execute if score #is_exist tpa.variables matches 0 if score #i tpa.variables matches 1.. \
    run function tpa:home/missing with storage tpa:tpa temp.args

# if exist: show act, del & edit buttons
execute if score #is_exist tpa.variables matches 1 run function tpa:home/get_dim with storage tpa:tpa temp.args
execute store result storage tpa:tpa temp.args.id int 1 run scoreboard players get #i tpa.variables
data modify storage tpa:tpa temp.args.id set string storage tpa:tpa temp.args.id
execute if score #is_exist tpa.variables matches 1 run function tpa:home/display with storage tpa:tpa temp.args
execute if score #is_exist tpa.variables matches 1 run scoreboard players add #home_displayed tpa.variables 1

# i++
scoreboard players add #i tpa.variables 1

execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §rNow executing: §a#home_displayed: ",{score: {name: "#home_displayed",objective: "tpa.variables"}}]

# Stop if homes finished displaying
scoreboard players set #each_home.continue tpa.variables 1
scoreboard players set #each_home.finished tpa.variables 0
execute unless score #home tpa.config matches ..-1 if score #i tpa.variables > #home tpa.config run scoreboard players set #if_show_new tpa.variables 0
execute unless score #home tpa.config matches ..-1 if score #i tpa.variables > #home tpa.config run scoreboard players set #each_home.continue tpa.variables 0
execute unless score #home tpa.config matches ..-1 if score #i tpa.variables > #home tpa.config run scoreboard players set #each_home.finished tpa.variables 1
execute unless score #each_home.finished tpa.variables matches 1 if score #home_displayed tpa.variables >= #home_owns tpa.variables run scoreboard players set #if_show_new tpa.variables 1
execute unless score #each_home.finished tpa.variables matches 1 if score #home_displayed tpa.variables >= #home_owns tpa.variables run scoreboard players set #each_home.continue tpa.variables 0

# Recursive call
execute if score #each_home.continue tpa.variables matches 1 run function tpa:home/each_home
