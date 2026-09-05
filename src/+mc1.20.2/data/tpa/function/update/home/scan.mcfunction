# Parent function: tpa:update/home/prepare, tpa:update/home/scan
# @macro: {name: string, uid: int, id: int}

# Record occupancy before migration removes the legacy path.
scoreboard players set #home_migration.found tpa.variables 0
$execute if data storage tpa:tpa option.home_legacy.$(name).$(id) run scoreboard players set #home_migration.found tpa.variables 1
execute if score #home_migration.found tpa.variables matches 1 run function tpa:update/home/migrate_slot with storage tpa:tpa temp.update_home

# Track the last occupied legacy slot and the current empty run.
execute if score #home_migration.found tpa.variables matches 1 run scoreboard players operation #home_migration.last_found tpa.variables = #home_migration.id tpa.variables
execute if score #home_migration.found tpa.variables matches 1 run scoreboard players set #home_migration.empty tpa.variables 0
execute if score #home_migration.found tpa.variables matches 0 run scoreboard players add #home_migration.empty tpa.variables 1

# A configured finite limit does not inspect slots beyond that limit.
scoreboard players set #home_migration.continue tpa.variables 0
execute if score #home tpa.config matches 1.. if score #home_migration.id tpa.variables < #home tpa.config run scoreboard players set #home_migration.continue tpa.variables 1
execute if score #home_migration.continue tpa.variables matches 1 run scoreboard players add #home_migration.id tpa.variables 1
execute if score #home_migration.continue tpa.variables matches 1 store result storage tpa:tpa temp.update_home.id int 1 run scoreboard players get #home_migration.id tpa.variables
execute if score #home_migration.continue tpa.variables matches 1 run function tpa:update/home/scan with storage tpa:tpa temp.update_home

# With an unlimited setting, stop after max(16, last_found) consecutive empty slots.
scoreboard players set #home_migration.limit tpa.variables 16
execute if score #home_migration.last_found tpa.variables > #home_migration.limit tpa.variables run scoreboard players operation #home_migration.limit tpa.variables = #home_migration.last_found tpa.variables
scoreboard players set #home_migration.continue tpa.variables 0
execute if score #home tpa.config matches -1 if score #home_migration.empty tpa.variables < #home_migration.limit tpa.variables run scoreboard players set #home_migration.continue tpa.variables 1
execute if score #home_migration.continue tpa.variables matches 1 run scoreboard players add #home_migration.id tpa.variables 1
execute if score #home_migration.continue tpa.variables matches 1 store result storage tpa:tpa temp.update_home.id int 1 run scoreboard players get #home_migration.id tpa.variables
execute if score #home_migration.continue tpa.variables matches 1 if score #home tpa.config matches -1 run function tpa:update/home/scan with storage tpa:tpa temp.update_home
