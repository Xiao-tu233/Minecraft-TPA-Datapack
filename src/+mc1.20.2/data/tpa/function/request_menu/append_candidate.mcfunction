# Parent function: tpa:request_menu/open

function tpa:get_name
data modify storage tpa:tpa temp.request_menu.players append value {uid: 0, name: ""}
execute store result storage tpa:tpa temp.request_menu.players[-1].uid int 1 run scoreboard players get @s tpa.uid
data modify storage tpa:tpa temp.request_menu.players[-1].name set from storage tpa:tpa temp.name
