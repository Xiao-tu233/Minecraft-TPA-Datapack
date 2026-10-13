# Parent function: tpa:update/home/scan_char
execute if score #option.update.not_quote tpa.variables matches 0 if score #option.update.depth tpa.variables matches 3 run function tpa:update/home/scan_char/append with storage tpa:tpa temp.args
execute if score #option.update.not_quote tpa.variables matches 0 run scoreboard players set #option.update.in_string tpa.variables 0
execute if score #option.update.not_quote tpa.variables matches 1 run function tpa:update/home/scan_char/normal
