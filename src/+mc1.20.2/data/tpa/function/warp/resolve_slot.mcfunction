# Parent function: tpa:warp/available

# #warp.page.offset = (#warp.page.result -1) *5
scoreboard players operation #warp.page.offset tpa.variables = #warp.page.result tpa.variables
scoreboard players remove #warp.page.offset tpa.variables 1
scoreboard players operation #warp.page.offset tpa.variables *= #5 tpa.variables

# #warp | -3 | -4 | -5 | -6 | -7 |
# #w*-1 |  3 |  4 |  5 |  6 |  7 |
# slot  |  1 |  2 |  3 |  4 |  5 |
scoreboard players operation #warp.selected_slot tpa.variables = #warp tpa.variables
scoreboard players operation #warp.selected_slot tpa.variables *= #-1 tpa.variables
scoreboard players remove #warp.selected_slot tpa.variables 2

scoreboard players operation #warp.selected_slot tpa.variables += #warp.page.offset tpa.variables
scoreboard players operation #warp tpa.variables = #warp.selected_slot tpa.variables
# function tpa:warp/select_index