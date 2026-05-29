# Parent function: tpa:book/track/check_block
execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug§r: Checking container block ", {storage: "tpa:tpa", nbt: "temp.args.x"}, " ", {storage: "tpa:tpa", nbt: "temp.args.y"}, " ", {storage: "tpa:tpa", nbt: "temp.args.z"}, "(", {storage: "tpa:tpa", nbt: "temp.book.checking_block"}, ") for Missing Book."]

scoreboard players set #is_book_found tpa.variables 0
scoreboard players set #is_checking_entity tpa.variables 0
scoreboard players set #is_checking_block tpa.variables 1
# Items is set in tpa:book/track/is_block_container
execute if data storage tpa:tpa temp.book.Items[0] run function tpa:book/track/check_slot