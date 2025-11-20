# Parent Function: tpa:book, tpa:each_page(loop)
data remove storage tpa:tpa book.each_page
data modify storage tpa:tpa book.each_page set value {\
    "id_0":'\\"\\"', "id_1":'\\"\\"', \
    "id_2":'\\"\\"', "id_3":'\\"\\"', \
    "id_4":'\\"\\"', "id_5":'\\"\\"', \
    "id_6":'\\"\\"', "id_7":'\\"\\"', \ 
    "id_8":'\\"\\"', "id_9":'\\"\\"', \
    "id_10":'\\"\\"', "id_11":'\\"\\"', \
    "id_12":'\\"\\"', "id_13":'\\"\\"'\
}
scoreboard players set #j tpa.variables 0
function tpa:book/each_lines

execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §rNow gotten page ",{"score": {"name": "#pages_current","objective": "tpa.variables"}}," content: §a",{"storage":"tpa:tpa","nbt":"book.each_page"}]

data remove storage tpa:tpa book.arg
data modify storage tpa:tpa book.arg set from storage tpa:tpa book.each_page
data modify storage tpa:tpa book.arg set string storage tpa:tpa book.arg 1 -1
data modify entity @e[sort=nearest, limit=1, type=minecraft:text_display,tag=tpa.text_display] text set value '{"storage":"tpa:tpa","nbt":"book.pages"}'
data modify storage tpa:tpa book.arg.pages set from entity @e[sort=nearest, limit=1, type=minecraft:text_display,tag=tpa.text_display] text
data modify storage tpa:tpa book.arg.pages set string storage tpa:tpa book.arg.pages 1 -1


function tpa:book/store_page with storage tpa:tpa book.arg

scoreboard players add #pages_current tpa.variables 1
execute if score #pages_current tpa.variables <= #pages tpa.variables run function tpa:book/each_page