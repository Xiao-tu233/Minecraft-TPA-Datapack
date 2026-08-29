# Parent function: tpa:update/home
# @macro: {name: string, uid: int}

$execute unless data storage tpa:tpa option.home_legacy.$(name) run return 0

# A positive limit scans exactly 1..limit. -1 uses the sparse-data scan below.
data modify storage tpa:tpa temp.update_home.id set value 1
scoreboard players set #home_migration.id tpa.variables 1
scoreboard players set #home_migration.last_found tpa.variables 0
scoreboard players set #home_migration.empty tpa.variables 0
execute unless score #home tpa.config matches 0 run function tpa:update/home/scan with storage tpa:tpa temp.update_home