# Parent function: tpa:cancel_req/multiple_found

data remove storage tpa:tpa temp.output
execute store result score #selector.page tpa.variables run data get storage tpa:tpa temp.matched_selector.page
execute store result storage tpa:tpa temp.output.current_page int 1 run scoreboard players get #selector.page tpa.variables
scoreboard players remove #selector.page tpa.variables 1
execute store result storage tpa:tpa temp.output.previous_page int 1 run scoreboard players get #selector.page tpa.variables
scoreboard players add #selector.page tpa.variables 2
execute store result storage tpa:tpa temp.output.next_page int 1 run scoreboard players get #selector.page tpa.variables

execute store result storage tpa:tpa temp.output.total_requests int 1 run scoreboard players get #selector.total_requests tpa.variables
data modify storage tpa:tpa temp.output.total_requests set string storage tpa:tpa temp.output.total_requests
execute store result storage tpa:tpa temp.output.total_pages int 1 run scoreboard players get #selector.total_pages tpa.variables

function tpa:cancel_req/selector/build_page

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
