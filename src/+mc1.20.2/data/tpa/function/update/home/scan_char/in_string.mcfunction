# Parent function: tpa:update/home/scan_char
execute if score #option.update.not_quote tpa.variables matches 0 run function tpa:update/home/scan_char/string_ends
execute if score #option.update.not_quote tpa.variables matches 1 run function tpa:update/home/scan_char/normal
