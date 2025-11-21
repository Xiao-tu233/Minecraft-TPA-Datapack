# @macro param: {name: string}
$data modify storage tpa:tpa temp.home set from storage tpa:tpa home.$(name)
$execute store result score #has_home tpa.variables run execute if data storage tpa:tpa home.$(name)