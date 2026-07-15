# Parent function: tpa:request_menu/open

data modify storage tpa:tpa temp.request_menu.players append value {uid: 0}
execute store result storage tpa:tpa temp.request_menu.players[-1].uid int 1 run scoreboard players get @s tpa.uid
