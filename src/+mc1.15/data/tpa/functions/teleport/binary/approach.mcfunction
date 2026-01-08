# Parent function: tpa:telepot/next_node (teleport_state == 3)

# Binary Teleports
execute store result score #x tpa.variables run data get entity @s Pos[0]
execute store result score #x_dist tpa.variables run data get storage tpa:tpa temp.teleport.Pos[0]
scoreboard players operation #x_dist tpa.variables -= #x tpa.variables
execute store result score #z tpa.variables run data get entity @s Pos[2]
execute store result score #z_dist tpa.variables run data get storage tpa:tpa temp.teleport.Pos[2]
scoreboard players operation #z_dist tpa.variables -= #z tpa.variables


# 16,777,216 = 2^24
# X: Positive
execute if score #x_dist tpa.variables matches 16777216.. run tp @s ~16777216 ~ ~
execute if score #x_dist tpa.variables matches 8388608.. run tp @s ~8388608 ~ ~
execute if score #x_dist tpa.variables matches 4194304.. run tp @s ~4194304 ~ ~
execute if score #x_dist tpa.variables matches 2097152.. run tp @s ~2097152 ~ ~
execute if score #x_dist tpa.variables matches 1048576.. run tp @s ~1048576 ~ ~
execute if score #x_dist tpa.variables matches 524288.. run tp @s ~524288 ~ ~
execute if score #x_dist tpa.variables matches 262144.. run tp @s ~262144 ~ ~
execute if score #x_dist tpa.variables matches 131072.. run tp @s ~131072 ~ ~
execute if score #x_dist tpa.variables matches 65536.. run tp @s ~65536 ~ ~
execute if score #x_dist tpa.variables matches 32768.. run tp @s ~32768 ~ ~
execute if score #x_dist tpa.variables matches 16384.. run tp @s ~16384 ~ ~
execute if score #x_dist tpa.variables matches 8192.. run tp @s ~8192 ~ ~
execute if score #x_dist tpa.variables matches 4096.. run tp @s ~4096 ~ ~
execute if score #x_dist tpa.variables matches 2048.. run tp @s ~2048 ~ ~
execute if score #x_dist tpa.variables matches 1024.. run tp @s ~1024 ~ ~
execute if score #x_dist tpa.variables matches 512.. run tp @s ~512 ~ ~
execute if score #x_dist tpa.variables matches 256.. run tp @s ~256 ~ ~
execute if score #x_dist tpa.variables matches 128.. run tp @s ~128 ~ ~
execute if score #x_dist tpa.variables matches 64.. run tp @s ~64 ~ ~
execute if score #x_dist tpa.variables matches 32.. run tp @s ~32 ~ ~
execute if score #x_dist tpa.variables matches 16.. run tp @s ~16 ~ ~
execute if score #x_dist tpa.variables matches 8.. run tp @s ~8 ~ ~
# Stops here because 8 block is even shorter than a chunk's length, we use anchor teleport for the last step, same for Z and negatives
# X: Negative
execute if score #x_dist tpa.variables matches ..-16777216 run tp @s ~-16777216 ~ ~
execute if score #x_dist tpa.variables matches ..-8388608 run tp @s ~-8388608 ~ ~
execute if score #x_dist tpa.variables matches ..-4194304 run tp @s ~-4194304 ~ ~
execute if score #x_dist tpa.variables matches ..-2097152 run tp @s ~-2097152 ~ ~
execute if score #x_dist tpa.variables matches ..-1048576 run tp @s ~-1048576 ~ ~
execute if score #x_dist tpa.variables matches ..-524288 run tp @s ~-524288 ~ ~
execute if score #x_dist tpa.variables matches ..-262144 run tp @s ~-262144 ~ ~
execute if score #x_dist tpa.variables matches ..-131072 run tp @s ~-131072 ~ ~
execute if score #x_dist tpa.variables matches ..-65536 run tp @s ~-65536 ~ ~
execute if score #x_dist tpa.variables matches ..-32768 run tp @s ~-32768 ~ ~
execute if score #x_dist tpa.variables matches ..-16384 run tp @s ~-16384 ~ ~
execute if score #x_dist tpa.variables matches ..-8192 run tp @s ~-8192 ~ ~
execute if score #x_dist tpa.variables matches ..-4096 run tp @s ~-4096 ~ ~
execute if score #x_dist tpa.variables matches ..-2048 run tp @s ~-2048 ~ ~
execute if score #x_dist tpa.variables matches ..-1024 run tp @s ~-1024 ~ ~
execute if score #x_dist tpa.variables matches ..-512 run tp @s ~-512 ~ ~
execute if score #x_dist tpa.variables matches ..-256 run tp @s ~-256 ~ ~
execute if score #x_dist tpa.variables matches ..-128 run tp @s ~-128 ~ ~
execute if score #x_dist tpa.variables matches ..-64 run tp @s ~-64 ~ ~
execute if score #x_dist tpa.variables matches ..-32 run tp @s ~-32 ~ ~
execute if score #x_dist tpa.variables matches ..-16 run tp @s ~-16 ~ ~
execute if score #x_dist tpa.variables matches ..-8 run tp @s ~-8 ~ ~

# Teleport Z axis
# Z: Positive
execute if score #z_dist tpa.variables matches 16777216.. run tp @s ~ ~ ~16777216
execute if score #z_dist tpa.variables matches 8388608.. run tp @s ~ ~ ~8388608
execute if score #z_dist tpa.variables matches 4194304.. run tp @s ~ ~ ~4194304
execute if score #z_dist tpa.variables matches 2097152.. run tp @s ~ ~ ~2097152
execute if score #z_dist tpa.variables matches 1048576.. run tp @s ~ ~ ~1048576
execute if score #z_dist tpa.variables matches 524288.. run tp @s ~ ~ ~524288
execute if score #z_dist tpa.variables matches 262144.. run tp @s ~ ~ ~262144
execute if score #z_dist tpa.variables matches 131072.. run tp @s ~ ~ ~131072
execute if score #z_dist tpa.variables matches 65536.. run tp @s ~ ~ ~65536
execute if score #z_dist tpa.variables matches 32768.. run tp @s ~ ~ ~32768
execute if score #z_dist tpa.variables matches 16384.. run tp @s ~ ~ ~16384
execute if score #z_dist tpa.variables matches 8192.. run tp @s ~ ~ ~8192
execute if score #z_dist tpa.variables matches 4096.. run tp @s ~ ~ ~4096
execute if score #z_dist tpa.variables matches 2048.. run tp @s ~ ~ ~2048
execute if score #z_dist tpa.variables matches 1024.. run tp @s ~ ~ ~1024
execute if score #z_dist tpa.variables matches 512.. run tp @s ~ ~ ~512
execute if score #z_dist tpa.variables matches 256.. run tp @s ~ ~ ~256
execute if score #z_dist tpa.variables matches 128.. run tp @s ~ ~ ~128
execute if score #z_dist tpa.variables matches 64.. run tp @s ~ ~ ~64
execute if score #z_dist tpa.variables matches 32.. run tp @s ~ ~ ~32
execute if score #z_dist tpa.variables matches 16.. run tp @s ~ ~ ~16
execute if score #z_dist tpa.variables matches 8.. run tp @s ~ ~ ~8

# Z: Negative
execute if score #z_dist tpa.variables matches ..-16777216 run tp @s ~ ~ ~-16777216
execute if score #z_dist tpa.variables matches ..-8388608 run tp @s ~ ~ ~-8388608
execute if score #z_dist tpa.variables matches ..-4194304 run tp @s ~ ~ ~-4194304
execute if score #z_dist tpa.variables matches ..-2097152 run tp @s ~ ~ ~-2097152
execute if score #z_dist tpa.variables matches ..-1048576 run tp @s ~ ~ ~-1048576
execute if score #z_dist tpa.variables matches ..-524288 run tp @s ~ ~ ~-524288
execute if score #z_dist tpa.variables matches ..-262144 run tp @s ~ ~ ~-262144
execute if score #z_dist tpa.variables matches ..-131072 run tp @s ~ ~ ~-131072
execute if score #z_dist tpa.variables matches ..-65536 run tp @s ~ ~ ~-65536
execute if score #z_dist tpa.variables matches ..-32768 run tp @s ~ ~ ~-32768
execute if score #z_dist tpa.variables matches ..-16384 run tp @s ~ ~ ~-16384
execute if score #z_dist tpa.variables matches ..-8192 run tp @s ~ ~ ~-8192
execute if score #z_dist tpa.variables matches ..-4096 run tp @s ~ ~ ~-4096
execute if score #z_dist tpa.variables matches ..-2048 run tp @s ~ ~ ~-2048
execute if score #z_dist tpa.variables matches ..-1024 run tp @s ~ ~ ~-1024
execute if score #z_dist tpa.variables matches ..-512 run tp @s ~ ~ ~-512
execute if score #z_dist tpa.variables matches ..-256 run tp @s ~ ~ ~-256
execute if score #z_dist tpa.variables matches ..-128 run tp @s ~ ~ ~-128
execute if score #z_dist tpa.variables matches ..-64 run tp @s ~ ~ ~-64
execute if score #z_dist tpa.variables matches ..-32 run tp @s ~ ~ ~-32
execute if score #z_dist tpa.variables matches ..-16 run tp @s ~ ~ ~-16
execute if score #z_dist tpa.variables matches ..-8 run tp @s ~ ~ ~-8


scoreboard players set #dist tpa.variables 0
execute if score #x_dist tpa.variables matches 1.. run scoreboard players operation #dist tpa.variables += #x_dist tpa.variables
execute if score #x_dist tpa.variables matches ..0 run scoreboard players operation #dist tpa.variables -= #x_dist tpa.variables
execute if score #z_dist tpa.variables matches 1.. run scoreboard players operation #dist tpa.variables += #z_dist tpa.variables
execute if score #z_dist tpa.variables matches ..0 run scoreboard players operation #dist tpa.variables -= #z_dist tpa.variables

execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug§r: Binary Teleport approached once: ", {"score":{"objective":"tpa.variables","name":"#dist"}, "color": "green"}, "/", {"score":{"objective":"tpa.variables","name":"#original_distance"}}]

execute if entity @e[sort=nearest, limit=1, tag=tpa.teleport_destin_anchor] run scoreboard players set #teleport_state tpa.variables 2