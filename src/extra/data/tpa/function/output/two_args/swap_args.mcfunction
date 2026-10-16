# Parent function: tpa:output/two_args
data modify storage tpa:tpa temp.output.swap set from storage tpa:tpa temp.output.args[0]
data modify storage tpa:tpa temp.output.args[0] set from storage tpa:tpa temp.output.args[1]
data modify storage tpa:tpa temp.output.args[1] set from storage tpa:tpa temp.output.swap

data modify storage tpa:tpa temp.output.swap set from storage tpa:tpa temp.output.arg_hovers[0]
data modify storage tpa:tpa temp.output.arg_hovers[0] set from storage tpa:tpa temp.output.arg_hovers[1]
data modify storage tpa:tpa temp.output.arg_hovers[1] set from storage tpa:tpa temp.output.swap