
execute as @s[scores={tpa.req_timer=0}] run function tpa:time_out
execute if score @s tpa.req_timer <= #ticks_skipped tpa.variables \
    run scoreboard players set @s tpa.req_timer 0
# else:
# execute if score @s tpa.req_timer > #ticks_skipped tpa.variables run
    scoreboard players operation @s tpa.req_timer -= #ticks_skipped tpa.variables