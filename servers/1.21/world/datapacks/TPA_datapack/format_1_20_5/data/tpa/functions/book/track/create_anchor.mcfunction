# Parent function: tpa:book/track/stricter_check
# @param: see parent function
$execute in $(dimension) run summon minecraft:marker $(x) $(eyes_y) $(z) {Tags: ["tpa.book_track.anchor"], NoGravity: 1b}
data modify entity @e[sort=nearest, limit=1, tag=tpa.book_track.anchor] Rotation[0] set from storage tpa:tpa temp.book.context.yaw
data modify entity @e[sort=nearest, limit=1, tag=tpa.book_track.anchor] Rotation[1] set from storage tpa:tpa temp.book.context.pitch