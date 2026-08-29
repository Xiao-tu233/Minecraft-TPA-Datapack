# Parent function: tpa:initialize
# Keep the old name-keyed homes available until each player can migrate them.
data modify storage tpa:tpa option.home_legacy set from storage tpa:tpa home
# The current format is a list of {x, y, z, dimension, uid, id} compounds.
data modify storage tpa:tpa home set value []
