# Parent: tpa:book/track/ender_chest
# @param: {slot: byte}
execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug§r: Missing Book Discovered: in Ender Chest, Slot ", {interpret: true, storage: "tpa:tpa", nbt: "temp.args.slot"}, ", count ", {interpret: true, storage: "tpa:tpa", nbt: "temp.book.merger.count"}]
$item replace entity @s enderchest.$(slot) with air