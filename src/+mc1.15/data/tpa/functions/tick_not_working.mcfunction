# Called by: (Player) Any Operator
# Load language
scoreboard players operation #target_lang tpa.variables = #language tpa.config
function tpa:load_lang

# Reactivate if tick temporarily disabled
execute if score #frequency tpa.config matches 0 run scoreboard players set #frequency tpa.config 20

# Show warning messages if options is called by server terminal by showing visual item entity's name
execute if score #game_version tpa.config matches 117.. run function tpa:tick_not_working_console_calling_check

# Disable command block output to avoid spamming "Executing function tpa:tick"
gamerule commandBlockOutput false
give @s minecraft:repeating_command_block{BlockEntityTag: {id: "command_block", Command: "function tpa:tick", conditionMet: 1b, auto: 1b}, CustomName: '"§r§b在合适的地方把它放下 §8| §bPlace it down in the appropriate place"'}
tellraw @a [{"storage": "tpa:tpa", "nbt": "loaded_lang.header"}, {"storage": "tpa:tpa", "nbt": "loaded_lang.tick_not_working_tips_line1"}]
tellraw @a [{"storage": "tpa:tpa", "nbt": "loaded_lang.tick_not_working_tips_line2"}, " ", {"storage": "tpa:tpa", "nbt": "loaded_lang.tick_not_working_button_set_schedule", "hoverEvent": {"action": "show_text", "value": {"storage": "tpa:tpa", "nbt": "loaded_lang.tick_not_working_button_set_schedule_hoverevent"}}, "clickEvent": {"action":  "run_command", "value": "/scoreboard players set #uses_tick_scheduling tpa.config 1"}}]
tellraw @a [{"storage": "tpa:tpa", "nbt": "loaded_lang.tick_not_working_tips_line3"}]