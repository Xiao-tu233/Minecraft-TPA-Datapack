execute store result score #selector.current_page tpa.variables run data get storage tpa:tpa temp.current_selector.page
scoreboard players remove #selector.current_page tpa.variables 1
execute if score #selector.current_page tpa.variables matches ..0 run scoreboard players set #selector.current_page tpa.variables 1
execute store result storage tpa:tpa temp.current_selector.page int 1 run scoreboard players get #selector.current_page tpa.variables