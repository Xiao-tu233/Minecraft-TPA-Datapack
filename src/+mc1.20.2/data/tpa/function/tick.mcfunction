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
scoreboard players enable @a tpa.warp
scoreboard players enable @a tpa.simple_menu
scoreboard players enable @a tpa.language
scoreboard players enable @a tpa.search_id.key
scoreboard players enable @a tpa.dialog

# Store config to storage
execute store result storage tpa:tpa option.tp_spec int 1 run scoreboard players get #tp_spec tpa.config
execute store result storage tpa:tpa option.carpet_fake_player_fix int 1 run scoreboard players get #carpet_fake_player_fix tpa.config

# Update online players' online status if player count changed
execute unless score #current_online_count tpa.variables = #previous_online_count tpa.variables run function tpa:update_online
# Refresh player's scores when he's online
execute as @a unless score @s tpa.is_online matches 1 run function tpa:on_join

# Update every requests: timer, availability, etc.
function tpa:requests/update

# Set back pos before death, and kill tpa book who dropped
execute as @a[scores={tpa.if_death=1..}] run function tpa:player_died

# Personal settings
# execute as @a[scores={tpa.extended_menu=1..}] run function tpa:extended_menu
execute as @a[scores={tpa.mute=2..}] run function tpa:mute
execute as @a[scores={tpa.output=3..}] run function tpa:output
execute as @a[scores={tpaccept=2..3}] run function tpa:tpaccept_toggle
execute as @a[scores={tpa.tpaccept=2..4}] run function tpa:tpaccept_toggle
execute as @a[scores={tpa.tpaccept_toggle=2..3}] run function tpa:tpaccept_toggle


# Teleport requests & TPA menu
# execute as @a[scores={tpa.simple_menu=2..3}] run function tpa:simple_menu
execute as @a[scores={tpa.dialog=1..}] run function tpa:dialog
execute as @a[scores={tpa=0}] run function tpa:tpa_menu
execute as @a[scores={tpa.tpa=0}] run function tpa:tpa_menu
execute as @a[scores={tpa=1..}] run function tpa:tpa
execute as @a[scores={tpa.tpa=1..}] run function tpa:tpa
execute as @a[scores={tpa.tpahere=0}] run function tpa:tpahere_menu
execute as @a[scores={tpa.tpahere=1..}] run function tpa:tpahere
execute as @a[scores={tpa.cancel_req=1..}] run function tpa:cancel_req

execute as @a[scores={tpaccept=1}] run function tpa:tpaccept
execute as @a[scores={tpa.tpaccept=1}] run function tpa:tpaccept
execute as @a[scores={tpa.tpaccept=5..}] run function tpa:tpaccept
execute as @a[scores={tpaccept=..-1}] run function tpa:tpadeny
execute as @a[scores={tpa.tpaccept=..-1}] run function tpa:tpadeny

execute as @a[scores={tpa.language=..-1}] run function tpa:language_menu
execute as @a[scores={tpa.language=1..}] run function tpa:language
execute as @a[scores={tpa.help=1..}] run function tpa:help

execute as @a[scores={tpa.here=1..}] run function tpa:here

# TPA book 传送书
execute as @a[predicate=tpa:is_requesting_book] run function tpa:book
execute as @a[scores={tpa.book=2}] run function tpa:book/state_validation
execute as @a[scores={tpa.book=2}] if items entity @s weapon.offhand written_book[custom_data={isTpaBook: 1b}] run function tpa:book/stop
# Clear Players shouldn't have book
clear @a[scores={tpa.book=0}] minecraft:written_book[minecraft:custom_data={isTpaBook:1b}]
# Kill book item entity which is not dropped by any avail player
execute as @e[type=item, name='Written Book'] if data entity @s Item.components."minecraft:custom_data".isTpaBook run kill @s
# Remove book from Item Frame with book=0 player nearby
execute as @e[type=!item, nbt={Item:{components:{"minecraft:custom_data":{isTpaBook: 1b}}}}] run data remove entity @s Item

# 上一位置
execute as @a[scores={back=1..}] run function tpa:back
execute as @a[scores={tpa.back=1..}] run function tpa:back

# Home
execute as @a[predicate=tpa:home] run function tpa:home
execute as @a[scores={tpa.sethome=1..}] run function tpa:sethome
execute as @a[scores={tpa.removehome=1..}] run function tpa:removehome

# Warp
execute as @a[predicate=tpa:warp] run function tpa:warp

# Both below ones need Ingame keyboard datapack as dependency
# Search ID
execute as @a[scores={tpa.search_id=1..}] run function tpa:search_id
execute as @a[scores={tpa.search_id.key=1..}] run function tpa:search_id/input_key
execute as @a[scores={tpa.search_id.key=..-1}] run function tpa:search_id/abort

# Teleport to a certain position given by requester (No available if wasn't enabled @ tpa:options)
execute as @a[scores={tpa.pos=..-1}] run function tpa:tp_pos/conditions
execute as @a[scores={tpa.pos=1..}] run function tpa:tp_pos/conditions

# cd -= ticks_skipped ? ticks_skipped > cd : cd = 0
execute as @a if score @s tpa.pos_cd > #ticks_skipped tpa.variables run scoreboard players operation @s tpa.pos_cd -= #ticks_skipped tpa.variables
execute as @a[scores={tpa.pos_cd=0..}] if score @s tpa.pos_cd <= #ticks_skipped tpa.variables run scoreboard players set @s tpa.pos_cd 0

# Call the tick function if the option is enabled
execute if score #uses_tick_scheduling tpa.config matches 1 run schedule function tpa:tick 1t
