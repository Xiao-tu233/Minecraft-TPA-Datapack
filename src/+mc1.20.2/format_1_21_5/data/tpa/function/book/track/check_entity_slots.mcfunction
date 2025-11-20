# Parent function: tpa:book/track/detect_entitiy, tpa:book/track_missing
execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug§r: Checking container entity ", {selector: "@s"}, " for Missing Book."]

scoreboard players set #is_book_found_in_entity tpa.variables 0
scoreboard players set #is_checking_entity tpa.variables 1
scoreboard players set #is_checking_block tpa.variables 0
data modify storage tpa:tpa temp.book.Items set from entity @s Items
execute if data storage tpa:tpa temp.book.Items[0] run function tpa:book/track/check_slot