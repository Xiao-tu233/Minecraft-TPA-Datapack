scoreboard players set @s tpa.language 0
scoreboard players set #is_server_selecting tpa.variables 0
execute if score #target_lang tpa.variables = #target_lang tpa.variables run scoreboard players set #is_server_selecting tpa.variables 1
function tpa:load_lang

# If *1. executor is a player* and *2. player is not allowed to choose a language* and *3. server has a language chosen*, stop player from choosing a language
scoreboard players set #can_choose tpa.variables 1
       # Player can't choose                      | is a player choosing                                | server has lang chosen   
execute if score #player_lang tpa.config matches 0 if score #is_server_selecting tpa.variables matches 0 if score #language tpa.config matches 1.. run scoreboard players set #can_choose tpa.variables 0

# Tell player failed to choose a language
execute if score #can_choose tpa.variables matches 0 run scoreboard players operation @s tpa.lang_temp = #language tpa.config
execute if score #can_choose tpa.variables matches 0 run function tpa:sounds/no
execute if score #can_choose tpa.variables matches 0 run tellraw @s[scores={tpa.output=1..2}] [{storage: "tpa:tpa", nbt: "temp.lang.header"}, {storage: "tpa:tpa", nbt: "temp.lang.lang_disabled"}]
execute if score #can_choose tpa.variables matches 0 run title @s[scores={tpa.output=0..1}] actionbar [{storage: "tpa:tpa", nbt: "temp.lang.lang_disabled", "color": "red"}]
execute if score #can_choose tpa.variables matches 0 run return 0

# Show title
execute unless score #is_server_selecting tpa.variables matches 1 run tellraw @s[scores={tpa.output=1..2}] [{storage: "tpa:tpa", nbt: "temp.lang.header"}, {storage: "tpa:tpa", nbt: "temp.lang.lang_menu_title"}, "\n", {storage: "tpa:tpa", nbt: "temp.lang.lang_menu_select_button", click_event: {action: "suggest_command", command: "/trigger tpa.language set " }, hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "temp.lang.lang_menu_cancel_button_hoverevent"} } } ]
execute if score #is_server_selecting tpa.variables matches 1 run tellraw @s [{storage: "tpa:tpa", nbt: "temp.lang.header"}, {storage: "tpa:tpa", nbt: "temp.lang.lang_menu_title"}, "\n", {storage: "tpa:tpa", nbt: "temp.lang.lang_button_server", click_event: {action: "suggest_command", command: "/scoreboard players set #language tpa.config " }, hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "temp.lang.lang_menu_select_button_hoverevent"} } } ]

# Init enum vars
scoreboard players set #i tpa.variables 0
data remove storage tpa:tpa temp.language
data modify storage tpa:tpa temp.language set from storage tpa:tpa lang
execute store result score #langs_installed tpa.variables run data get storage tpa:tpa lang

# Remove language 0, cuz which was designed to be unchoosable
data remove storage tpa:tpa temp.language[0]

# Call loop function
function tpa:language_menu_loop