scoreboard players set @s tpa.idfix 0
function tpa:load_lang

execute if score #idfix_cooldown tpa.config matches -1 run function tpa:sounds/no
execute if score #idfix_cooldown tpa.config matches -1 run tellraw @s[predicate=tpa:output/show_chatbar] [{storage:"tpa:tpa", nbt:"loaded_lang.header"}, {storage:"tpa:tpa", nbt:"loaded_lang.idfix_disabled"}, ". "]
execute if score #idfix_cooldown tpa.config matches -1 run title @s[predicate=tpa:output/show_actionbar] actionbar [{storage:"tpa:tpa", nbt:"loaded_lang.idfix_disabled", color:"red"}]
execute if score #idfix_cooldown tpa.config matches -1 run return 0

execute if score @s tpa.idfix_cd matches 1.. run function tpa:sounds/no
execute if score @s tpa.idfix_cd matches 1.. run tellraw @s[predicate=tpa:output/show_chatbar] [{storage:"tpa:tpa", nbt:"loaded_lang.header"}, {storage:"tpa:tpa", nbt:"loaded_lang.idfix_cooldown"}, ". "]
execute if score @s tpa.idfix_cd matches 1.. run title @s[predicate=tpa:output/show_actionbar] actionbar [{storage:"tpa:tpa", nbt:"loaded_lang.idfix_cooldown", color:"red"}]
execute if score @s tpa.idfix_cd matches 1.. run return 0

function tpa:sounds/levelup
tellraw @a[predicate=tpa:output/show_chatbar] [{storage:"tpa:tpa", nbt:"loaded_lang.header"}, \
    {storage:"tpa:tpa", nbt:"loaded_lang.idfix_act_left_part"}, \
    {selector: "@s", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.idfix_act_hoverevent"}}}, \
    {storage:"tpa:tpa", nbt:"loaded_lang.idfix_act_right_part"}, ". " \
]
title @a[predicate=tpa:output/show_actionbar] actionbar [\
        {storage:"tpa:tpa", nbt:"loaded_lang.idfix_act_left_part", color: "gold"}, \
        {selector: "@s"},  \
        {storage:"tpa:tpa", nbt:"loaded_lang.idfix_act_right_part", color: "gold"} \
    ]
scoreboard players operation @s tpa.idfix_cd = #idfix_cooldown tpa.config

data remove storage tpa:tpa back
scoreboard objectives remove tpa.player_id
scoreboard objectives add tpa.player_id dummy
scoreboard players set #global_current tpa.player_id 2
execute if score #compact_ids tpa.config matches 0 as @a[predicate=tpa:available] run scoreboard players operation @s tpa.player_id = @s tpa.uid
execute if score #compact_ids tpa.config matches 1 as @a[predicate=tpa:available] run scoreboard players set @s tpa.player_id 1
scoreboard players set @a tpa.tp_to 0
scoreboard players set @a tpa.tp_here 0

