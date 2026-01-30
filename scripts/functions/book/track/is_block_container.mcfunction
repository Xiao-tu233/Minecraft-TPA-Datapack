# Parent function: tpa:book/track/check_block
# @macro: {x: int, y: int, z: int}

# Suspicious container block: [
#      (Big)Chest, (Big)Trapped Chest, Copper Chest, Barrel, Shulker Box, Lectern, Furnace, Blast Furnace, Smoker, Brewing Stand, Dispenser, Dropper, Hopper, Crafter, Shelf, Chiseled Shelf, Decorated Pot
#    ]
# Also suspicious: the besided chest which is connected
# Hopper below, the pointing block of dropper, dispenser, crafter Are NOT nesscessary to be checked cuz these work spending ticks, when we check in 1 tick, problems don't happen.

# Because containers must firstly be a block entity, we can just directly use data get block to see if it's the matching block
data modify storage tpa:tpa temp.book.checking_block set value 'Not_block_entity'
$data modify storage tpa:tpa temp.book.checking_block set from block $(x) $(y) $(z) id

scoreboard players set #is_block_container tpa.variables 0
scoreboard players set #is_normal_block_container tpa.variables 0
scoreboard players set #is_lectern tpa.variables 0
scoreboard players set #is_decorated_pot tpa.variables 0
scoreboard players set #string_not_equal tpa.variables 1

# Here we choosed the less macro function version, however more repeating's been here
# Just a simple test if the namespace identifier is matching anyone in the normal container list
data modify storage tpa:tpa temp.book.string_check set from storage tpa:tpa temp.book.checking_block
execute store result score #string_not_equal tpa.variables run data modify storage tpa:tpa temp.book.string_check set value 'minecraft:chest'
execute if score #string_not_equal tpa.variables matches 0 run scoreboard players set #is_block_container tpa.variables 1

data modify storage tpa:tpa temp.book.string_check set from storage tpa:tpa temp.book.checking_block
execute store result score #string_not_equal tpa.variables run data modify storage tpa:tpa temp.book.string_check set value 'minecraft:trapped_chest'
execute if score #string_not_equal tpa.variables matches 0 run scoreboard players set #is_block_container tpa.variables 1

data modify storage tpa:tpa temp.book.string_check set from storage tpa:tpa temp.book.checking_block
execute store result score #string_not_equal tpa.variables run data modify storage tpa:tpa temp.book.string_check set value 'minecraft:barrel'
execute if score #string_not_equal tpa.variables matches 0 run scoreboard players set #is_block_container tpa.variables 1

data modify storage tpa:tpa temp.book.string_check set from storage tpa:tpa temp.book.checking_block
execute store result score #string_not_equal tpa.variables run data modify storage tpa:tpa temp.book.string_check set value 'minecraft:shulker_box'
execute if score #string_not_equal tpa.variables matches 0 run scoreboard players set #is_block_container tpa.variables 1

data modify storage tpa:tpa temp.book.string_check set from storage tpa:tpa temp.book.checking_block
execute store result score #string_not_equal tpa.variables run data modify storage tpa:tpa temp.book.string_check set value 'minecraft:dispenser'
execute if score #string_not_equal tpa.variables matches 0 run scoreboard players set #is_block_container tpa.variables 1

data modify storage tpa:tpa temp.book.string_check set from storage tpa:tpa temp.book.checking_block
execute store result score #string_not_equal tpa.variables run data modify storage tpa:tpa temp.book.string_check set value 'minecraft:dropper'
execute if score #string_not_equal tpa.variables matches 0 run scoreboard players set #is_block_container tpa.variables 1

data modify storage tpa:tpa temp.book.string_check set from storage tpa:tpa temp.book.checking_block
execute store result score #string_not_equal tpa.variables run data modify storage tpa:tpa temp.book.string_check set value 'minecraft:hopper'
execute if score #string_not_equal tpa.variables matches 0 run scoreboard players set #is_block_container tpa.variables 1

data modify storage tpa:tpa temp.book.string_check set from storage tpa:tpa temp.book.checking_block
execute store result score #string_not_equal tpa.variables run data modify storage tpa:tpa temp.book.string_check set value 'minecraft:crafter'
execute if score #string_not_equal tpa.variables matches 0 run scoreboard players set #is_block_container tpa.variables 1

data modify storage tpa:tpa temp.book.string_check set from storage tpa:tpa temp.book.checking_block
execute store result score #string_not_equal tpa.variables run data modify storage tpa:tpa temp.book.string_check set value 'minecraft:chiseled_bookshelf'
execute if score #string_not_equal tpa.variables matches 0 run scoreboard players set #is_block_container tpa.variables 1

data modify storage tpa:tpa temp.book.string_check set from storage tpa:tpa temp.book.checking_block
execute store result score #string_not_equal tpa.variables run data modify storage tpa:tpa temp.book.string_check set value 'minecraft:shelf'
execute if score #string_not_equal tpa.variables matches 0 run scoreboard players set #is_block_container tpa.variables 1

data modify storage tpa:tpa temp.book.string_check set from storage tpa:tpa temp.book.checking_block
execute store result score #string_not_equal tpa.variables run data modify storage tpa:tpa temp.book.string_check set value 'minecraft:furnace'
execute if score #string_not_equal tpa.variables matches 0 run scoreboard players set #is_block_container tpa.variables 1

data modify storage tpa:tpa temp.book.string_check set from storage tpa:tpa temp.book.checking_block
execute store result score #string_not_equal tpa.variables run data modify storage tpa:tpa temp.book.string_check set value 'minecraft:smoker'
execute if score #string_not_equal tpa.variables matches 0 run scoreboard players set #is_block_container tpa.variables 1

data modify storage tpa:tpa temp.book.string_check set from storage tpa:tpa temp.book.checking_block
execute store result score #string_not_equal tpa.variables run data modify storage tpa:tpa temp.book.string_check set value 'minecraft:blast_furnace'
execute if score #string_not_equal tpa.variables matches 0 run scoreboard players set #is_block_container tpa.variables 1

# Containers with only one slot
data modify storage tpa:tpa temp.book.string_check set from storage tpa:tpa temp.book.checking_block
execute store result score #string_not_equal tpa.variables run data modify storage tpa:tpa temp.book.string_check set value 'minecraft:lectern'
execute if score #string_not_equal tpa.variables matches 0 run scoreboard players set #is_lectern tpa.variables 1

data modify storage tpa:tpa temp.book.string_check set from storage tpa:tpa temp.book.checking_block
execute store result score #string_not_equal tpa.variables run data modify storage tpa:tpa temp.book.string_check set value 'minecraft:brewing_stand'
execute if score #string_not_equal tpa.variables matches 0 run scoreboard players set #is_block_container tpa.variables 1

data modify storage tpa:tpa temp.book.string_check set from storage tpa:tpa temp.book.checking_block
execute store result score #string_not_equal tpa.variables run data modify storage tpa:tpa temp.book.string_check set value 'minecraft:decorated_pot'
execute if score #string_not_equal tpa.variables matches 0 run scoreboard players set #is_decorated_pot tpa.variables 1

$execute if score #is_block_container tpa.variables matches 1 run data modify storage tpa:tpa temp.book.Items set from block $(x) $(y) $(z) Items
execute if score #is_lectern tpa.variables matches 1 run data modify storage tpa:tpa temp.book.Items set value []
$execute if score #is_lectern tpa.variables matches 1 run data modify storage tpa:tpa temp.book.Items append from block $(x) $(y) $(z) Book
execute if score #is_decorated_pot tpa.variables matches 1 run data modify storage tpa:tpa temp.book.Items set value []
$execute if score #is_decorated_pot tpa.variables matches 1 run data modify storage tpa:tpa temp.book.Items append from block $(x) $(y) $(z) item

execute if score #is_lectern tpa.variables matches 0 if score #is_decorated_pot tpa.variables matches 0 run scoreboard players set #is_normal_block_container tpa.variables 1
execute if score #is_lectern tpa.variables matches 1 run scoreboard players set #is_block_container tpa.variables 1
execute if score #is_decorated_pot tpa.variables matches 1 run scoreboard players set #is_block_container tpa.variables 1
#! Temp
# $execute if score #is_block_container tpa.variables matches 0 run say $(x) $(y) $(z) is not a block container
