# Parent function tpa:teleport/main
# @macro: {x: double|int, y: double|int, z: double|int, yaw: float, pitch: float, dimension: string}
$execute in $(dimension) positioned $(x) $(y) $(z) rotated $(yaw) $(pitch) run tp @s ~ ~ ~ ~ ~
execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §aSuccessfully teleported §r", {"selector": "@s"}, " to ", {"entity": "@s", "nbt": "Pos"}, " in ", {"entity": "@s", "nbt": "Dimension"}, " rotated ", {"entity": "@s", "nbt": "Rotation"}]