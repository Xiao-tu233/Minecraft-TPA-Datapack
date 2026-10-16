# @macro param: {name: string}
data remove storage tpa:tpa temp.home
$data modify storage tpa:tpa temp.home set from storage tpa:tpa home.$(name)
