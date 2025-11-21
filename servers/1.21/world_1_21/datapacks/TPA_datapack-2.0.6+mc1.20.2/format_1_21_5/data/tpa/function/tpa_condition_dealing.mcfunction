scoreboard players set #condition tpa.variables 0
execute store result score #condition tpa.variables run function tpa:tpa_conditions
function tpa:debug_breakpoint {info:'"#condition is ", {score:{"objective":"tpa.variables", "name":"#condition"}}'}
# conditions:
# 0: no condition met
# 1: requester is spec
# 2: tp was disabled
# 3: target is requester himself
# 4: request has been sent before
# 5: request sent before was not the same as the current one
execute if score #condition tpa.variables matches 1..4 run function tpa:sounds/no
execute if score #condition tpa.variables matches 1 \
    run tellraw @s[scores={tpa.output=1..2}] [{storage:"tpa:tpa", nbt:"temp.lang.header"}, {storage:"tpa:tpa", nbt:"temp.lang.reqer_spec"}, ". "]
execute if score #condition tpa.variables matches 1 \
    run title @s[scores={tpa.output=0..1}] actionbar [{storage:"tpa:tpa", nbt:"temp.lang.reqer_spec", color:"red"}]
execute if score #condition tpa.variables matches 2 \
    run tellraw @s[scores={tpa.output=1..2}] [{storage:"tpa:tpa", nbt:"temp.lang.header"}, {storage:"tpa:tpa", nbt:"temp.lang.reqer_disabled"}, ". "]
execute if score #condition tpa.variables matches 2 \
    run title @s[scores={tpa.output=0..1}] actionbar [{storage:"tpa:tpa", nbt:"temp.lang.reqer_disabled", color:"red"}]
execute if score #condition tpa.variables matches 3 \
    run tellraw @s[scores={tpa.output=1..2}] [{storage:"tpa:tpa", nbt:"temp.lang.header"}, {storage:"tpa:tpa", nbt:"temp.lang.reqer_self"}, ". "]
execute if score #condition tpa.variables matches 3 \
    run title @s[scores={tpa.output=0..1}] actionbar [{storage:"tpa:tpa", nbt:"temp.lang.reqer_self", color:"red"}]
execute if score #condition tpa.variables matches 4 \
    run tellraw @s[scores={tpa.output=1..2}] [{storage:"tpa:tpa", nbt:"temp.lang.header"}, {storage:"tpa:tpa", nbt:"temp.lang.reqer_spam"}, ". "]
execute if score #condition tpa.variables matches 4 \
    run title @s[scores={tpa.output=0..1}] actionbar [{storage:"tpa:tpa", nbt:"temp.lang.reqer_spam", color:"red"}]
