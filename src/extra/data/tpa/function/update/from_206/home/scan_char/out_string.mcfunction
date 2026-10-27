# Parent function: tpa:update/from_206/home/scan_char
execute if score #option.update.not_left_bracket tpa.variables matches 0 run function tpa:update/from_206/home/scan_char/left_bracket with storage tpa:tpa temp.args
execute if score #option.update.not_right_bracket tpa.variables matches 0 run function tpa:update/from_206/home/scan_char/right_bracket with storage tpa:tpa temp.args
execute if score #option.update.not_colon tpa.variables matches 0 run function tpa:update/from_206/home/scan_char/colon with storage tpa:tpa temp.args
execute if score #option.update.not_comma tpa.variables matches 0 run function tpa:update/from_206/home/scan_char/comma with storage tpa:tpa temp.args
execute if score #option.update.not_quote tpa.variables matches 0 if score #option.update.depth tpa.variables matches 2 if score #option.update.expect_home tpa.variables matches 1 run scoreboard players set #option.update.player_incomplete tpa.variables 1
execute if score #option.update.not_quote tpa.variables matches 0 if score #option.update.depth tpa.variables matches 3 run function tpa:update/from_206/home/scan_char/append with storage tpa:tpa temp.args
execute if score #option.update.not_quote tpa.variables matches 0 run scoreboard players set #option.update.in_string tpa.variables 1
execute if score #option.update.not_left_bracket tpa.variables matches 1 if score #option.update.not_right_bracket tpa.variables matches 1 if score #option.update.not_colon tpa.variables matches 1 if score #option.update.not_comma tpa.variables matches 1 if score #option.update.not_quote tpa.variables matches 1 run function tpa:update/from_206/home/scan_char/normal
