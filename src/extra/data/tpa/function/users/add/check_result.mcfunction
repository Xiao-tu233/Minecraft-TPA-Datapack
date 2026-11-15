# Private: called after the parent function's checks pass.
execute if score #users.count tpa.variables matches 1.. run function tpa:users/conflict
execute if score #users.count tpa.variables matches 0 run function tpa:users/add/append
