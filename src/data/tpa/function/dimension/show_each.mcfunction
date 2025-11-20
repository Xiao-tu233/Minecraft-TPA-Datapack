# Parent function: tpa:dimension/menu, tpa:dimension/show_each(loop)

data remove storage tpa:tpa temp.args
execute store result storage tpa:tpa temp.args.index int 1 run scoreboard players get #i tpa.variables
data modify storage tpa:tpa temp.args.color set from storage tpa:tpa temp.option.dimension[0].color
function tpa:dimension/show_each_macro with storage tpa:tpa temp.args

# Loop
scoreboard players add #i tpa.variables 1
data remove storage tpa:tpa temp.option.dimension[0]
execute if data storage tpa:tpa temp.option.dimension[0] run function tpa:dimension/show_each
