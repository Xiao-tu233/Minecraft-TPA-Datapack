# Called by: (Player) Any Operator
# Load language
scoreboard players operation #target_lang tpa.variables = #language tpa.config
function tpa:load_lang

# Reactivate if tick temporarily disabled
execute if score #frequency tpa.config matches 0 run scoreboard players set #frequency tpa.config 20

# Server calling check
summon item ~ ~ ~ {Item: {id: "stone", Count: 1, tag: {isOptionServerCallingItem: 1b}}, PickupDelay: 32767s, Age: -32768s, Health: 0, NoGravity: true}
summon minecraft:text_display ~ ~ ~ {alignment:"center",Tags:["tpa.text_display"]}
data modify entity @e[sort=nearest, limit=1, tag=tpa.text_display] text set value '["[TPA] ", {"storage": "tpa:tpa", "nbt": "loaded_lang.tick_not_working_server_calling"}]'
data modify entity @e[sort=nearest, limit=1, nbt={Item: {tag: {isOptionServerCallingItem: 1b}}}] CustomName set from entity @e[sort=nearest, limit=1, tag=tpa.text_display] text 
kill @e[tag=tpa.text_display]
execute unless entity @s run say @e[sort=nearest, limit=1, nbt={Item: {tag: {isOptionServerCallingItem: 1b}}}]
execute unless entity @s run say Please acquire Command block in client instead of server terminal.
kill @e[nbt={Item: {tag: {isOptionServerCallingItem: 1b}}}]
execute unless entity @s run return 0

# Disable command block output to avoid spamming "Executing function tpa:tick"
gamerule commandBlockOutput false
give @s minecraft:repeating_command_block{BlockEntityTag: {id: "command_block", Command: "function tpa:tick", conditionMet: 1b, auto: 1b}, CustomName: '"§r§b在合适的地方把它放下 §8| §bPlace it down in the appropriate place"'}
tellraw @a [{"storage": "tpa:tpa", "nbt": "loaded_lang.header"}, {"storage": "tpa:tpa", "nbt": "loaded_lang.tick_not_working_tips_line1"}]
tellraw @a [{"storage": "tpa:tpa", "nbt": "loaded_lang.tick_not_working_tips_line2"}, " ", {"storage": "tpa:tpa", "nbt": "loaded_lang.tick_not_working_button_set_schedule", "hoverEvent": {"action": "show_text", "value": {"storage": "tpa:tpa", "nbt": "loaded_lang.tick_not_working_button_set_schedule_hoverevent"}}, "clickEvent": {"action":  "run_command", "value": "/scoreboard players set #uses_tick_scheduling tpa.config 1"}}]
tellraw @a [{"storage": "tpa:tpa", "nbt": "loaded_lang.tick_not_working_tips_line3"}]