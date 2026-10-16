# Parent function: tpa:cancel_req/cancel_specific

execute store result score #reqer tpa.variables run data get storage tpa:tpa temp.canceled_request.reqer
execute store result score #recver tpa.variables run data get storage tpa:tpa temp.canceled_request.recver
execute store result score #direction tpa.variables run data get storage tpa:tpa temp.canceled_request.direction

function tpa:cancel_req/act
