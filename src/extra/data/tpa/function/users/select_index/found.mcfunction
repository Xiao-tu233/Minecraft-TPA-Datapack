# Private: called after the parent function's checks pass.
data modify storage tpa:tpa temp.users.result set from storage tpa:tpa temp.users.results[0]
execute store result score #users.selected_uid tpa.variables run data get storage tpa:tpa temp.users.result.uid
