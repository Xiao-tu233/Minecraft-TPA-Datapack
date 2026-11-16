# Private: called after the parent function's checks pass.
execute if score #users.allow_uuid_change tpa.variables matches 0 if data storage tpa:tpa temp.users.result.uuid run function tpa:users/set/check_uuid
execute unless score #users.result tpa.variables matches 2 run function tpa:users/set/write
