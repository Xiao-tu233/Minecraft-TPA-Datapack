# Parent function: tpa:home/menu

data remove storage tpa:tpa temp.args.dialog
data modify storage tpa:tpa temp.args.dialog set value {type: "minecraft:multi_action", pause: false, after_action: "none", title: "$(title)", columns: 4, actions: []}
data modify entity @n[type=text_display, tag=tpa.text_display] text set from storage tpa:tpa loaded_lang.home_menu_title
data modify storage tpa:tpa temp.args.dialog.title set from entity @n[type=text_display, tag=tpa.text_display] text

scoreboard players set #i tpa.variables 0
scoreboard players set #home_displayed tpa.variables 0
scoreboard players set #home_owns tpa.variables 0
execute store result score #home_owns tpa.variables run data get storage tpa:tpa temp.home
execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §rNow showing: §a#home_owns: ",{score: {name: "#home_owns",objective: "tpa.variables"}}]
function tpa:home/each_home

execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §rNow showing: §a#if_show_new: ",{score: {name: "#if_show_new",objective: "tpa.variables"}}]

execute store result storage tpa:tpa temp.args.id int 1 run scoreboard players get #i tpa.variables
execute if score #home tpa.config matches 1.. run data modify storage tpa:tpa temp.home.slash set value '/'
execute if score #home tpa.config matches 1.. store result storage tpa:tpa temp.home.limit int 1 run scoreboard players get #home tpa.config
execute if score #home tpa.config matches 1.. run data modify storage tpa:tpa temp.home.limit set string storage tpa:tpa temp.home.limit
# slash and limit won't be displayed when #home config is -1

execute if score #if_show_new tpa.variables matches 1 run function tpa:home/new with storage tpa:tpa temp.args

function tpa:home/dialog with storage tpa:tpa temp.args
