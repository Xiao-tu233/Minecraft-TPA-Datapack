scoreboard players operation #home tpa.variables = @s tpa.sethome
scoreboard players set @s tpa.sethome 0
function tpa:load_lang
function tpa:home/conditions

scoreboard players operation #uid tpa.variables = @s tpa.uid
execute if score #error_code tpa.variables matches 0 run function tpa:home/set
data modify storage tpa:tpa temp.sethome set from storage tpa:tpa temp.home

execute if score #error_code tpa.variables matches 0 run function tpa:home/menu

data modify storage tpa:tpa temp.home set from storage tpa:tpa temp.sethome
execute if score #error_code tpa.variables matches 0 run function tpa:home/set/output