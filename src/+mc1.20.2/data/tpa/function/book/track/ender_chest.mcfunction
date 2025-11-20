# Parent function: tpa:book/track_missing

# Check if current slot is the book, confiscate it if so
execute store result score #is_book_found_in_enderchest tpa.variables run data get storage tpa:tpa temp.book.EnderItems[0].components."minecraft:custom_data".isTpaBook
execute if score #is_book_found_in_enderchest tpa.variables matches 1 store result storage tpa:tpa temp.args.slot byte 1 run data get storage tpa:tpa temp.book.EnderItems[0].Slot
execute if score #is_book_found_in_enderchest tpa.variables matches 1 run function tpa:book/track/confiscate_from_ender_chest with storage tpa:tpa temp.args

# Loop
data remove storage tpa:tpa temp.book.EnderItems[0]
execute if data storage tpa:tpa temp.book.EnderItems[0] run function tpa:book/track/ender_chest