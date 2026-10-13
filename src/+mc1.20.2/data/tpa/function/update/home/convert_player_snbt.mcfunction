# Parent function: tpa:update/home/scan_player/scan
data remove storage tpa:tpa temp.args
$data modify storage tpa:tpa temp.args.not_scanned set value '{$(name):$(home)}'
