scoreboard players operation #home tpa.variables = @s tpa.sethome
scoreboard players set @s tpa.sethome 0

function tpa:load_lang

# Check if player's able to modify homes
function tpa:home/conditions
execute if score #error_code tpa.variables matches 1..2 run return 0

execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §rNow executing: §a#home: ",{score: {"name": "#home","objective": "tpa.variables"}}]

# Check if home is in range
execute if score #home tpa.variables > #home tpa.config unless score #home tpa.config matches ..-1 run function tpa:sounds/no
execute if score #home tpa.variables > #home tpa.config unless score #home tpa.config matches ..-1 \
    run tellraw @s[scores={tpa.output=1..2}] [{storage:"tpa:tpa", nbt:"temp.lang.header"}, \
        {storage:"tpa:tpa", nbt:"temp.lang.home_out_of_range_left_part"}, \
        {score:{"name": "#home", "objective": "tpa.variables"}}, \
        {storage:"tpa:tpa", nbt:"temp.lang.home_out_of_range_right_part"}, ". " \
    ]
execute if score #home tpa.variables > #home tpa.config unless score #home tpa.config matches ..-1 \
    run title @s[scores={tpa.output=0..1}] actionbar [ \
        {storage:"tpa:tpa", nbt:"temp.lang.home_out_of_range_left_part", color: "red"}, \
        {score:{"name": "#home", "objective": "tpa.variables"}, color: "red"}, \
        {storage:"tpa:tpa", nbt:"temp.lang.home_out_of_range_right_part", color: "red"} \
    ]
execute if score #home tpa.variables > #home tpa.config unless score #home tpa.config matches ..-1 run return 0


function tpa:get_id
execute store result storage tpa:tpa temp.args.id int 1 run scoreboard players get #home tpa.variables
data modify storage tpa:tpa temp.args.name set from storage tpa:tpa temp.name
function tpa:home/set with storage tpa:tpa temp.args