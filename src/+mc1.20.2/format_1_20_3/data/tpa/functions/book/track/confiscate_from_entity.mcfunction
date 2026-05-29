# Parent: tpa:book/track/check_slot

data modify storage tpa:tpa temp.book.merger set from storage tpa:tpa temp.book.Items[0]
#! It is expected to see "Tried to load invalid item: 'Item must not be minecraft:air'" in console, don't worry.
data modify storage tpa:tpa temp.book.merger.id set value "air"
execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug§r: Missing Book Discovered: in Entity Container ", {"selector": "@s"}, " at ", {"entity": "@s", "nbt": "Pos[]", "separator": ","}, ", Slot ", {"storage": "tpa:tpa", "nbt": "temp.book.merger.Slot"}, ", count ", {"storage": "tpa:tpa", "nbt": "temp.book.merger.count"}]
data modify entity @s Items[] merge from storage tpa:tpa temp.book.merger

