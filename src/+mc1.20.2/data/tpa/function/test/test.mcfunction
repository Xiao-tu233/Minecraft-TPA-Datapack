execute at Pressnre run summon villager ~ ~ ~ {Tags:[tower],NoGravity:1b}
data modify storage tpa:tpa test.Pos set value []
execute store result storage tpa:tpa test.Pos[0] double 1 run scoreboard players get Pressnre test.x
execute store result storage tpa:tpa test.Pos[1] double 1 run scoreboard players get Pressnre test.y
execute store result storage tpa:tpa test.Pos[2] double 1 run scoreboard players get Pressnre test.z
data modify entity @n[tag=tower] Pos set from storage tpa:tpa test.Pos
tellraw @a ["debug: tower's Pos is ", {entity: "@n[tag=tower]", nbt: "Pos"}]

scoreboard players set Pressnre terrorist 1
say towerdone