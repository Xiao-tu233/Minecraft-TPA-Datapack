scoreboard players add #sim_dist tpa.config 1
# Use data modify instead of tp cuz the former one could modify position not being loaded
execute as @e[nbt={Item:{tag:{isTeleportAnchor: 1b}}}, limit=1, sort=nearest] at @s run tp @s ~16 ~ ~

# If simulate distance is x, we have the real distance player can reach: (x+1) chunks
# And we also have the game calculations with chunks as the unit, so when we are at (0, 0) at a chunk, 
# we can reach (16x+16+15, 16x+16+15) at Southeast, and (-(16x+16-1), -(16x+16-1)) at Northwest.
# Default Sim Dist is 10, so we can reach (161, 161) at Southeast, and (-175, -175) at Northwest in this example.


execute if entity @e[nbt={Item:{tag:{isTeleportAnchor: 1b}}}] run function tpa:teleport/cal_sim_dist_loop