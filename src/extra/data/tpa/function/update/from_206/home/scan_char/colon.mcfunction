# Parent function:  tpa:update/from_206/home/scan_char/out_string

execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §rHome Update: Token scanned: ", {storage: 'tpa:tpa', nbt: "temp.args.token"}]

execute if score #option.update.depth tpa.variables matches 1 run data modify storage tpa:tpa temp.args.current_name set from storage tpa:tpa temp.args.token
execute if score #option.update.depth tpa.variables matches 2 run data modify storage tpa:tpa temp.args.current_id set from storage tpa:tpa temp.args.token
execute if score #option.update.depth tpa.variables matches 2 run scoreboard players set #option.update.expect_home tpa.variables 1
execute if score #option.update.depth tpa.variables matches 3 run data modify storage tpa:tpa temp.args.current_key set from storage tpa:tpa temp.args.token
data modify storage tpa:tpa temp.args.token set value ""
