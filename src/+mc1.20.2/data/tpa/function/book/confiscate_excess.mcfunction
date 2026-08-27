# Parent function: tpa:book/state_validation

execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §r", {selector:"@s"}, " is detected to have stacking TPA books."]
function tpa:sounds/no
data modify storage tpa:tpa temp.output set from storage tpa:tpa loaded_lang.book_stacking
function tpa:output/standard
function tpa:book