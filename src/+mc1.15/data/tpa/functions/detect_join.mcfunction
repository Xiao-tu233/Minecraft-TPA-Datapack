
# Set default language to server language if lang is set before player first join
execute unless score @s tpa.lang_temp matches 1.. run scoreboard players operation @s tpa.lang_temp = #language tpa.config
function tpa:load_lang
execute unless score #language tpa.config matches 1.. run tellraw @s [{"storage": "tpa:tpa", "nbt": "loaded_lang.header"}, "检测到默认语言未设置, 请点击下方设置TPA数据包的服务器默认语言 | Detected Default language is not set, please click below to set default server language of TPA datapack:  ", {"text": "[§a设置 | Set§r]", "clickEvent": {"action": "run_command", "value": "/trigger tpa.language set -1"}}]

# Reset scores
scoreboard players set @s tpa.tp_to 0
scoreboard players set @s tpa.tp_here 0
scoreboard players set @s tpa.tpaccept 0
scoreboard players set @s tpa.req_timer 0
scoreboard players set @s tpa.if_death 0
scoreboard players set @s tpa.pos 0
scoreboard players set @s tpa.pos.x 0
scoreboard players set @s tpa.pos.y 0
scoreboard players set @s tpa.pos.z 0
scoreboard players reset @s tpa.pos.x_temp
scoreboard players reset @s tpa.pos.y_temp
scoreboard players reset @s tpa.pos.z_temp
scoreboard players set @s tpa.is_online 1
scoreboard players set @a tpa.search_id.ky 0
scoreboard players set @a tpa.search_id.cl 0

# Fake player detection
tag @s remove tpa.fake_player
# execute if score #carpet_fake_player_fix tpa.config matches 1 run function tpa:fake_player_fix/tag {cmd: "script run query(player(), 'player_type') == 'fake'"}

# Abandon old tag
execute if score #is_updated_from_205 tpa.config matches 1 run tag @s remove TPA_user

# Detect if player is first join
execute unless score @s tpa.uid = @s tpa.uid run function tpa:first_join

# Set player ID
execute if score #compact_ids tpa.config matches 0 as @s[predicate=tpa:available] run scoreboard players operation @s tpa.player_id = @s tpa.uid
execute if score #compact_ids tpa.config matches 1 as @s[predicate=tpa:available] run scoreboard players set @s tpa.player_id 1

# Show TPA menu button when player joins
tellraw @s[predicate=tpa:output/show_chatbar] [{"storage":"tpa:tpa", "nbt":"loaded_lang.reqer_first_join", "clickEvent": {"action": "run_command", "value": "/trigger tpa"}}]
