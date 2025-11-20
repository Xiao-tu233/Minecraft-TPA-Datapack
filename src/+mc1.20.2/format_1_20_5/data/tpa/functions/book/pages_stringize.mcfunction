# Parent Function: tpa:book, tpa:book/stringize(loop)

# So we need to add a more quotation marks cuz of here
$data modify storage tpa:tpa book.pages set value "$(pages),{raw:\"$(page_current)\"}"

data modify storage tpa:tpa book.arg.pages set from storage tpa:tpa book.pages
scoreboard players add #i tpa.variables 1
execute store result storage tpa:tpa book.arg.i int 1 run scoreboard players get #i tpa.variables
$data modify storage tpa:tpa book.arg.page_current set from storage tpa:tpa book.pages_list[$(i)]
execute if score #i tpa.variables < #pages tpa.variables run function tpa:book/pages_stringize with storage tpa:tpa book.arg