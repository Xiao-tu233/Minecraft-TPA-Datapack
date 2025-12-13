# Full Name: calculate_simulate_distance

# Set the original position and tp him back after distance is calculated.
execute unless score #is_back_acting tpa.variables matches 1 run function tpa:back/push_confirm

scoreboard players set #is_teleport_executing tpa.variables 1
scoreboard players set #is_cal_sim_dist_executing tpa.variables 1

# Make it high enough to avoid suffocation damage
tp @s 0 336 0
summon item ~ ~ ~ {Item: {id: "stone", Count: 1b, tag: {isTeleportAnchor: 1b}}, PickupDelay: 32767s, Age: -32768s, Health: 0, NoGravity: true}
scoreboard players set #sim_dist tpa.config 0
function tpa:teleport/cal_sim_dist_loop

scoreboard players operation #sim_dist tpa.variables = #sim_dist tpa.config
scoreboard players remove #sim_dist tpa.config 2
scoreboard players operation #sim_dist tpa.variables *= #16 tpa.variables
scoreboard players remove #sim_dist tpa.variables 1

data remove storage tpa:tpa temp.teleport.Pos
data modify storage tpa:tpa temp.teleport.Pos set value [0d, 336d, 0d]
execute store result storage tpa:tpa temp.teleport.Pos[0] double 1 run scoreboard players get #sim_dist tpa.variables

summon item ~ ~ ~ {Item: {id: "stone", Count: 1b, tag: {isTeleportAnchor: 1b}}, PickupDelay: 32767s, Age: -32768s, Health: 0, NoGravity: true}
data modify entity @e[nbt={Item:{tag:{isTeleportAnchor: 1b}}}, limit=1, sort=nearest] Pos set from storage tpa:tpa temp.teleport.Pos
tp @s @e[nbt={Item:{tag:{isTeleportAnchor: 1b}}}, limit=1, sort=nearest]
kill @e[nbt={Item:{tag:{isTeleportAnchor: 1b}}}, limit=1, sort=nearest]