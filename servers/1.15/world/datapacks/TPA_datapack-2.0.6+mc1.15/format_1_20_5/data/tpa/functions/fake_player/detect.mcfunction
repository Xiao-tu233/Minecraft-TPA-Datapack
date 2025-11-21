# Parent function: tpa:detect_join
# Do not /op this guy!
player __tpa__ spawn at ~ ~2 ~
function tpa:get_id
function tpa:fake_player/tag with storage tpa:tpa temp

execute as @p[tag=__tpa__] run function tpa:get_id
function tpa:fake_player/kill with storage tpa:tpa temp