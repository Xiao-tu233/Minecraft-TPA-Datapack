# Parent function:  tpa:update/home/scan_char/out_string
execute if score #option.update.depth tpa.variables matches 3 run function tpa:update/home/scan_char/commit_field with storage tpa:tpa temp.args
execute if score #option.update.depth tpa.variables matches 3 run function tpa:update/home/scan_char/commit_home with storage tpa:tpa temp.args
execute if score #option.update.depth tpa.variables matches 2 if score #option.update.player_incomplete tpa.variables matches 0 run function tpa:update/home/scan_char/commit_player with storage tpa:tpa temp.args
scoreboard players remove #option.update.depth tpa.variables 1
