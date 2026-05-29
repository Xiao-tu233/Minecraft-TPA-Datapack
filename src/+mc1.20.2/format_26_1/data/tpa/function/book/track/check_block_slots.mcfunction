# Parent function: tpa:book/track/check_block
execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug§r: Checking container block ", {interpret: true, storage: "tpa:tpa", nbt: "temp.args.x"}, " ", {interpret: true, storage: "tpa:tpa", nbt: "temp.args.y"}, " ", {interpret: true, storage: "tpa:tpa", nbt: "temp.args.z"}, "(", {interpret: true, storage: "tpa:tpa", nbt: "temp.book.checking_block"}, ") for Missing Book."]

scoreboard players set #is_book_found tpa.variables 0
scoreboard players set #is_checking_entity tpa.variables 0
scoreboard players set #is_checking_block tpa.variables 1
# Items is set in tpa:book/track/is_block_container
execute if data storage tpa:tpa temp.book.Items[0] run function tpa:book/track/check_slot