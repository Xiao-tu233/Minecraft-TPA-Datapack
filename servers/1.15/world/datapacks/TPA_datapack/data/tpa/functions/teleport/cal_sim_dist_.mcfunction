kill @e[nbt={Item:{tag:{isTeleportAnchor: 1b}}}]

execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §rSimulate Distance has been calculated: ", {"score": {"name": "#sim_dist", "objective": "tpa.config"}}]

scoreboard players set #is_teleport_executing tpa.variables 0
scoreboard players set #is_cal_sim_dist_executing tpa.variables 0

function tpa:back
function tpa:back/pop
scoreboard players set #is_back_acting tpa.variables 0