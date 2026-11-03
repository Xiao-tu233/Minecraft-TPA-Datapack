# Parent function: tpa:home/menu
execute if score #home.plays_menu_sound tpa.variables matches 1 run function tpa:sounds/no
data remove storage tpa:tpa temp.output
data modify storage tpa:tpa temp.output.lang set from storage tpa:tpa loaded_lang.home_create
data modify storage tpa:tpa temp.output.button set from storage tpa:tpa loaded_lang.home_button_create
data modify storage tpa:tpa temp.output.hover set from storage tpa:tpa loaded_lang.home_button_create_hoverevent
function tpa:output/home/create