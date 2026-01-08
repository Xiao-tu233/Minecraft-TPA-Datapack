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

# Debugs
execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §aServer enabled Binary Teleport, §rteleporting ", {"selector":"@p[tag=tpa.teleport]"}, " to ", {"score":{"objective":"tpa.variables","name":"#x_dist"}}, " ~ ", {"score":{"objective":"tpa.variables","name":"#z_dist"}}, "'s at most 8 blocks away"]

scoreboard players set #teleport_state tpa.variables 3