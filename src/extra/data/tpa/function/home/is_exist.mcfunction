# Parent Function: tpa:home/has_home, tpa:home/each_home
# @macro: {id: int, name: str}
# Sets #is_exist tpa.variables to 1 when home exists
$execute if data storage tpa:tpa temp.home.$(id) run scoreboard players set #is_exist tpa.variables 1
