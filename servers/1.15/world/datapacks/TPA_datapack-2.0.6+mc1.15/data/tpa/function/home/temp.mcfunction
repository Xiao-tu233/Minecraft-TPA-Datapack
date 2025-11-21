# @macro param: {name: string}
$data modify storage tpa:tpa temp.home set from storage tpa:tpa home.$(name)
$return run execute if data storage tpa:tpa home.$(name)