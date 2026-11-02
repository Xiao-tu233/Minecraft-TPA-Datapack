# Parent function: tpa:home/available

# #home.page.offset = (#home.page.result -1) *5
scoreboard players operation #home.page.offset tpa.variables = #home.page.result tpa.variables
scoreboard players remove #home.page.offset tpa.variables 1
scoreboard players operation #home.page.offset tpa.variables *= #5 tpa.variables

# #home | -3 | -4 | -5 | -6 | -7 |
# #w*-1 |  3 |  4 |  5 |  6 |  7 |
# slot  |  1 |  2 |  3 |  4 |  5 |
scoreboard players operation #home.selected_slot tpa.variables = #home tpa.variables
scoreboard players operation #home.selected_slot tpa.variables *= #-1 tpa.variables
scoreboard players remove #home.selected_slot tpa.variables 2

scoreboard players operation #home.selected_slot tpa.variables += #home.page.offset tpa.variables
scoreboard players operation #home tpa.variables = #home.selected_slot tpa.variables
# function tpa:home/select_index