# Parent function:  tpa:update/home/scan_char/out_string
execute if score #option.update.depth tpa.variables matches 2 run data remove storage tpa:tpa temp.args.current
scoreboard players add #option.update.depth tpa.variables 1
