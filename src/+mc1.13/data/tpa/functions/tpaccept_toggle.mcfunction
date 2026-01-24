# Parent function: tpa:tick

# Usage: /trigger tpa.tpaccept_tgl add 4
execute if score @s tpa.tpaccept_tgl matches 4 run scoreboard players set @s tpa.tpaccept_tgl 3
execute if score @s tpa.tpaccept_tgl matches 5 run scoreboard players set @s tpa.tpaccept_tgl 2

execute if score @s tpaccept matches 2 run scoreboard players set @s tpa.tpaccept_tgl 3
execute if score @s tpaccept matches 3 run scoreboard players set @s tpa.tpaccept_tgl 2
function tpa:load_lang
function tpa:sounds/click
tellraw @s[scores={tpa.output_=1..2, tpa.tpaccept_tgl=2}] ["[§bTPA§r]", {"text": "你关闭了§a自动接受§r"}]
title @s[scores={tpa.output_=0..1, tpa.tpaccept_tgl=2}] actionbar [{"text": "你关闭了§a自动接受§r", "color": "gold"}]
tellraw @s[scores={tpa.output_=1..2, tpa.tpaccept_tgl=3}] ["[§bTPA§r]", {"text": "你开启了§a自动接受§r"}]
title @s[scores={tpa.output_=0..1, tpa.tpaccept_tgl=3}] actionbar [{"text": "你开启了§a自动接受§r", "color": "gold"}]
scoreboard players remove @s tpa.tpaccept_tgl 2
scoreboard players set @s tpaccept 0
