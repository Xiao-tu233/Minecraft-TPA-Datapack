# Parent function: tpa:book/track/stricter_check
# @param: see parent function
data remove storage tpa:tpa temp.args
data modify storage tpa:tpa temp.args.with.blocks set value false
data modify storage tpa:tpa temp.args.with.entities set value "tpa.entity_container"
data modify storage tpa:tpa temp.args.with.piercing set from storage tpa:tpa temp.book.context.reachable_distance

tag @e[predicate=tpa:book/is_entity_container] add tpa.entity_container
execute as @n[tag=tpa.book_track.anchor] at @s rotated as @s run function #bs.raycast:run with storage tpa:tpa temp.args
execute as @e[predicate=tpa:book/is_entity_container] run function tpa:book/track/check_uuid
tag @e[predicate=tpa:book/is_entity_container] remove tpa.entity_container

