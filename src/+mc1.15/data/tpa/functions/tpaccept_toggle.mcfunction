# Parent function: tpa:tick

# Usage: /trigger tpa.tpaccept_tgl add 4
execute if score @s tpa.tpaccept_tgl matches 4 run scoreboard players set @s tpa.tpaccept_tgl 3
execute if score @s tpa.tpaccept_tgl matches 5 run scoreboard players set @s tpa.tpaccept_tgl 2

execute if score @s tpaccept matches 2 run scoreboard players set @s tpa.tpaccept_tgl 3
execute if score @s tpaccept matches 3 run scoreboard players set @s tpa.tpaccept_tgl 2
function tpa:load_lang
function tpa:sounds/click
tellraw @s[predicate=tpa:output/show_chatbar, scores={tpa.tpaccept_tgl=2}] [{"storage":"tpa:tpa", "nbt":"loaded_lang.header"}, {"storage":"tpa:tpa", "nbt":"loaded_lang.recver_accept_toggle_off"}]
title @s[predicate=tpa:output/show_actionbar, scores={tpa.tpaccept_tgl=2}] actionbar [{"storage":"tpa:tpa", "nbt":"loaded_lang.recver_accept_toggle_off", "color": "gold"}]
tellraw @s[predicate=tpa:output/show_chatbar, scores={tpa.tpaccept_tgl=3}] [{"storage":"tpa:tpa", "nbt":"loaded_lang.header"}, {"storage":"tpa:tpa", "nbt":"loaded_lang.recver_accept_toggle_on"}]
title @s[predicate=tpa:output/show_actionbar, scores={tpa.tpaccept_tgl=3}] actionbar [{"storage":"tpa:tpa", "nbt":"loaded_lang.recver_accept_toggle_on", "color": "gold"}]
scoreboard players remove @s tpa.tpaccept_tgl 2
scoreboard players set @s tpaccept 0
