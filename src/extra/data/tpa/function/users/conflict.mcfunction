# Private: ambiguous matches remain in results; never expose a unique result.
scoreboard players set #users.result tpa.variables 2
data remove storage tpa:tpa temp.users.result
