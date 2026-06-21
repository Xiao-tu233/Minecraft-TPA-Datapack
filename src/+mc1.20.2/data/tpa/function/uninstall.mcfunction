# Show warning messages if options is called by server terminal by showing visual item entity's name
function tpa:console_calling_check/uninstall
execute unless entity @s run return 0

scoreboard players operation #target_lang tpa.variables = #language tpa.config
function tpa:load_lang

# Remove all objectives
scoreboard objectives remove tpa
scoreboard objectives remove back
scoreboard objectives remove tpaccept
scoreboard objectives remove tpa.help
scoreboard objectives remove tpa.tpaccept
scoreboard objectives remove tpa.tpaccept_toggle
scoreboard objectives remove tpa.tpa
scoreboard objectives remove tpa.tp_to
scoreboard objectives remove tpa.tpahere
scoreboard objectives remove tpa.tp_here
scoreboard objectives remove tpa.cancel_req
scoreboard objectives remove tpa.player_id
scoreboard objectives remove tpa.player_id_temp
scoreboard objectives remove tpa.uid
scoreboard objectives remove tpa.is_online
scoreboard objectives remove tpa.spec
scoreboard objectives remove tpa.idfix
scoreboard objectives remove tpa.idfix_cd
scoreboard objectives remove tpa.back
scoreboard objectives remove tpa.config
scoreboard objectives remove tpa.variables
scoreboard objectives remove tpa.extended_menu
scoreboard objectives remove tpa.mute
scoreboard objectives remove tpa.search_id
scoreboard objectives remove tpa.search_id.key
scoreboard objectives remove tpa.search_id.capslock
scoreboard objectives remove tpa.req_timer
scoreboard objectives remove tpa.if_death
scoreboard objectives remove tpa.if_online
scoreboard objectives remove tpa.book
scoreboard objectives remove tpa.pos
scoreboard objectives remove tpa.pos.x
scoreboard objectives remove tpa.pos.y
scoreboard objectives remove tpa.pos.z
scoreboard objectives remove tpa.pos.x_temp
scoreboard objectives remove tpa.pos.y_temp
scoreboard objectives remove tpa.pos.z_temp
scoreboard objectives remove tpa.pos_cd
scoreboard objectives remove tpa.here
scoreboard objectives remove tpa.sethome
scoreboard objectives remove tpa.home
scoreboard objectives remove home
scoreboard objectives remove tpa.removehome
scoreboard objectives remove tpa.output
scoreboard objectives remove tpa.simple_menu
scoreboard objectives remove tpa.language
scoreboard objectives remove tpa.selected_language
scoreboard objectives remove tpa.warp
scoreboard objectives remove tpa.available
scoreboard objectives remove tpa.output_
scoreboard objectives remove tpa.dialog
# scoreboard objectives remove tpa.yaw
# scoreboard objectives remove tpa.pitch
# scoreboard objectives remove tpa.yaw.origin
# scoreboard objectives remove tpa.pitch.origin
# scoreboard objectives remove tpa.first_extreme
# scoreboard objectives remove tpa.second_extreme
# scoreboard objectives remove tpa.hg.interval_timer
# scoreboard objectives remove tpa.hg.sequence_timer

tag @a remove not_match
tag @a remove to_modify
tag @a remove id
data remove storage tpa:tpa back
data remove storage tpa:tpa extended_menu
data remove storage tpa:tpa search_id
data remove storage tpa:tpa book
data remove storage tpa:tpa pos
data remove storage tpa:tpa temp
data remove storage tpa:tpa home
data remove storage tpa:tpa warp
data remove storage tpa:tpa option
data remove storage tpa:tpa loaded_language
data remove storage tpa:tpa lang

data remove storage tpa:tpa config
data remove storage tpa:tpa version
data remove storage tpa:tpa game_version
data remove storage tpa:tpa version_range

# Remove text display
kill @e[tag=tpa.text_display]
forceload remove 29999984 29999984

# Language system will no longer work, so store the last 2 words in visual entity
execute at @s run summon item ~ ~ ~ {Item: {id: "stone", count: 1}, PickupDelay: 32767s, Age: -32768s, Health: 0, NoGravity: true, Tags: ["tpa.uninstall.datapack_last_words"]}
data modify entity @n[tag=tpa.uninstall.datapack_last_words] Item.components."minecraft:custom_data".header set from storage tpa:tpa loaded_lang.header
data modify entity @n[tag=tpa.uninstall.datapack_last_words] Item.components."minecraft:custom_data".done set from storage tpa:tpa loaded_lang.uninstall_done
data modify entity @n[tag=tpa.uninstall.datapack_last_words] Item.components."minecraft:custom_data".uninstall_enable_folder_button set from storage tpa:tpa loaded_lang.uninstall_enable_folder_button
data modify entity @n[tag=tpa.uninstall.datapack_last_words] Item.components."minecraft:custom_data".uninstall_enable_folder_button_hoverevent set from storage tpa:tpa loaded_lang.uninstall_enable_folder_button_hoverevent
data modify entity @n[tag=tpa.uninstall.datapack_last_words] Item.components."minecraft:custom_data".uninstall_enable_zip_button set from storage tpa:tpa loaded_lang.uninstall_enable_zip_button
data modify entity @n[tag=tpa.uninstall.datapack_last_words] Item.components."minecraft:custom_data".uninstall_enable_zip_button_hoverevent set from storage tpa:tpa loaded_lang.uninstall_enable_zip_button_hoverevent
data remove storage tpa:tpa loaded_lang
function tpa:update_disable
#<--!Script Version Inserting Locator-->
tellraw @a [{interpret: true, entity: "@n[tag=tpa.uninstall.datapack_last_words]", nbt: "Item.components.\"minecraft:custom_data\".header"}, {interpret: true, entity: "@n[tag=tpa.uninstall.datapack_last_words]", nbt: "Item.components.\"minecraft:custom_data\".done"}, {text: "", extra: ["§6[§r", {interpret: true, entity: "@n[tag=tpa.uninstall.datapack_last_words]", nbt: "Item.components.\"minecraft:custom_data\".uninstall_enable_folder_button"}, "§6]"], click_event: {action: "run_command", command: "/datapack enable \"file/TPA_Datapack-2.1+mc1.20.2\""}, hover_event: {action: "show_text", value: {interpret: true, entity: "@n[tag=tpa.uninstall.datapack_last_words]", nbt: "Item.components.\"minecraft:custom_data\".uninstall_enable_folder_button_hoverevent"}}}, " ", {text: "", extra: ["§6[§r", {interpret: true, entity: "@n[tag=tpa.uninstall.datapack_last_words]", nbt: "Item.components.\"minecraft:custom_data\".uninstall_enable_zip_button"}, "§6]"], click_event: {action: "run_command", command: "/datapack enable \"file/TPA_Datapack-2.1+mc1.20.2.zip\""}, hover_event: {action: "show_text", value: {interpret: true, entity: "@n[tag=tpa.uninstall.datapack_last_words]", nbt: "Item.components.\"minecraft:custom_data\".uninstall_enable_zip_button_hoverevent"}}}]

# Kill the visual entity
kill @e[tag=tpa.uninstall.datapack_last_words]