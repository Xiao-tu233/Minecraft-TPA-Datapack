scoreboard players set #version tpa.config 206
data remove storage tpa:tpa option.home_legacy
function tpa:get_name
data modify storage tpa:tpa temp.args.name set from storage tpa:tpa temp.name
function tpa:test/init_example_legacy_home/set with storage tpa:tpa temp.args
