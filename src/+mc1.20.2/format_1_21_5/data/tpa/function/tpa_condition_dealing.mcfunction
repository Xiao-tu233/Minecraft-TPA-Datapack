scoreboard players set #condition tpa.variables 0
execute store result score #condition tpa.variables run function tpa:tpa_conditions
execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug§r: Condition dealt: ", {score: {name: "#condition", objective: "tpa.variables"}}]
# conditions:
# 0: no condition met
# 1: requester is spec
# 2: tp was disabled
# 3: target is requester himself
# 4: request has been sent before
# 5: request sent before was not the same as the current one
execute if score #condition tpa.variables matches 1..4 run function tpa:sounds/no
execute if score #condition tpa.variables matches 1 \
    run tellraw @s[predicate=tpa:output/show_chatbar] [{storage:"tpa:tpa", nbt:"loaded_lang.header"}, {storage:"tpa:tpa", nbt:"loaded_lang.reqer_spec"}, ". "]
execute if score #condition tpa.variables matches 1 \
    run title @s[predicate=tpa:output/show_actionbar] actionbar [{storage:"tpa:tpa", nbt:"loaded_lang.reqer_spec", color:"red"}]
execute if score #condition tpa.variables matches 2 \
    run tellraw @s[predicate=tpa:output/show_chatbar] [{storage:"tpa:tpa", nbt:"loaded_lang.header"}, {storage:"tpa:tpa", nbt:"loaded_lang.reqer_disabled"}, ". "]
execute if score #condition tpa.variables matches 2 \
    run title @s[predicate=tpa:output/show_actionbar] actionbar [{storage:"tpa:tpa", nbt:"loaded_lang.reqer_disabled", color:"red"}]
execute if score #condition tpa.variables matches 3 \
    run tellraw @s[predicate=tpa:output/show_chatbar] [{storage:"tpa:tpa", nbt:"loaded_lang.header"}, {storage:"tpa:tpa", nbt:"loaded_lang.reqer_self"}, ". "]
execute if score #condition tpa.variables matches 3 \
    run title @s[predicate=tpa:output/show_actionbar] actionbar [{storage:"tpa:tpa", nbt:"loaded_lang.reqer_self", color:"red"}]
execute if score #condition tpa.variables matches 4 \
    run tellraw @s[predicate=tpa:output/show_chatbar] [{storage:"tpa:tpa", nbt:"loaded_lang.header"}, {storage:"tpa:tpa", nbt:"loaded_lang.reqer_spam"}, ". "]
execute if score #condition tpa.variables matches 4 \
    run title @s[predicate=tpa:output/show_actionbar] actionbar [{storage:"tpa:tpa", nbt:"loaded_lang.reqer_spam", color:"red"}]
