# Parent function: tpa:load, tpa:dimension/menu
data modify storage tpa:tpa temp.option.dimension set from storage tpa:tpa option.dimension
data modify storage tpa:tpa option.dimension set value []
execute if data storage tpa:tpa temp.option.dimension[0] run function tpa:dimension/refresh_each
