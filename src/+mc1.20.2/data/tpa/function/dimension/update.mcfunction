# Parent function: 
# @input: storage tpa:tpa temp.args.old_dim
# @output: storage tpa:tpa temp.args.new_dim

data modify storage tpa:tpa temp.args.old_dims set value ["overworld", "the_nether", "the_end"]
scoreboard players set #is_not_overworld tpa.variables 1
execute store result score #is_not_overworld tpa.variables run data modify storage tpa:tpa temp.args.old_dims[0] set from storage tpa:tpa temp.args.old_dim
scoreboard players set #is_not_nether tpa.variables 1
execute store result score #is_not_nether tpa.variables run data modify storage tpa:tpa temp.args.old_dims[1] set from storage tpa:tpa temp.args.old_dim
scoreboard players set #is_not_end tpa.variables 1
execute store result score #is_not_end tpa.variables run data modify storage tpa:tpa temp.args.old_dims[2] set from storage tpa:tpa temp.args.old_dim

execute if score #is_not_overworld tpa.variables matches 0 run data modify storage tpa:tpa temp.args.new_dim set value "minecraft:overworld"
execute if score #is_not_nether tpa.variables matches 0 run data modify storage tpa:tpa temp.args.new_dim set value "minecraft:the_nether"
execute if score #is_not_end tpa.variables matches 0 run data modify storage tpa:tpa temp.args.new_dim set value "minecraft:the_end"
execute if score #is_not_overworld tpa.variables matches 1 if score #is_not_nether tpa.variables matches 1 if score #is_not_end tpa.variables matches 1 \
    run data modify storage tpa:tpa temp.args.new_dim set from storage tpa:tpa temp.args.old_dim