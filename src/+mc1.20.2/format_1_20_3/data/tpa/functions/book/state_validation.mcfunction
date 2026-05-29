# Parent function: tpa:tick

# Detect Dropped TPA Books
scoreboard players set #is_book_refreshed tpa.variables 0
execute at @s as @e[type=item, name='Written Book', distance=..2] if data entity @s Item.tag.isTpaBook run function tpa:book/refresh

# Book count = clear(book, count=0)
scoreboard players set #book_count tpa.variables 0
execute store result score #book_count tpa.variables run clear @s minecraft:written_book{isTpaBook:1b} 0

# If book count is 0, set book to -1 to indicate no book
execute if score #is_book_refreshed tpa.variables matches 0 if score #book_count tpa.variables matches 0 run function tpa:book/track_missing
execute if score #book_count tpa.variables matches 2.. run function tpa:book/confiscate_excess