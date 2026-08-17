# Parent function: tpa:request_menu/prepare

# Calculate total pages
scoreboard players operation #request_menu.total_pages tpa.variables = #request_menu.total_players tpa.variables
scoreboard players remove #request_menu.total_pages tpa.variables 1
scoreboard players operation #request_menu.total_pages tpa.variables /= #20 tpa.variables
scoreboard players add #request_menu.total_pages tpa.variables 1

# Clamp page number
execute if score #request_menu.page tpa.variables matches ..0 run scoreboard players set #request_menu.page tpa.variables 1
execute if score #request_menu.page tpa.variables > #request_menu.total_pages tpa.variables run scoreboard players operation #request_menu.page tpa.variables = #request_menu.total_pages tpa.variables
