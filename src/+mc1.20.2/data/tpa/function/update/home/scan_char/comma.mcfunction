# Parent function:  tpa:update/home/scan_char/out_string
execute if score #option.update.depth tpa.variables matches 3 run function tpa:update/home/scan_char/commit_field with storage tpa:tpa temp.args
data modify storage tpa:tpa temp.args.token set value ""
