# Stable teleport entry point shared by all supported versions.
#
# Callers use this function instead of calling a version-specific teleport
# implementation. In the modern build, it adapts the common temp.teleport
# structure to the macro arguments used by the final teleport command. The
# legacy overlay keeps this same entry point, but implements the actual
# anchor-based teleport flow required by older Minecraft versions.
#
# This extra layer is intentional: keeping the caller-facing function stable
# prevents every feature that teleports a player from needing its own overlay.

data remove storage tpa:tpa temp.args
data modify storage tpa:tpa temp.args.x set from storage tpa:tpa temp.teleport.Pos[0] 
data modify storage tpa:tpa temp.args.y set from storage tpa:tpa temp.teleport.Pos[1] 
data modify storage tpa:tpa temp.args.z set from storage tpa:tpa temp.teleport.Pos[2] 
data modify storage tpa:tpa temp.args.dimension set from storage tpa:tpa temp.teleport.Dimension 
data modify storage tpa:tpa temp.args.yaw set from storage tpa:tpa temp.teleport.Rotation[0] 
data modify storage tpa:tpa temp.args.pitch set from storage tpa:tpa temp.teleport.Rotation[1]
function tpa:teleport/get_destin with storage tpa:tpa temp.args
