execute store result score #selector.current_page tpa.variables run data get storage tpa:tpa temp.current_selector.page
scoreboard players add #selector.current_page tpa.variables 1
execute if score #selector.current_page tpa.variables > #selector.total_pages tpa.variables run scoreboard players operation #selector.current_page tpa.variables = #selector.total_pages tpa.variables
execute store result storage tpa:tpa temp.current_selector.page int 1 run scoreboard players get #selector.current_page tpa.variables