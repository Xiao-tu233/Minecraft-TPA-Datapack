
execute store result score #x tpa.variables run data get entity @s Pos[0]
execute store result score #z tpa.variables run data get entity @s Pos[2]

execute store result score #target_x tpa.variables run data get storage tpa:tpa temp.teleport.Pos[0]
execute store result score #dx tpa.variables run data get storage tpa:tpa temp.teleport.Pos[0]
scoreboard players operation #dx tpa.variables -= #x tpa.variables
execute store result score #target_z tpa.variables run data get storage tpa:tpa temp.teleport.Pos[2]
execute store result score #dz tpa.variables run data get storage tpa:tpa temp.teleport.Pos[2]
scoreboard players operation #dz tpa.variables -= #z tpa.variables

scoreboard players operation #sim_dist tpa.variables = #sim_dist tpa.config
scoreboard players operation #sim_dist tpa.variables *= #16 tpa.variables
scoreboard players operation #sim_dist tpa.variables += #16 tpa.variables

summon item ~ ~ ~ {Item: {id: "stone", Count: 1b, tag: {isTeleportAnchor: 1b}}, PickupDelay: 32767s, Age: -32768s, Health: 0, NoGravity: true}

scoreboard players set #if_accuate_tp tpa.variables 0
scoreboard players set #is_dimension_loaded tpa.variables 0
scoreboard players add #teleport_summon_retried tpa.variables 1
execute if score #teleport_summon_retried tpa.variables matches 1.. if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §cSummoned an anchor for detection. Retrid: ", {"score": {"name": "#teleport_summon_retried", "objective": "tpa.variables"}}, "/", {"score": {"name": "#teleport_threshold_retry_summon", "objective": "tpa.config"}, "underlined": true, "clickEvent": {"action": "suggest_command", "value": "/scoreboard players set #teleport_threshold_retry_summon tpa.config "}, "hoverEvent": {"action": "show_text", "value": "Click to edit Teleport summon retries threshold"}}, ")."]
