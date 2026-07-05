# Parent function: tpa:cancel_req/multiple_found

data remove storage tpa:tpa temp.output
execute store result score #selector.page tpa.variables run data get storage tpa:tpa temp.matched_selector.page
execute store result storage tpa:tpa temp.output.current_page int 1 run scoreboard players get #selector.page tpa.variables
scoreboard players remove #selector.page tpa.variables 1
execute store result storage tpa:tpa temp.output.previous_page int 1 run scoreboard players get #selector.page tpa.variables
scoreboard players add #selector.page tpa.variables 2
execute store result storage tpa:tpa temp.output.next_page int 1 run scoreboard players get #selector.page tpa.variables

execute store result score #selector.total_requests tpa.variables run data get storage tpa:tpa temp.matched_selector.requests
execute store result storage tpa:tpa temp.output.total_requests int 1 run scoreboard players get #selector.total_requests tpa.variables
data modify storage tpa:tpa temp.output.total_requests set string storage tpa:tpa temp.output.total_requests
scoreboard players operation #selector.total_pages tpa.variables = #selector.total_requests tpa.variables
scoreboard players operation #selector.total_pages tpa.variables /= #5 tpa.variables
scoreboard players add #selector.total_pages tpa.variables 1
execute store result storage tpa:tpa temp.output.total_pages int 1 run scoreboard players get #selector.total_pages tpa.variables

# start = page*5 - 4
execute store result score #selector.page tpa.variables run data get storage tpa:tpa temp.matched_selector.page
scoreboard players operation #selector.start_index tpa.variables = #selector.page tpa.variables
scoreboard players operation #selector.start_index tpa.variables *= #5 tpa.variables
scoreboard players remove #selector.start_index tpa.variables 4
execute store result storage tpa:tpa temp.output.start_index int 1 run scoreboard players get #selector.start_index tpa.variables

# end = page*5
scoreboard players operation #selector.end_index tpa.variables = #selector.page tpa.variables
scoreboard players operation #selector.end_index tpa.variables *= #5 tpa.variables
execute store result storage tpa:tpa temp.output.end_index int 1 run scoreboard players get #selector.end_index tpa.variables

# Index starts with 1 due to which will be displayed to normal user.
scoreboard players set #selector.index tpa.variables 1
data modify storage tpa:tpa temp.output.requests set from storage tpa:tpa temp.matched_selector.requests
data modify storage tpa:tpa temp.output.teleporters set value []
data modify storage tpa:tpa temp.output.destinations set value []
execute if data storage tpa:tpa temp.matched_selector.requests[0] run function tpa:cancel_req/selector/request/loop

function tpa:output/selector

# 你目前有多个传送请求 请选择你想要取消的请求:
# ──────────── Requests (2/4) ────────────
# Showing 6–10 of 17 requests

#  Alice   ▶ You         [Cancel]
#  You     ▶ Bob         [Cancel]
#  Charlie ▶ You         [Cancel]
#  You     ▶ David       [Cancel]
#  Eve     ▶ You         [Cancel]

# [◀ Previous]                [Next ▶]