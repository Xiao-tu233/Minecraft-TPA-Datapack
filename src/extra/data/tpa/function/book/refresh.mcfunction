# Parent function: tpa:book/state_validation
scoreboard players set #is_book_refreshed tpa.variables 1
kill @s

execute as @p run function tpa:sounds/pick_orb
data modify storage tpa:tpa temp.output set from storage tpa:tpa loaded_lang.book_refresh
execute as @p run function tpa:output/standard

execute as @p run function tpa:book