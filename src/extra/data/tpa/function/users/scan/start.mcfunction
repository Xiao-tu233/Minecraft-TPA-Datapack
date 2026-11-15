# Private: called after the parent function's checks pass.
# A compound sentinel cannot be appended to the old List[string].
# Check success before rotation so unmigrated legacy data stays untouched.
execute store success score #users.sentinel_added tpa.variables run data modify storage tpa:tpa users append value {sentinel: 1b}
execute if score #users.sentinel_added tpa.variables matches 1 run function tpa:users/scan/finish
