# Parent function: tpa:warp/available

# Get Page for slot start
function tpa:warp/page/get
execute if score #warp.page.result tpa.variables matches 0 run function tpa:warp/page/create

# Calc total pages
scoreboard players operation #warp.total_pages tpa.variables = #warp tpa.config
scoreboard players add #warp.total_pages tpa.variables 4
scoreboard players operation #warp.total_pages tpa.variables /= #5 tpa.variables

scoreboard players set #warp.editting tpa.variables 0
execute if score #warp tpa.variables matches -8 run function tpa:warp/page/next
execute if score #warp tpa.variables matches -7..-3 run function tpa:warp/resolve_slot
execute if score #warp tpa.variables matches -2 run function tpa:warp/page/previous
execute if score #warp tpa.variables matches -1 run function tpa:warp/menu
execute if score #warp tpa.variables matches 1.. run function tpa:warp/select_index