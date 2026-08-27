# Parent Function: tpa:tick
scoreboard players set @s tpa.book 0
clear @s minecraft:written_book[minecraft:custom_data={isTpaBook:1b}]

# Output
function tpa:load_lang
function tpa:sounds/click
data remove storage tpa:tpa temp.output
data modify storage tpa:tpa temp.output.lang set from storage tpa:tpa loaded_lang.book_stop
data modify storage tpa:tpa temp.output.button set from storage tpa:tpa loaded_lang.book_reget
data modify storage tpa:tpa temp.output.button_hover set from storage tpa:tpa loaded_lang.book_reget_hoverevent
function tpa:output/book/stop