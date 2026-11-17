# Private: reject positions outside the current users[] list.
execute if score #users.target tpa.variables > #users.total tpa.variables run scoreboard players set #users.result tpa.variables 3
execute if score #users.target tpa.variables <= #users.total if score #users.position tpa.variables = #users.target tpa.variables run scoreboard players set #users.result tpa.variables 1
execute if score #users.target tpa.variables <= #users.total if score #users.position tpa.variables > #users.target tpa.variables run function tpa:users/set_position/remove
execute if score #users.target tpa.variables <= #users.total if score #users.position tpa.variables < #users.target tpa.variables run function tpa:users/set_position/remove
