# Parent function: tpa:simple_menu, tpa:tpa

scoreboard players set #is_menu_open tpa.variables 1
data remove storage tpa:tpa temp.simple_menu.result
data modify storage tpa:tpa temp.simple_menu.result set value []
# player_id is available in range 2..
scoreboard players set #i tpa.variables 2

execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §rLoop starts, times: ",{score:{name:"#global_current",objective:"tpa.player_id"}}]
function tpa:simple_menu/loop
execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §rLoop ends."]

function tpa:sounds/levelup
tellraw @s[predicate=tpa:output/show_chatbar] [{storage:"tpa:tpa", nbt:"loaded_lang.header"}, \
    {storage:"tpa:tpa", nbt:"loaded_lang.simple_menu_title"}, \
    {\
        storage:"tpa:tpa", \
        nbt:"loaded_lang.simple_menu_button", \
        click_event:{action:"run_command",command: "/trigger tpa.simple_menu set 3"}, \
        hover_event: {action: "show_text", value: {storage:"tpa:tpa", nbt:"loaded_lang.simple_menu_button_hoverevent"}}\
    }, " " \
] 

# Remove the ', {color:"dark_gray", text: " | "}, ', and trailing comma, by C style: result = result[40:]
# data modify storage tpa:tpa temp.simple_menu.result set string storage tpa:tpa temp.simple_menu.result 40
data remove storage tpa:tpa temp.simple_menu.result[0]
execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §rNow showing: §astorage tpa:tpa temp.simple_menu.result:", {storage:"tpa:tpa", nbt:"temp.simple_menu.result"}]

function tpa:simple_menu/display