# Parent function: tpa:book/track/stricter_check
# @param: see parent function

# If frequency has been set, pack ticks delay, items is probably being transported hoppers, dropper or crafter, which cannot be calculated or too complexible to be calc
execute if score #frequency tpa.config matches ..19 run return 0

data remove storage tpa:tpa temp.args
data modify storage tpa:tpa temp.args.with.piercing set from storage tpa:tpa temp.book.context.reachable_distance

execute as @n[tag=tpa.book_track.anchor] at @s rotated as @s run function #bs.raycast:run with storage tpa:tpa temp.args

data remove storage tpa:tpa temp.args
execute store result storage tpa:tpa temp.args.x int 1 run data get storage bs:out raycast.targeted_block[0]
execute store result storage tpa:tpa temp.args.y int 1 run data get storage bs:out raycast.targeted_block[1]
execute store result storage tpa:tpa temp.args.z int 1 run data get storage bs:out raycast.targeted_block[2]
function tpa:book/track/is_block_container with storage tpa:tpa temp.args
execute if score #is_block_container tpa.variables matches 1 run function tpa:book/track/check_block_slots
execute if score #is_block_container tpa.variables matches 0 if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug§r: The Block ", {interpret: true, storage: "tpa:tpa", nbt: "temp.args.x"}, " ", {interpret: true, storage: "tpa:tpa", nbt: "temp.args.y"}, " ", {interpret: true, storage: "tpa:tpa", nbt: "temp.args.z"}, " is not a block container"]