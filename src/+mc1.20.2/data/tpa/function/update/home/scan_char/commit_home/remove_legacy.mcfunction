# Parent function: tpa:update/home/scan_char/commit_home/append
$execute store success score #option.update.slot_removed tpa.variables run data remove storage tpa:tpa option.home_legacy.$(current_name).$(current_id)
execute if score #option.update.slot_removed tpa.variables matches 1 run scoreboard players set #option.update.slot_migrated tpa.variables 1
