# Parent function: tpa:update/from_206/home/scan_char
execute if score #option.update.not_quote tpa.variables matches 0 run scoreboard players set #option.update.in_string tpa.variables 0
execute if score #option.update.not_quote tpa.variables matches 1 run function tpa:update/from_206/home/scan_char/normal
