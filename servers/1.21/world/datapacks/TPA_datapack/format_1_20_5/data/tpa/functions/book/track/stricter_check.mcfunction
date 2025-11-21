# Parenct function: tpa:book/track_missing
# Get context
function tpa:get_name
data modify storage tpa:tpa temp.args.name set from storage tpa:tpa temp.name
function tpa:book/track/get_context with storage tpa:tpa temp.args

# Below functions' macro parameters: context: {
#             x: double, y: double, z: double, 
#             eyes_y: double, 
#             yaw: float, pitch: float, 
#             dimension: string, reachable_distance: int
#         }


# Create anchor
function tpa:book/track/create_anchor with storage tpa:tpa temp.book.context

# Check Container Entities
function tpa:book/track/check_entity with storage tpa:tpa temp.book.context

# Check Container Blocks
function tpa:book/track/check_block

# Kill Anchor
kill @e[sort=nearest, limit=1, tag=tpa.book_track.anchor]