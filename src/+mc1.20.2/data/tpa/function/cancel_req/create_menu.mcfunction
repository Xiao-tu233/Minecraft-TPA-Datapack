# Parent function: tpa:cancel_req/multiple_found

data modify storage tpa:tpa request_selector.req append value {page: 1}
execute store result storage tpa:tpa request_selector.req[-1].uid int 1 run scoreboard players get @s tpa.uid
data modify storage tpa:tpa request_selector.req[-1].req set from storage tpa:tpa temp.matched_requests