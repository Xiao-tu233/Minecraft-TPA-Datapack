# Parent function: tpa:tick

# Usage: /trigger tpa.tpaccept_toggle add 4
execute if score @s tpa.tpaccept_toggle matches 4 run scoreboard players set @s tpa.tpaccept_toggle 3
execute if score @s tpa.tpaccept_toggle matches 5 run scoreboard players set @s tpa.tpaccept_toggle 2

execute if score @s tpaccept matches 2 run scoreboard players set @s tpa.tpaccept_toggle 3
execute if score @s tpaccept matches 3 run scoreboard players set @s tpa.tpaccept_toggle 2
function tpa:load_lang
function tpa:sounds/click
tellraw @s[predicate=tpa:output/show_chatbar, scores={tpa.tpaccept_toggle=2}] [{interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.header"}, {interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.recver_accept_toggle_off"}]
title @s[predicate=tpa:output/show_actionbar, scores={tpa.tpaccept_toggle=2}] actionbar [{interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.recver_accept_toggle_off", color: "gold"}]
tellraw @s[predicate=tpa:output/show_chatbar, scores={tpa.tpaccept_toggle=3}] [{interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.header"}, {interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.recver_accept_toggle_on"}]
title @s[predicate=tpa:output/show_actionbar, scores={tpa.tpaccept_toggle=3}] actionbar [{interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.recver_accept_toggle_on", color: "gold"}]
scoreboard players remove @s tpa.tpaccept_toggle 2
scoreboard players set @s tpaccept 0
