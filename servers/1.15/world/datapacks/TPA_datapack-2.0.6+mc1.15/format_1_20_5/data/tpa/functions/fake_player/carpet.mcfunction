execute store success score #carpet_installed tpa.variables run carpet
player __tpa__ spawn at 0 -63 0 facing 0 0 in minecraft:overworld in creative
execute positioned 0 -63 0 run tag @p[gamemode=creative] add __tpa__
execute as @a[tag=__tpa__] run function tpa:get_id
function tpa:fake_player/kill with storage tpa:tpa temp