# Called by: (Player) Any Operator
# Load language
scoreboard players operation #target_lang tpa.variables = #language tpa.config
function tpa:load_lang

# Reactivate if tick temporarily disabled
execute if score #frequency tpa.config matches 0 run scoreboard players set #frequency tpa.config 20

# Server calling check
# Show warning messages if options is called by server terminal by showing visual item entity's name
function tpa:console_calling_check/tick_not_working
execute unless entity @s run return 0

# Disable command block output to avoid spamming "Executing function tpa:tick"
gamerule minecraft:command_block_output false
give @s minecraft:repeating_command_block[minecraft:block_entity_data={id: command_block, Command: "function tpa:tick", conditionMet: 1b, auto: 1b}, minecraft:custom_name='"§r§b在合适的地方把它放下 §8| §bPlace it down in the appropriate place"']
tellraw @a [{interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.header"}, {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tick_not_working_tips_line1"}]
tellraw @a [{interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tick_not_working_tips_line2"}, " ", {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tick_not_working_button_set_schedule", hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tick_not_working_button_set_schedule_hoverevent"}}, click_event: {action:  "run_command", command: "/scoreboard players set #uses_tick_scheduling tpa.config 1"}}]
tellraw @a [{interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tick_not_working_tips_line3"}]