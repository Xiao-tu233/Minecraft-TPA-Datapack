# Parent: tpa:book/track/check_slot

data modify storage tpa:tpa temp.book.merger set from storage tpa:tpa temp.book.Items[0]
#! It is expected to see "Tried to load invalid item: 'Item must not be minecraft:air'" in console, don't worry.
data modify storage tpa:tpa temp.book.merger.id set value "air"
$execute if score #is_normal_block_container tpa.variables matches 1 run data modify block $(x) $(y) $(z) Items[] merge from storage tpa:tpa temp.book.merger
$execute if score #is_decorated_pot tpa.variables matches 1 run data remove block $(x) $(y) $(z) item
$execute if score #is_lectern tpa.variables matches 1 if block $(x) $(y) $(z) minecraft:lectern[facing=north] run setblock $(x) $(y) $(z) minecraft:lectern[facing=north]
$execute if score #is_lectern tpa.variables matches 1 if block $(x) $(y) $(z) minecraft:lectern[facing=south] run setblock $(x) $(y) $(z) minecraft:lectern[facing=south]
$execute if score #is_lectern tpa.variables matches 1 if block $(x) $(y) $(z) minecraft:lectern[facing=east] run setblock $(x) $(y) $(z) minecraft:lectern[facing=east]
$execute if score #is_lectern tpa.variables matches 1 if block $(x) $(y) $(z) minecraft:lectern[facing=west] run setblock $(x) $(y) $(z) minecraft:lectern[facing=west]
execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug§r: Missing Book Discovered: in Block Container ", {"storage": "tpa:tpa", "nbt": "temp.args.x"}, " ", {"storage": "tpa:tpa", "nbt": "temp.args.y"}, " ", {"storage": "tpa:tpa", "nbt": "temp.args.z"}, "(", {"storage": "tpa:tpa", "nbt": "temp.book.checking_block"}, ") at ", {"entity": "@s", "nbt": "Pos[]", "separator": ","}, ", Slot ", {"storage": "tpa:tpa", "nbt": "temp.book.merger.Slot"}, ", count ", {"storage": "tpa:tpa", "nbt": "temp.book.merger.count"}]
