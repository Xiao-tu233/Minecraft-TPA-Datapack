# Parent function: tpa:update/home
execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §rGot legacy home data: ", {storage: "tpa:tpa", nbt: "temp.args.home"}]
data remove storage tpa:tpa temp.args
$data modify storage tpa:tpa temp.args.not_scanned set value '$(home)'