# Parent function: tpa:update/home
data remove storage tpa:tpa temp.args
$data modify storage tpa:tpa temp.args.not_scanned set value '$(home)'
data modify storage tpa:tpa temp.args.scanned set value ""