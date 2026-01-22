# Parent function: tpa:tick
# This functions runs when the current tick is neither skipped since frequency nor teleporting processing

scoreboard players enable @a tpa.help
scoreboard players enable @a tpa
scoreboard players enable @a tpa.tpa
scoreboard players enable @a tpa.tpahere
scoreboard players enable @a tpa.cancel_req
scoreboard players enable @a tpaccept
scoreboard players enable @a tpa.tpaccept
scoreboard players enable @a tpa.tpaccept_tgl
scoreboard players enable @a tpa.ext_menu
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

# Store config to storage
# execute store result storage tpa:tpa option.tp_spec int 1 run scoreboard players get #tp_spec tpa.config
# execute store result storage tpa:tpa option.carpet_fake_player_fix int 1 run scoreboard players get #carpet_fake_player_fix tpa.config
# For 1.20.4-: storage value check is not available for predicates, we use functions to do that then re-store it to predicates
# Below function doesn't exist for 1.20.5+
execute as @a run function tpa:available
execute as @a run function tpa:output_

# Refresh player's scores when he's online
execute as @a unless score @s tpa.is_online matches 1 run function tpa:detect_join

# Make spectators and fake players not available to teleport by setting their tpa.player_id to -1
execute if score #compact_ids tpa.config matches 1 run scoreboard players set @a[predicate=!tpa:available] tpa.player_id -1
execute if score #compact_ids tpa.config matches 0 run scoreboard players operation @a[predicate=!tpa:available] tpa.player_id *= #-1 tpa.variables

# Offline detect: {Player count decreased ? Remove offline Player ids : do nothing}
execute store result score #current_avail_count tpa.variables if entity @a[predicate=tpa:available]
execute store result score #current_online_count tpa.variables if entity @a
scoreboard players set #sum_of_id tpa.variables 0
execute as @a[predicate=tpa:available] run scoreboard players operation #sum_of_id tpa.variables += @s tpa.player_id

# Give spectators and fake players whose game id was shaderred a new id
execute if score #compact_ids tpa.config matches 1 as @a[predicate=tpa:available, scores={tpa.player_id=..-1}] run scoreboard players set @s tpa.player_id 1
execute if score #compact_ids tpa.config matches 0 as @a[predicate=tpa:available, scores={tpa.player_id=..-1}] run scoreboard players operation @s tpa.player_id = @s tpa.uid

# Remove offline player's id and give them to online players if the option is enabled
execute if score #current_avail_count tpa.variables < #previous_avail_count tpa.variables if score #compact_ids tpa.config matches 1 run function tpa:compact_ids

# Reset for next change
execute unless score #current_avail_count tpa.variables = #previous_avail_count tpa.variables run scoreboard players operation #previous_avail_count tpa.variables = #current_avail_count tpa.variables

# Update online players' online status if player count changed
execute unless score #current_online_count tpa.variables = #previous_online_count tpa.variables run function tpa:update_online
scoreboard players operation #previous_sum_of_id tpa.variables = #sum_of_id tpa.variables

# Give players a new id if their id is 1
execute as @r[scores={tpa.player_id=1}] run function tpa:giveid

# Teleport requests & TPA menu
execute as @a[scores={tpa.simple_menu=2..3}] run function tpa:simple_menu
execute as @a[scores={tpa=1..}] run function tpa:tpa
execute as @a[scores={tpa.tpa=1..}] run function tpa:tpa
execute as @a[scores={tpa.tpahere=1..}] run function tpa:tpahere

# Set back pos before death, and kill tpa book who dropped
execute as @a[scores={tpa.if_death=1..}] run function tpa:player_died

# Time out detect
execute as @a[scores={tpa.tp_to=2..}] run function tpa:req_timer

execute as @a[scores={tpa.cancel_req=1..}] run function tpa:cancel_req

execute as @a[scores={tpaccept=1}] run function tpa:tpaccept
execute as @a[scores={tpa.tpaccept=1..}] run function tpa:tpaccept
execute as @a[scores={tpaccept=2..3}] run function tpa:tpaccept_toggle
execute as @a[scores={tpa.tpaccept_tgl=2..3}] run function tpa:tpaccept_toggle
execute as @a[scores={tpaccept=..-1}] run function tpa:tpadeny
execute as @a[scores={tpa.tpaccept=..-1}] run function tpa:tpadeny

execute as @a[scores={tpa.language=..-1}] run function tpa:language_menu
execute as @a[scores={tpa.language=1..}] run function tpa:language
execute as @a[scores={tpa.help=1..}] run function tpa:help

execute as @a[scores={tpa.idfix=1..}] run function tpa:idfix
execute as @a if score @s tpa.idfix_cd > #ticks_skipped tpa.variables run scoreboard players operation @s tpa.idfix_cd -= #ticks_skipped tpa.variables
execute as @a[scores={tpa.idfix_cd=0..}] if score @s tpa.idfix_cd <= #ticks_skipped tpa.variables run scoreboard players set @s tpa.idfix_cd 0

execute as @a[scores={tpa.ext_menu=1..}] run function tpa:extended_menu
execute as @a[scores={tpa.mute=2..}] run function tpa:mute
execute as @a[scores={tpa.output=3..}] run function tpa:output
execute as @a[scores={tpa.here=1..}] run function tpa:here

# TPA book 传送书
execute as @a[scores={tpa.book=1}] run function tpa:book
execute as @a[scores={tpa.book=3..}] run function tpa:book
execute as @a[scores={tpa.book=2}] run function tpa:book/state_validation
execute as @a[scores={tpa.book=2}] if entity @s[nbt={Inventory: [{Slot: -106b, id: "minecraft:written_book", tag: {isTpaBook:1b}}]}] run function tpa:book/stop
# Clear Players shouldn't have book
clear @a[scores={tpa.book=0}] minecraft:written_book{isTpaBook:1b}
# Kill book item entity which is not dropped by any avail player
execute as @e[type=item, name='Written Book'] if data entity @s Item.tag.isTpaBook run kill @s
# Remove book from Item Frame with book=0 player nearby
execute as @e[type=!item, nbt={Item:{tag:{isTpaBook: 1b}}}] run data remove entity @s Item

# 上一位置
execute as @a[scores={back=1..}] run function tpa:back
execute as @a[scores={tpa.back=1..}] run function tpa:back

# Home
execute as @a[scores={home=..-1}] run function tpa:home
execute as @a[scores={home=1..}] run function tpa:home
execute as @a[scores={tpa.home=..-1}] run function tpa:home
execute as @a[scores={tpa.home=1..}] run function tpa:home
execute as @a[scores={tpa.sethome=1..}] run function tpa:sethome
execute as @a[scores={tpa.removehome=1..}] run function tpa:removehome

# Warp
execute as @a[scores={tpa.warp=..-1}] run function tpa:warp
execute as @a[scores={tpa.warp=1..}] run function tpa:warp
execute if score #editting_warp.trigger tpa.variables = #editting_warp.trigger tpa.variables unless score #editting_warp.trigger tpa.variables = #editting_warp tpa.variables as @p[tag=tpa.warp_editor] run function tpa:warp/select
execute if entity @p[tag=tpa.warp_editor] run function tpa:warp/countdown
execute unless entity @p[tag=tpa.warp_editor] run scoreboard players set #warp_edit_countdown tpa.variables 100

# Both below ones need Ingame keyboard datapack as dependency
# Search ID
execute as @a[scores={tpa.search_id=1..}] run function tpa:search_id
execute as @a[scores={tpa.search_id.ky=1..}] run function tpa:search_id/input_key
execute as @a[scores={tpa.search_id.ky=..-1}] run function tpa:search_id/abort

# Teleport to a certain position given by requester (No available if wasn't enabled @ tpa:options)
execute as @a[scores={tpa.pos=..-1}] run function tpa:tp_pos/conditions
execute as @a[scores={tpa.pos=1..}] run function tpa:tp_pos/conditions

# cd -= ticks_skipped ? ticks_skipped > cd : cd = 0
execute as @a if score @s tpa.pos_cd > #ticks_skipped tpa.variables run scoreboard players operation @s tpa.pos_cd -= #ticks_skipped tpa.variables
execute as @a[scores={tpa.pos_cd=0..}] if score @s tpa.pos_cd <= #ticks_skipped tpa.variables run scoreboard players set @s tpa.pos_cd 0

