# Parent function: tpa:tpahere_menu

function tpa:tpa_menu/prepare_back_button

execute if score #tpa_menu.back_button tpa.variables matches 0 run function tpa:tpahere_menu/display_first_buttons/back_available
execute unless score #tpa_menu.back_button tpa.variables matches 0 run function tpa:tpahere_menu/display_first_buttons/back_unavailable
