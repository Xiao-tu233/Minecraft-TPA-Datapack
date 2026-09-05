# Parent Function: tpa:tpa, tpa:back/found, tpa:tpaccept, tpa:tp_pos/act, tpa:home, tpa:warp/act

data remove storage tpa:tpa temp.back_result 
scoreboard players set #back.store_result tpa.variables 0
scoreboard players set #back.remove_current tpa.variables 1
scoreboard players set #back.replace_current tpa.variables 0
scoreboard players operation #uid tpa.variables = @s tpa.uid
function tpa:back/scan