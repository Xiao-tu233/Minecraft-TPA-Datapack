# Parent function:  tpa:update/home/scan_char/out_string
execute if score #option.update.depth tpa.variables matches 1 run scoreboard players set #option.update.player_incomplete tpa.variables 0
execute if score #option.update.depth tpa.variables matches 1 run scoreboard players set #option.update.expect_home tpa.variables 0
execute if score #option.update.depth tpa.variables matches 1 run data remove storage tpa:tpa temp.args.current_id
execute if score #option.update.depth tpa.variables matches 2 run data remove storage tpa:tpa temp.args.current
execute if score #option.update.depth tpa.variables matches 2 run scoreboard players set #option.update.expect_home tpa.variables 0
scoreboard players add #option.update.depth tpa.variables 1
