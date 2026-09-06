# Parent function: tpa:tick
scoreboard players reset * tpa.is_online
scoreboard players set @a tpa.is_online 1
scoreboard players operation #total_players tpa.variables = #current_players tpa.variables