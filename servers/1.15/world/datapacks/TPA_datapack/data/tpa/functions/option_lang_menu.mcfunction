# Parent: tpa:options
scoreboard players set #is_server_selecting tpa.variables 1
scoreboard players operation #target_lang tpa.variables = #language tpa.config
function tpa:language_menu
scoreboard players set #is_server_selecting tpa.variables 0
