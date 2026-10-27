# Parent function:  tpa:update/from_206/home/scan_char/out_string
execute if score #option.update.depth tpa.variables matches 3 run function tpa:update/from_206/home/scan_char/commit_field with storage tpa:tpa temp.args
data modify storage tpa:tpa temp.args.token set value ""
