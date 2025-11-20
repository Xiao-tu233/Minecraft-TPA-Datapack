# Parent function: tpa:tick, tpa:home/set, tpa:home/remove

scoreboard players operation #target_lang tpa.variables = #language tpa.config
function tpa:load_lang

function tpa:dimension/refresh

function tpa:sounds/levelup
tellraw @s[predicate=tpa:output/show_chatbar] [{storage:"tpa:tpa", nbt:"loaded_lang.header"}, {storage:"tpa:tpa", nbt:"loaded_lang.home_menu_title"}]

function tpa:get_name
function tpa:home/temp with storage tpa:tpa temp
execute unless data storage tpa:tpa temp.home run tellraw @s[predicate=tpa:output/show_chatbar] [{storage:"tpa:tpa", nbt:"loaded_lang.header"}, \
        {storage:"tpa:tpa", nbt:"loaded_lang.home_create"}, \
        {\
            storage:"tpa:tpa", \
            nbt:"loaded_lang.home_create_button", \
            click_event:{action:"run_command",command: "/trigger tpa.sethome"}, \
            hover_event: {action: "show_text", value: {storage:"tpa:tpa", nbt:"loaded_lang.home_create_button_hoverevent"}}\
        }\
    ]
execute unless data storage tpa:tpa temp.home run return 0

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
# slash and limit won't be displayed when #home config is -1

execute if score #if_show_new tpa.variables matches 1 run function tpa:home/new with storage tpa:tpa temp.args