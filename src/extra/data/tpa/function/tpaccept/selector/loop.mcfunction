# Parent function: tpa:tpaccept/selector/set, tpa:tpaccept/selector/get, tpa:tpaccept/selector/remove

execute store result score #request_selector.current_uid tpa.variables run data get storage tpa:tpa request_selector.recv[0].uid
execute if score #request_selector.current_uid tpa.variables = #uid tpa.variables run data modify storage tpa:tpa temp.matched_selector set from storage tpa:tpa request_selector.recv[0]
execute if score #request_selector.setting tpa.variables matches 1 if score #request_selector.current_uid tpa.variables = #uid tpa.variables run data modify storage tpa:tpa request_selector.recv[0] set from storage tpa:tpa temp.current_selector

execute if score #request_selector.removing tpa.variables matches 0 run data modify storage tpa:tpa request_selector.recv append from storage tpa:tpa request_selector.recv[0]
execute if score #request_selector.removing tpa.variables matches 1 unless score #request_selector.current_uid tpa.variables = #uid tpa.variables run data modify storage tpa:tpa request_selector.recv append from storage tpa:tpa request_selector.recv[0]
data remove storage tpa:tpa request_selector.recv[0]

execute unless data storage tpa:tpa request_selector.recv[0].sentinel run function tpa:tpaccept/selector/loop
