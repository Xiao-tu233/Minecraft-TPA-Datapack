# Parent function: tpa:book/track/check_block_slots, tpa:book/track/check_entity_slots, tpa:book/track/check_slot(Loop)

# Check if current slot is the book, confiscate it if so
execute store result score #is_book_found tpa.variables run data get storage tpa:tpa temp.book.Items[0].components."minecraft:custom_data".isTpaBook

# Confiscate
execute if score #is_checking_block tpa.variables matches 1 if score #is_book_found tpa.variables matches 1 run function tpa:book/track/confiscate_from_block with storage tpa:tpa temp.args
execute if score #is_checking_entity tpa.variables matches 1 if score #is_book_found tpa.variables matches 1 run function tpa:book/track/confiscate_from_entity
 
# Loop
data remove storage tpa:tpa temp.book.Items[0]
execute if data storage tpa:tpa temp.book.Items[0] run function tpa:book/track/check_slot