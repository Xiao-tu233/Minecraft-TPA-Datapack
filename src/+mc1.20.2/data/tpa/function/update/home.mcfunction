# Parent function: tpa:initialize
# The current format is a list of {x, y, z, dimension, uid, id} compounds.

execute unless data storage tpa:tpa option.home_legacy if data storage tpa:tpa home run data modify storage tpa:tpa option.home_legacy set from storage tpa:tpa home
execute unless data storage tpa:tpa home[0] run data modify storage tpa:tpa home set value []
