
# Steps:
# 0. Check if book is placed in a entity or enderchest
# 0.1. Item Frame or Glow Item Frame
# 0.2. Ender Chest
# 0.3. Vehicle
# 0.4. If Stricter Book Check is enabled, continue.
# 1.1. Check if contexts is provided, if not, Check loaded chest boat, chest minecart, horse*3, Camel, Llama, hopper minecart, Villager
# 1.2. Directly accordsing the context to get the reachable blocks and refer nearest container 
#    See also: Container List: [
#      (Big)Chest, (Big)Trapped Chest, Copper Chest, Barrel, Shulker Box, Lectern, Furnace, Blast Furnace, Smoker, Brewing Stand, Dispenser, Dropper, Hopper, Crafter, Shelf, Chiseled Shelf, Decorated Pot
#    ]


# 2. If not found, See if there's hopper or dropper or it's the container itself
# 3. If Still not found, abandon Rotations and check every blocks the previous context without directions provided

function tpa:sounds/no
tellraw @s[predicate=tpa:output/show_chatbar] [{storage:"tpa:tpa", nbt:"loaded_lang.header"}, {storage:"tpa:tpa", nbt:"loaded_lang.book_check_missing"}, ". "]
title @s[predicate=tpa:output/show_actionbar] actionbar [{storage:"tpa:tpa", nbt:"loaded_lang.book_check_missing", color:"red"}]
function tpa:book

# Item Frame or Glow Item Frame
execute if score #debug_mode tpa.config matches 1 as @e[type=!item, nbt={Item:{components:{"minecraft:custom_data":{isTpaBook: 1b}}}}] run tellraw @a ["[§bTPA§r] §6 Debug§r: Missing Book Discovered: Item Frame / Glow Item Frame @ ", {entity: "@s", nbt: "Pos[]", "separator": ","}]
execute as @e[type=!item, nbt={Item:{components:{"minecraft:custom_data":{isTpaBook: 1b}}}}] run data remove entity @s Item

# Ender Chest
scoreboard players set #is_book_found_in_enderchest tpa.variables 0
data modify storage tpa:tpa temp.book.EnderItems set from entity @s EnderItems
execute if data storage tpa:tpa temp.book.EnderItems[0] run function tpa:book/track/ender_chest
execute if score #is_book_found_in_enderchest tpa.variables matches 0 if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug§r: Missing Book wasn't discovered in Ender Chest."]

# Check Vehicle
execute on vehicle if data entity @s Items[0] run function tpa:book/track/check_entity_slots

# Stricter Book Check
execute if score #stricter_book_check tpa.config matches 1 run function tpa:book/track/stricter_check