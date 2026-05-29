# Store the current player count
scoreboard players operation #previous_online_count tpa.variables = #current_online_count tpa.variables

# Update online status for everyone
scoreboard objectives remove tpa.is_online
scoreboard objectives add tpa.is_online dummy
scoreboard players set @a tpa.is_online 1
