# Parent function: tpa:home/menu
function tpa:sounds/no
data remove storage tpa:tpa temp.output
data modify storage tpa:tpa temp.output set from storage tpa:tpa loaded_lang.home_create
data modify storage tpa:tpa temp.button set from storage tpa:tpa loaded_lang.home_create_button
data modify storage tpa:tpa temp.hover set from storage tpa:tpa loaded_lang.home_create_button_hoverevent
function tpa:output/home/create