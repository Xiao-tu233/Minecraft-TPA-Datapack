# Parent function: tpa:update/from_206/home/scan_player/scan
data remove storage tpa:tpa temp.args
$data modify storage tpa:tpa temp.args.not_scanned set value '{$(name):$(home)}'
