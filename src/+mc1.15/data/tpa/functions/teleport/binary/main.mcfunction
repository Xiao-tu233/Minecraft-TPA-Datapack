# Parent function: tpa:teleport/main

# """
# Binary Teleport is an alternative teleportation method that moves players by
# splitting the target coordinates into binary values.

# For example, in a single-axis system:
# If the target X coordinate is 68, its binary representation is 0b0100_0100.
# Each bit is checked in order; when a bit is 1, a teleport is performed for
# that step, otherwise it is skipped. By doing this for all bits, the player
# eventually reaches the target position.

# This approach addresses a key problem in Minecraft teleportation: chunk loading.
# Teleport anchors located in unloaded chunks cannot function correctly, which is
# why traditional methods repeatedly teleport players to force chunks to load.

# With Binary Teleport, the process changes. The X and Z coordinates are handled
# simultaneously through binary stepping, reducing the need for intermediate
# anchors. An anchor is only spawned at the final destination, where the last
# teleport step is performed.
# """


# Initialize dimension
execute if score #dim_num tpa.variables matches 0 in minecraft:overworld run tp @s 0 336 0
execute if score #dim_num tpa.variables matches -1 in minecraft:the_nether run tp @s 0 336 0
execute if score #dim_num tpa.variables matches 1 in minecraft:the_end run tp @s 0 336 0

# Binary Teleports
execute store result score #x_dist tpa.variables run data get storage tpa:tpa temp.teleport.Pos[0]
execute store result score #z_dist tpa.variables run data get storage tpa:tpa temp.teleport.Pos[2]


# Debugs
execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §aServer enabled Binary Teleport, §rteleporting ", {"selector":"@p[tag=tpa.teleport]"}, " to ", {"score":{"objective":"tpa.variables","name":"#x_dist"}}, " ~ ", {"score":{"objective":"tpa.variables","name":"#z_dist"}}, "'s at most 8 blocks away"]

# 16,777,216 = 2^24
# X: Positive
execute if score #x_dist tpa.variables matches 16777216.. run tp @s ~16777216 ~ ~
execute if score #x_dist tpa.variables matches 16777216.. run scoreboard players remove #x_dist tpa.variables 16777216
execute if score #x_dist tpa.variables matches 8388608.. run tp @s ~8388608 ~ ~
execute if score #x_dist tpa.variables matches 8388608.. run scoreboard players remove #x_dist tpa.variables 8388608
execute if score #x_dist tpa.variables matches 4194304.. run tp @s ~4194304 ~ ~
execute if score #x_dist tpa.variables matches 4194304.. run scoreboard players remove #x_dist tpa.variables 4194304
execute if score #x_dist tpa.variables matches 2097152.. run tp @s ~2097152 ~ ~
execute if score #x_dist tpa.variables matches 2097152.. run scoreboard players remove #x_dist tpa.variables 2097152
execute if score #x_dist tpa.variables matches 1048576.. run tp @s ~1048576 ~ ~
execute if score #x_dist tpa.variables matches 1048576.. run scoreboard players remove #x_dist tpa.variables 1048576
execute if score #x_dist tpa.variables matches 524288.. run tp @s ~524288 ~ ~
execute if score #x_dist tpa.variables matches 524288.. run scoreboard players remove #x_dist tpa.variables 524288
execute if score #x_dist tpa.variables matches 262144.. run tp @s ~262144 ~ ~
execute if score #x_dist tpa.variables matches 262144.. run scoreboard players remove #x_dist tpa.variables 262144
execute if score #x_dist tpa.variables matches 131072.. run tp @s ~131072 ~ ~
execute if score #x_dist tpa.variables matches 131072.. run scoreboard players remove #x_dist tpa.variables 131072
execute if score #x_dist tpa.variables matches 65536.. run tp @s ~65536 ~ ~
execute if score #x_dist tpa.variables matches 65536.. run scoreboard players remove #x_dist tpa.variables 65536
execute if score #x_dist tpa.variables matches 32768.. run tp @s ~32768 ~ ~
execute if score #x_dist tpa.variables matches 32768.. run scoreboard players remove #x_dist tpa.variables 32768
execute if score #x_dist tpa.variables matches 16384.. run tp @s ~16384 ~ ~
execute if score #x_dist tpa.variables matches 16384.. run scoreboard players remove #x_dist tpa.variables 16384
execute if score #x_dist tpa.variables matches 8192.. run tp @s ~8192 ~ ~
execute if score #x_dist tpa.variables matches 8192.. run scoreboard players remove #x_dist tpa.variables 8192
execute if score #x_dist tpa.variables matches 4096.. run tp @s ~4096 ~ ~
execute if score #x_dist tpa.variables matches 4096.. run scoreboard players remove #x_dist tpa.variables 4096
execute if score #x_dist tpa.variables matches 2048.. run tp @s ~2048 ~ ~
execute if score #x_dist tpa.variables matches 2048.. run scoreboard players remove #x_dist tpa.variables 2048
execute if score #x_dist tpa.variables matches 1024.. run tp @s ~1024 ~ ~
execute if score #x_dist tpa.variables matches 1024.. run scoreboard players remove #x_dist tpa.variables 1024
execute if score #x_dist tpa.variables matches 512.. run tp @s ~512 ~ ~
execute if score #x_dist tpa.variables matches 512.. run scoreboard players remove #x_dist tpa.variables 512
execute if score #x_dist tpa.variables matches 256.. run tp @s ~256 ~ ~
execute if score #x_dist tpa.variables matches 256.. run scoreboard players remove #x_dist tpa.variables 256
execute if score #x_dist tpa.variables matches 128.. run tp @s ~128 ~ ~
execute if score #x_dist tpa.variables matches 128.. run scoreboard players remove #x_dist tpa.variables 128
execute if score #x_dist tpa.variables matches 64.. run tp @s ~64 ~ ~
execute if score #x_dist tpa.variables matches 64.. run scoreboard players remove #x_dist tpa.variables 64
execute if score #x_dist tpa.variables matches 32.. run tp @s ~32 ~ ~
execute if score #x_dist tpa.variables matches 32.. run scoreboard players remove #x_dist tpa.variables 32
execute if score #x_dist tpa.variables matches 16.. run tp @s ~16 ~ ~
execute if score #x_dist tpa.variables matches 16.. run scoreboard players remove #x_dist tpa.variables 16
execute if score #x_dist tpa.variables matches 8.. run tp @s ~8 ~ ~
execute if score #x_dist tpa.variables matches 8.. run scoreboard players remove #x_dist tpa.variables 8
# Stops here because 8 block is even shorter than a chunk's length, we use anchor teleport for the last step, same for Z and negatives

# X: Negative
execute if score #x_dist tpa.variables matches ..-16777216 run tp @s ~-16777216 ~ ~
execute if score #x_dist tpa.variables matches ..-16777216 run scoreboard players add #x_dist tpa.variables 16777216
execute if score #x_dist tpa.variables matches ..-8388608 run tp @s ~-8388608 ~ ~
execute if score #x_dist tpa.variables matches ..-8388608 run scoreboard players add #x_dist tpa.variables 8388608
execute if score #x_dist tpa.variables matches ..-4194304 run tp @s ~-4194304 ~ ~
execute if score #x_dist tpa.variables matches ..-4194304 run scoreboard players add #x_dist tpa.variables 4194304
execute if score #x_dist tpa.variables matches ..-2097152 run tp @s ~-2097152 ~ ~
execute if score #x_dist tpa.variables matches ..-2097152 run scoreboard players add #x_dist tpa.variables 2097152
execute if score #x_dist tpa.variables matches ..-1048576 run tp @s ~-1048576 ~ ~
execute if score #x_dist tpa.variables matches ..-1048576 run scoreboard players add #x_dist tpa.variables 1048576
execute if score #x_dist tpa.variables matches ..-524288 run tp @s ~-524288 ~ ~
execute if score #x_dist tpa.variables matches ..-524288 run scoreboard players add #x_dist tpa.variables 524288
execute if score #x_dist tpa.variables matches ..-262144 run tp @s ~-262144 ~ ~
execute if score #x_dist tpa.variables matches ..-262144 run scoreboard players add #x_dist tpa.variables 262144
execute if score #x_dist tpa.variables matches ..-131072 run tp @s ~-131072 ~ ~
execute if score #x_dist tpa.variables matches ..-131072 run scoreboard players add #x_dist tpa.variables 131072
execute if score #x_dist tpa.variables matches ..-65536 run tp @s ~-65536 ~ ~
execute if score #x_dist tpa.variables matches ..-65536 run scoreboard players add #x_dist tpa.variables 65536
execute if score #x_dist tpa.variables matches ..-32768 run tp @s ~-32768 ~ ~
execute if score #x_dist tpa.variables matches ..-32768 run scoreboard players add #x_dist tpa.variables 32768
execute if score #x_dist tpa.variables matches ..-16384 run tp @s ~-16384 ~ ~
execute if score #x_dist tpa.variables matches ..-16384 run scoreboard players add #x_dist tpa.variables 16384
execute if score #x_dist tpa.variables matches ..-8192 run tp @s ~-8192 ~ ~
execute if score #x_dist tpa.variables matches ..-8192 run scoreboard players add #x_dist tpa.variables 8192
execute if score #x_dist tpa.variables matches ..-4096 run tp @s ~-4096 ~ ~
execute if score #x_dist tpa.variables matches ..-4096 run scoreboard players add #x_dist tpa.variables 4096
execute if score #x_dist tpa.variables matches ..-2048 run tp @s ~-2048 ~ ~
execute if score #x_dist tpa.variables matches ..-2048 run scoreboard players add #x_dist tpa.variables 2048
execute if score #x_dist tpa.variables matches ..-1024 run tp @s ~-1024 ~ ~
execute if score #x_dist tpa.variables matches ..-1024 run scoreboard players add #x_dist tpa.variables 1024
execute if score #x_dist tpa.variables matches ..-512 run tp @s ~-512 ~ ~
execute if score #x_dist tpa.variables matches ..-512 run scoreboard players add #x_dist tpa.variables 512
execute if score #x_dist tpa.variables matches ..-256 run tp @s ~-256 ~ ~
execute if score #x_dist tpa.variables matches ..-256 run scoreboard players add #x_dist tpa.variables 256
execute if score #x_dist tpa.variables matches ..-128 run tp @s ~-128 ~ ~
execute if score #x_dist tpa.variables matches ..-128 run scoreboard players add #x_dist tpa.variables 128
execute if score #x_dist tpa.variables matches ..-64 run tp @s ~-64 ~ ~
execute if score #x_dist tpa.variables matches ..-64 run scoreboard players add #x_dist tpa.variables 64
execute if score #x_dist tpa.variables matches ..-32 run tp @s ~-32 ~ ~
execute if score #x_dist tpa.variables matches ..-32 run scoreboard players add #x_dist tpa.variables 32
execute if score #x_dist tpa.variables matches ..-16 run tp @s ~-16 ~ ~
execute if score #x_dist tpa.variables matches ..-16 run scoreboard players add #x_dist tpa.variables 16
execute if score #x_dist tpa.variables matches ..-8 run tp @s ~-8 ~ ~
execute if score #x_dist tpa.variables matches ..-8 run scoreboard players add #x_dist tpa.variables 8

# Teleport Z axis
# Z: Positive
execute if score #z_dist tpa.variables matches 16777216.. run tp @s ~ ~ ~16777216
execute if score #z_dist tpa.variables matches 16777216.. run scoreboard players remove #z_dist tpa.variables 16777216
execute if score #z_dist tpa.variables matches 8388608.. run tp @s ~ ~ ~8388608
execute if score #z_dist tpa.variables matches 8388608.. run scoreboard players remove #z_dist tpa.variables 8388608
execute if score #z_dist tpa.variables matches 4194304.. run tp @s ~ ~ ~4194304
execute if score #z_dist tpa.variables matches 4194304.. run scoreboard players remove #z_dist tpa.variables 4194304
execute if score #z_dist tpa.variables matches 2097152.. run tp @s ~ ~ ~2097152
execute if score #z_dist tpa.variables matches 2097152.. run scoreboard players remove #z_dist tpa.variables 2097152
execute if score #z_dist tpa.variables matches 1048576.. run tp @s ~ ~ ~1048576
execute if score #z_dist tpa.variables matches 1048576.. run scoreboard players remove #z_dist tpa.variables 1048576
execute if score #z_dist tpa.variables matches 524288.. run tp @s ~ ~ ~524288
execute if score #z_dist tpa.variables matches 524288.. run scoreboard players remove #z_dist tpa.variables 524288
execute if score #z_dist tpa.variables matches 262144.. run tp @s ~ ~ ~262144
execute if score #z_dist tpa.variables matches 262144.. run scoreboard players remove #z_dist tpa.variables 262144
execute if score #z_dist tpa.variables matches 131072.. run tp @s ~ ~ ~131072
execute if score #z_dist tpa.variables matches 131072.. run scoreboard players remove #z_dist tpa.variables 131072
execute if score #z_dist tpa.variables matches 65536.. run tp @s ~ ~ ~65536
execute if score #z_dist tpa.variables matches 65536.. run scoreboard players remove #z_dist tpa.variables 65536
execute if score #z_dist tpa.variables matches 32768.. run tp @s ~ ~ ~32768
execute if score #z_dist tpa.variables matches 32768.. run scoreboard players remove #z_dist tpa.variables 32768
execute if score #z_dist tpa.variables matches 16384.. run tp @s ~ ~ ~16384
execute if score #z_dist tpa.variables matches 16384.. run scoreboard players remove #z_dist tpa.variables 16384
execute if score #z_dist tpa.variables matches 8192.. run tp @s ~ ~ ~8192
execute if score #z_dist tpa.variables matches 8192.. run scoreboard players remove #z_dist tpa.variables 8192
execute if score #z_dist tpa.variables matches 4096.. run tp @s ~ ~ ~4096
execute if score #z_dist tpa.variables matches 4096.. run scoreboard players remove #z_dist tpa.variables 4096
execute if score #z_dist tpa.variables matches 2048.. run tp @s ~ ~ ~2048
execute if score #z_dist tpa.variables matches 2048.. run scoreboard players remove #z_dist tpa.variables 2048
execute if score #z_dist tpa.variables matches 1024.. run tp @s ~ ~ ~1024
execute if score #z_dist tpa.variables matches 1024.. run scoreboard players remove #z_dist tpa.variables 1024
execute if score #z_dist tpa.variables matches 512.. run tp @s ~ ~ ~512
execute if score #z_dist tpa.variables matches 512.. run scoreboard players remove #z_dist tpa.variables 512
execute if score #z_dist tpa.variables matches 256.. run tp @s ~ ~ ~256
execute if score #z_dist tpa.variables matches 256.. run scoreboard players remove #z_dist tpa.variables 256
execute if score #z_dist tpa.variables matches 128.. run tp @s ~ ~ ~128
execute if score #z_dist tpa.variables matches 128.. run scoreboard players remove #z_dist tpa.variables 128
execute if score #z_dist tpa.variables matches 64.. run tp @s ~ ~ ~64
execute if score #z_dist tpa.variables matches 64.. run scoreboard players remove #z_dist tpa.variables 64
execute if score #z_dist tpa.variables matches 32.. run tp @s ~ ~ ~32
execute if score #z_dist tpa.variables matches 32.. run scoreboard players remove #z_dist tpa.variables 32
execute if score #z_dist tpa.variables matches 16.. run tp @s ~ ~ ~16
execute if score #z_dist tpa.variables matches 16.. run scoreboard players remove #z_dist tpa.variables 16
execute if score #z_dist tpa.variables matches 8.. run tp @s ~ ~ ~8
execute if score #z_dist tpa.variables matches 8.. run scoreboard players remove #z_dist tpa.variables 8

# Z: Negative
execute if score #z_dist tpa.variables matches ..-16777216 run tp @s ~ ~ ~-16777216
execute if score #z_dist tpa.variables matches ..-16777216 run scoreboard players add #z_dist tpa.variables 16777216
execute if score #z_dist tpa.variables matches ..-8388608 run tp @s ~ ~ ~-8388608
execute if score #z_dist tpa.variables matches ..-8388608 run scoreboard players add #z_dist tpa.variables 8388608
execute if score #z_dist tpa.variables matches ..-4194304 run tp @s ~ ~ ~-4194304
execute if score #z_dist tpa.variables matches ..-4194304 run scoreboard players add #z_dist tpa.variables 4194304
execute if score #z_dist tpa.variables matches ..-2097152 run tp @s ~ ~ ~-2097152
execute if score #z_dist tpa.variables matches ..-2097152 run scoreboard players add #z_dist tpa.variables 2097152
execute if score #z_dist tpa.variables matches ..-1048576 run tp @s ~ ~ ~-1048576
execute if score #z_dist tpa.variables matches ..-1048576 run scoreboard players add #z_dist tpa.variables 1048576
execute if score #z_dist tpa.variables matches ..-524288 run tp @s ~ ~ ~-524288
execute if score #z_dist tpa.variables matches ..-524288 run scoreboard players add #z_dist tpa.variables 524288
execute if score #z_dist tpa.variables matches ..-262144 run tp @s ~ ~ ~-262144
execute if score #z_dist tpa.variables matches ..-262144 run scoreboard players add #z_dist tpa.variables 262144
execute if score #z_dist tpa.variables matches ..-131072 run tp @s ~ ~ ~-131072
execute if score #z_dist tpa.variables matches ..-131072 run scoreboard players add #z_dist tpa.variables 131072
execute if score #z_dist tpa.variables matches ..-65536 run tp @s ~ ~ ~-65536
execute if score #z_dist tpa.variables matches ..-65536 run scoreboard players add #z_dist tpa.variables 65536
execute if score #z_dist tpa.variables matches ..-32768 run tp @s ~ ~ ~-32768
execute if score #z_dist tpa.variables matches ..-32768 run scoreboard players add #z_dist tpa.variables 32768
execute if score #z_dist tpa.variables matches ..-16384 run tp @s ~ ~ ~-16384
execute if score #z_dist tpa.variables matches ..-16384 run scoreboard players add #z_dist tpa.variables 16384
execute if score #z_dist tpa.variables matches ..-8192 run tp @s ~ ~ ~-8192
execute if score #z_dist tpa.variables matches ..-8192 run scoreboard players add #z_dist tpa.variables 8192
execute if score #z_dist tpa.variables matches ..-4096 run tp @s ~ ~ ~-4096
execute if score #z_dist tpa.variables matches ..-4096 run scoreboard players add #z_dist tpa.variables 4096
execute if score #z_dist tpa.variables matches ..-2048 run tp @s ~ ~ ~-2048
execute if score #z_dist tpa.variables matches ..-2048 run scoreboard players add #z_dist tpa.variables 2048
execute if score #z_dist tpa.variables matches ..-1024 run tp @s ~ ~ ~-1024
execute if score #z_dist tpa.variables matches ..-1024 run scoreboard players add #z_dist tpa.variables 1024
execute if score #z_dist tpa.variables matches ..-512 run tp @s ~ ~ ~-512
execute if score #z_dist tpa.variables matches ..-512 run scoreboard players add #z_dist tpa.variables 512
execute if score #z_dist tpa.variables matches ..-256 run tp @s ~ ~ ~-256
execute if score #z_dist tpa.variables matches ..-256 run scoreboard players add #z_dist tpa.variables 256
execute if score #z_dist tpa.variables matches ..-128 run tp @s ~ ~ ~-128
execute if score #z_dist tpa.variables matches ..-128 run scoreboard players add #z_dist tpa.variables 128
execute if score #z_dist tpa.variables matches ..-64 run tp @s ~ ~ ~-64
execute if score #z_dist tpa.variables matches ..-64 run scoreboard players add #z_dist tpa.variables 64
execute if score #z_dist tpa.variables matches ..-32 run tp @s ~ ~ ~-32
execute if score #z_dist tpa.variables matches ..-32 run scoreboard players add #z_dist tpa.variables 32
execute if score #z_dist tpa.variables matches ..-16 run tp @s ~ ~ ~-16
execute if score #z_dist tpa.variables matches ..-16 run scoreboard players add #z_dist tpa.variables 16
execute if score #z_dist tpa.variables matches ..-8 run tp @s ~ ~ ~-8
execute if score #z_dist tpa.variables matches ..-8 run scoreboard players add #z_dist tpa.variables 8