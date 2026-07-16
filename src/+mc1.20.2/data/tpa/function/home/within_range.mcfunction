# Parent function: tpa:home/selected

# The storage structure of tpa:tpa home is:
# home: {
#     <id1>: {
#         1: {x: int, y: int, z: int, dim: string[Dimension]},
#         2: {x, y, z, dim},
#         ...more homes
#     },
#     <id2>: {
#         1: {x, y, z, dim},
#         2: {x, y, z, dim},
#         ...more homes
#     },
#     ...more ids
# }

function tpa:get_name
data modify storage tpa:tpa temp.args.name set from storage tpa:tpa temp.name
function tpa:home/temp with storage tpa:tpa temp.args

# Tip the player if he hasn't had a home yet
execute unless data storage tpa:tpa temp.home run function tpa:home/create_tip
execute if data storage tpa:tpa temp.home run function tpa:home/has_home
