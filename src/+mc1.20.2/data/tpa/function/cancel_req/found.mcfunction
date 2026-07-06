
execute store result score #recver tpa.variables run data get storage tpa:tpa temp.matched_requests[0].recver
execute store result score #direction tpa.variables run data get storage tpa:tpa temp.matched_requests[0].direction

function tpa:cancel_req/act