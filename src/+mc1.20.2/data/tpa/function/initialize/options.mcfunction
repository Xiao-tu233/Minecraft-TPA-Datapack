
scoreboard players set #carpet_fake_player_fix tpa.config 0
scoreboard players set #back tpa.config 0
scoreboard players set #search_id tpa.config 0
scoreboard players set #book tpa.config 0
scoreboard players set #player_lang tpa.config 0
scoreboard players set #uses_tick_scheduling tpa.config 0
scoreboard players set #stricter_book_check tpa.config 0
scoreboard players set #home tpa.config 3
scoreboard players set #tp_pos tpa.config 0
scoreboard players set #tp_pos_cooldown tpa.config 36000
scoreboard players set #time_out tpa.config 6000
scoreboard players set #idfix_cooldown tpa.config 6000
scoreboard players set #warp tpa.config 0
scoreboard players set #dimension tpa.config 3
scoreboard players set #frequency tpa.config 20
scoreboard players set #language tpa.config 0
scoreboard players set #tp_spec tpa.config 0

execute unless score #is_updated_from_205 tpa.config matches 0 run scoreboard players set #compact_ids tpa.config 0

# Advanced options
scoreboard players set #sequence_timer tpa.config 30


# For v2.0.5-, 1.15-1.20.1, it's 2, for 1.20.2+ it's 1, for v2.0.6+, 1.15-1.20.1 it's 3
scoreboard players set #home_storage_format tpa.config 1

# For only 1.15 - 1.20.1
scoreboard players set #uses_string_dimension tpa.config 1
scoreboard players set #uses_binary_teleport tpa.config 0
execute if score #is_updated_from_205 tpa.config matches 1 run scoreboard players operation #anchor_search_retries tpa.config = #teleport_threshold_retry tpa.config
execute unless score #is_updated_from_205 tpa.config matches 1 run scoreboard players set #anchor_search_retries tpa.config 150
execute if score #is_updated_from_205 tpa.config matches 1 run scoreboard players operation #max_anchor_summons_attempts tpa.config = #teleport_threshold_retry_summon tpa.config
execute unless score #is_updated_from_205 tpa.config matches 1 run scoreboard players set #max_anchor_summons_attempts tpa.config 5

# Init data storage
data modify storage tpa:tpa warp set value [{}]
data modify storage tpa:tpa option.dimension set value [{id: 0, namespaceid: "minecraft:overworld", color: "green"}, {id: -1, namespaceid: "minecraft:the_nether", color: "red"}, {id: 1, namespaceid: "minecraft:the_end", color: "light_purple"}]
data modify storage tpa:tpa users set value [""]
