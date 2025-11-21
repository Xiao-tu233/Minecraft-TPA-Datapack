scoreboard players set @s tpa.tp_to 0
scoreboard players set @s tpa.tp_here 0
scoreboard players set @s tpa.req_timer 0

function tpa:load_lang
function tpa:sounds/no
tellraw @s[scores={tpa.output=1..2}] [{storage:"tpa:tpa", nbt:"temp.lang.header"}, {storage:"tpa:tpa", nbt:"temp.lang.reqer_recver_invalid"}, ". "]
title @s[scores={tpa.output=0..1}] actionbar {storage:"tpa:tpa", nbt:"temp.lang.reqer_recver_invalid", color: "red"}