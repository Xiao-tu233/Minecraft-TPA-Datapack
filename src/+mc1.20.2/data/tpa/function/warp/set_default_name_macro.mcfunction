# Parent function: tpa:warp/set_default_name
# Macro arguments: {warp_number: str, index: int}

$data modify storage tpa:tpa warp[$(index)].name set value "$(warp_number)$(index)"

