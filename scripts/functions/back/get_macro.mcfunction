# Parent Function: tpa:back/get
scoreboard players set #flag tpa.variables 0
$execute if data storage tpa:tpa back.$(id) run scoreboard players set #flag tpa.variables 1
execute unless score #flag tpa.variables matches 1 run return 0
data remove storage tpa:tpa temp.back
$data modify storage tpa:tpa temp.back set from storage tpa:tpa back.$(id)
execute if score #debug_mode tpa.config matches 1 run \
    tellraw @a ["[§bTPA§r] §6 Debug: §rNow showing: §adata storage tpa:tpa temp.back:§r", {storage: "tpa:tpa", nbt: "temp.back"}]