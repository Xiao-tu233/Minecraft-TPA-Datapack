scoreboard objectives remove tpa.is_online
scoreboard objectives add tpa.is_online dummy
scoreboard players set @a tpa.is_online 1

function tpa:remove_invalid_requests

execute unless score #remove_offline tpa.config matches 0 run function tpa:remove_offline_
