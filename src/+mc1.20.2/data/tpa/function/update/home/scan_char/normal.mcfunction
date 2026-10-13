# Parent function: tpa:update/home/scan_char/out_string, tpa:update/home/scan_char/in_string
execute if score #option.update.in_string tpa.variables matches 1 run function tpa:update/home/scan_char/append with storage tpa:tpa temp.args
execute if score #option.update.depth tpa.variables matches 2 if score #option.update.in_string tpa.variables matches 0 if score #option.update.expect_home tpa.variables matches 1 if score #option.update.not_space tpa.variables matches 1 run scoreboard players set #option.update.player_incomplete tpa.variables 1
execute if score #option.update.in_string tpa.variables matches 0 if score #option.update.not_space tpa.variables matches 1 run function tpa:update/home/scan_char/append with storage tpa:tpa temp.args
