execute if score @s tpaccept matches 2 run scoreboard players set @s tpa.tpaccept_tgl 3
execute if score @s tpaccept matches 3 run scoreboard players set @s tpa.tpaccept_tgl 2
function tpa:load_lang
function tpa:sounds/click
tellraw @s[scores={tpa.output=1..2, tpa.tpaccept_tgl=2}] [{"storage":"tpa:tpa", "nbt":"temp.lang.header"}, {"storage":"tpa:tpa", "nbt":"temp.lang.recver_accept_toggle_off"}]
title @s[scores={tpa.output=0..1, tpa.tpaccept_tgl=2}] actionbar [{"storage":"tpa:tpa", "nbt":"temp.lang.recver_accept_toggle_off", "color": "gold"}]
tellraw @s[scores={tpa.output=1..2, tpa.tpaccept_tgl=3}] [{"storage":"tpa:tpa", "nbt":"temp.lang.header"}, {"storage":"tpa:tpa", "nbt":"temp.lang.recver_accept_toggle_on"}]
title @s[scores={tpa.output=0..1, tpa.tpaccept_tgl=3}] actionbar [{"storage":"tpa:tpa", "nbt":"temp.lang.recver_accept_toggle_on", "color": "gold"}]
scoreboard players remove @s tpa.tpaccept_tgl 2
scoreboard players set @s tpaccept 0