# tpa.pos in different states:
# -2: teleport triggered
# -1: abort triggered
# 0: Not triggered
# 1: Show input message with [x] [y] [z] with click event
# 2: Listening for input
# We convert (tpa.pos - 2) to binary format: bit 0 for x, bit 1 for y, bit 2 for z, so we have:
# To see what is inputted: (3-9)
# is x inputted: (tpa.pos - 2) % 1
# is y inputted: (tpa.pos - 2) % 2
# is z inputted: (tpa.pos - 2) % 4

function tpa:load_lang

# Conditions:
# 0: nothing modified
# 1: requester is spec
# 2: tp was disabled
# 3: still in cooldown
# 4: teleportted so far away that reached server's limit ( Only posible at condition 6)
# 5: abort triggered
# Normal conditions below
# 6: Teleport triggered ( 6 ? dist <= server limit : 4 )
# 7: Modified x
# 8: Modified y
# 9: Modified z
# 10: Menu called
scoreboard players set #condition tpa.variables 0
execute if score #tp_spec tpa.config matches 0 if entity @s[gamemode=spectator] run scoreboard players set #condition tpa.variables 1
execute if score #tp_pos tpa.config matches 0 run scoreboard players set #condition tpa.variables 2
execute if score #tp_pos_cooldown tpa.config matches -1 run scoreboard players set #condition tpa.variables 2
execute if score @s tpa.pos_cd matches 1.. run scoreboard players set #condition tpa.variables 3
execute if score @s tpa.pos matches -1 run scoreboard players set #condition tpa.variables 5

execute if score @s tpa.pos matches 1 if score #condition tpa.variables matches 0 run scoreboard players set #condition tpa.variables 10
execute if score @s tpa.pos matches -2 if score #condition tpa.variables matches 0 run scoreboard players set #condition tpa.variables 6
execute if score @s tpa.pos matches 2.. unless score @s tpa.pos.x = @s tpa.pos.x_temp run scoreboard players set #condition tpa.variables 7
execute if score @s tpa.pos matches 2.. unless score @s tpa.pos.y = @s tpa.pos.y_temp run scoreboard players set #condition tpa.variables 8
execute if score @s tpa.pos matches 2.. unless score @s tpa.pos.z = @s tpa.pos.z_temp run scoreboard players set #condition tpa.variables 9

# Outputs
execute if score #condition tpa.variables matches 1..3 run function tpa:sounds/no
execute if score #condition tpa.variables matches 5 run function tpa:sounds/click
execute if score #condition tpa.variables matches 1 run tellraw @s[predicate=tpa:output/show_chatbar] [{storage:"tpa:tpa", nbt:"loaded_lang.header"}, {storage:"tpa:tpa", nbt:"loaded_lang.tp_pos_spec"}, ". "]
execute if score #condition tpa.variables matches 1 run title @s[predicate=tpa:output/show_actionbar] actionbar [{storage:"tpa:tpa", nbt:"loaded_lang.tp_pos_spec", color:"red"}]
execute if score #condition tpa.variables matches 2 run tellraw @s[predicate=tpa:output/show_chatbar] [{storage:"tpa:tpa", nbt:"loaded_lang.header"}, {storage:"tpa:tpa", nbt:"loaded_lang.tp_pos_disabled"}, ". "]
execute if score #condition tpa.variables matches 2 run title @s[predicate=tpa:output/show_actionbar] actionbar [{storage:"tpa:tpa", nbt:"loaded_lang.tp_pos_disabled", color:"red"}]
execute if score #condition tpa.variables matches 3 run tellraw @s[predicate=tpa:output/show_chatbar] [{storage:"tpa:tpa", nbt:"loaded_lang.header"}, {storage:"tpa:tpa", nbt:"loaded_lang.tp_pos_cooldown"}, ". "]
execute if score #condition tpa.variables matches 3 run title @s[predicate=tpa:output/show_actionbar] actionbar [{storage:"tpa:tpa", nbt:"loaded_lang.tp_pos_cooldown", color:"red"}]
execute if score #condition tpa.variables matches 5 run tellraw @s[predicate=tpa:output/show_chatbar] [{storage:"tpa:tpa", nbt:"loaded_lang.header"}, {storage:"tpa:tpa", nbt:"loaded_lang.tp_pos_abort"}, " ", {storage: "tpa:tpa", nbt: "loaded_lang.tp_pos_recall", click_event:{action:"run_command",command: "/trigger tpa.pos"}, hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.tp_pos_recall_hoverevent"}}}]
execute if score #condition tpa.variables matches 5 run title @s[predicate=tpa:output/show_actionbar] actionbar [{storage:"tpa:tpa", nbt:"loaded_lang.tp_pos_abort", color: "red"}]

execute if score #condition tpa.variables matches 10 run function tpa:tp_pos/main
execute if score #condition tpa.variables matches 6 run function tpa:tp_pos/detect
execute if score #condition tpa.variables matches 7..9 run function tpa:tp_pos/modify

execute if score #condition tpa.variables matches 1..6 run function tpa:tp_pos/abort
