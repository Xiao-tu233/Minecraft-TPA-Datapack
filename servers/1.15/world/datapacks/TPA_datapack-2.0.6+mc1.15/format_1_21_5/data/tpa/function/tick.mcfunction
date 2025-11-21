# TPA tick function: run every ticks

execute if score #if_skip_tick tpa.variables matches 0 run scoreboard players set #ticks_skipped tpa.variables 0
execute store result score #if_skip_tick tpa.variables run function tpa:if_skip_tick
scoreboard players add #ticks_skipped tpa.variables 1
execute if score #if_skip_tick tpa.variables matches 1 run return 0

scoreboard players enable @a tpa.help
scoreboard players enable @a tpa
scoreboard players enable @a tpa.tpa
scoreboard players enable @a tpa.tpahere
scoreboard players enable @a tpa.cancel_req
scoreboard players enable @a tpaccept
scoreboard players enable @a tpa.tpaccept
scoreboard players enable @a tpa.tpaccept_toggle
scoreboard players enable @a tpa.extended_menu
scoreboard players enable @a tpa.idfix
scoreboard players enable @a tpa.search_id
scoreboard players enable @a tpa.mute
scoreboard players enable @a tpa.output
scoreboard players enable @a tpa.back
scoreboard players enable @a back
scoreboard players enable @a tpa.book
scoreboard players enable @a tpa.pos
scoreboard players enable @a tpa.pos.x
scoreboard players enable @a tpa.pos.y
scoreboard players enable @a tpa.pos.z
scoreboard players enable @a tpa.here
scoreboard players enable @a home
scoreboard players enable @a tpa.home
scoreboard players enable @a tpa.sethome
scoreboard players enable @a tpa.removehome
scoreboard players enable @a tpa.simple_menu
scoreboard players enable @a tpa.language

# offline detect
execute store result score #current_player_count tpa.variables if entity @a
execute if score #current_player_count tpa.variables < #previous_player_count tpa.variables run function tpa:remove_offline
scoreboard players operation #previous_player_count tpa.variables = #current_player_count tpa.variables

execute if score #offline_id tpa.variables matches 1.. run function tpa:remove_invalid_requests

# show [TPA menu] whenever some1 logged on
execute as @a[tag=!__tpa__] unless score @s tpa.is_online matches 1 run function tpa:detect_join


# make spectators and fake players not available to teleport by setting their tpa.player_id to -1
execute if score #tp_spec tpa.config matches 0 as @a[gamemode=spectator] unless score @s tpa.player_id matches -1 \
    run function tpa:remove_invalid_requests
execute if score #tp_spec tpa.config matches 0 as @a[gamemode=spectator] unless score @s tpa.player_id matches -1 \
    run scoreboard players set @s tpa.player_id -1
execute if score #carpet_fake_player_fix tpa.config matches 1 \
    run scoreboard players set @a[tag=fake_player] tpa.player_id -1
# Give spectators and fake players whose game id was shaderred a new id
execute as @a[gamemode=!spectator, scores={tpa.player_id=-1}, tag=!fake_player] run scoreboard players set @s tpa.player_id 1

# give players a new id if their id is 0, 1
execute as @a unless score @s tpa.player_id = @s tpa.player_id run scoreboard players set @s tpa.player_id 1
execute as @a if score @s tpa.player_id matches 0..1 run scoreboard players set @s tpa.player_id 1

execute if entity @a[tag=__tpa__] as @a[tag=__tpa__] run function tpa:get_id
execute if entity @a[tag=__tpa__] run function tpa:fake_player/kill with storage tpa:tpa temp

execute as @r[scores={tpa.player_id=0..1}] run function tpa:giveid

execute if score #commands_count key.var > #commands_not_match tpa.variables run function tpa:key_handler
scoreboard players operation #commands_not_match tpa.variables = #commands_count key.var

execute if score #req_tab key.var matches 1 run function tpa:key_tab_handler

execute as @a[scores={tpa.simple_menu=2..3}] run function tpa:simple_menu
execute as @a[scores={tpa=1..}] run function tpa:tpa
execute as @a[scores={tpa.tpa=1..}] run function tpa:tpa
execute as @a[scores={tpa.tpahere=1..}] run function tpa:tpahere

# store pos before death
execute as @a[scores={tpa.if_death=1}] if score #back tpa.config matches 0 run function tpa:back/store_pos
execute as @a[scores={tpa.if_death=1}] if score #back tpa.config matches 0 \
run scoreboard players operation #timer_to_sleep tpa.variables = #sleep_mode tpa.config
execute as @a[scores={tpa.if_death=1}] if score #back tpa.config matches 0 if score #debug_mode tpa.config matches 1 \
run tellraw @a ["[§bTPA§r] §6 Debug: §r",{selector:"@s"},"'s death was detected, pos stored."]
scoreboard players set @a tpa.if_death 0

# time out detect
execute as @a[scores={tpa.req_timer=0, tpa.tp_to=2..}] run function tpa:time_out
execute as @a[scores={tpa.tp_to=2..}] if score @s tpa.req_timer > #ticks_skipped tpa.variables \
    run scoreboard players operation @s tpa.req_timer -= #ticks_skipped tpa.variables
# set zero if timer will be negative after minus
execute as @a[scores={tpa.req_timer=0.., tpa.tp_to=2..}] if score @s tpa.req_timer <= #ticks_skipped tpa.variables \
    run scoreboard players set @s tpa.req_timer 0
execute as @a unless score @s tpa.tp_to matches 2.. run scoreboard players set @s tpa.req_timer 0

execute as @a[scores={tpa.cancel_req=1..}] run function tpa:cancel_req

execute as @a[scores={tpaccept=1}] run function tpa:tpaccept
execute as @a[scores={tpa.tpaccept=1..}] run function tpa:tpaccept
execute as @a[scores={tpaccept=2..3}] run function tpa:tpaccept_toggle
execute as @a[scores={tpa.tpaccept_toggle=2..3}] run function tpa:tpaccept_toggle
execute as @a[scores={tpaccept=..-1}] run function tpa:tpadeny
execute as @a[scores={tpa.tpaccept=..-1}] run function tpa:tpadeny

execute as @a[scores={tpa.language=..-1}] run function tpa:language_menu
execute as @a[scores={tpa.language=1..}] run function tpa:language
execute as @a[scores={tpa.help=1..}] run function tpa:help

execute as @a[scores={tpa.idfix=1..}] run function tpa:idfix
execute as @a if score @s tpa.idfix_cd > #ticks_skipped tpa.variables \
run scoreboard players operation @s tpa.idfix_cd -= #ticks_skipped tpa.variables
execute as @a[scores={tpa.idfix_cd=0..}] if score @s tpa.idfix_cd <= #ticks_skipped tpa.variables \
run scoreboard players set @s tpa.idfix_cd 0

execute as @a[scores={tpa.extended_menu=1..}] run function tpa:extended_menu
execute as @a[scores={tpa.mute=2..}] run function tpa:mute
execute as @a[scores={tpa.output=3..}] run function tpa:output
execute as @a[scores={tpa.here=1..}] run function tpa:here

# TPA book 传送书
execute as @a[scores={tpa.book=1..}] run function tpa:book
execute at @n[nbt={Item:{components:{"minecraft:custom_data":{isTpaBook: 1b}}}}] run function tpa:book/refresh
execute as @a[nbt={equipment: {offhand: {components: {"minecraft:custom_data": {isTpaBook: 1b}}}}}] run function tpa:book/stop


execute as @a[scores={back=1..}] run function tpa:back
execute as @a[scores={tpa.back=1..}] run function tpa:back

# home
execute as @a[scores={home=..-1}] run function tpa:home
execute as @a[scores={home=1..}] run function tpa:home
execute as @a[scores={tpa.home=..-1}] run function tpa:home
execute as @a[scores={tpa.home=1..}] run function tpa:home
execute as @a[scores={tpa.sethome=1..}] run function tpa:sethome
execute as @a[scores={tpa.removehome=1..}] run function tpa:removehome

# Both below ones need Ingame keyboard datapack as dependency
# Search ID
execute as @a[scores={tpa.search_id=1..}] run function tpa:search_id

# Teleport to a certain position given by requester (No available if wasn't enabled @ tpa:options)
execute as @a if score @s tpa.pos_cd > #ticks_skipped tpa.variables \
run scoreboard players operation @s tpa.pos_cd -= #ticks_skipped tpa.variables
execute as @a[scores={tpa.pos_cd=0..}] if score @s tpa.pos_cd <= #ticks_skipped tpa.variables \
run scoreboard players set @s tpa.pos_cd 0
execute as @a[scores={tpa.pos=1..}] run function tpa:tp_pos

# Get offline id
scoreboard players set #id_sum tpa.variables 0
execute as @a[scores={tpa.player_id=2..}] run scoreboard players operation #id_sum tpa.variables += @s tpa.player_id
scoreboard players operation #offline_id tpa.variables = #id_sum_ tpa.variables
scoreboard players operation #offline_id tpa.variables -= #id_sum tpa.variables
scoreboard players operation #id_sum_ tpa.variables = #id_sum tpa.variables