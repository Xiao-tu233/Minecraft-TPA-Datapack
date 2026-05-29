# Called by: (advencement) tpa:book_container_detect.json

# Remove Advancement for next trigger
advancement revoke @s only tpa:book_container_detect

execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug§r: Book Missing Track: Interacion context set."]

# Get eye height
execute anchored eyes run summon item ^ ^ ^ {Item: {id: "stone", Count: 1, tag: {isInterationEyesAnchor: 1b}}, PickupDelay: 32767s, Age: -32768s, Health: 0, NoGravity: true}
data modify storage tpa:tpa temp.book.interaction_context.eyes_y set from entity @e[sort=nearest, limit=1, nbt={Item:{tag:{isInterationEyesAnchor: 1b}}}] Pos[1]
kill @e[sort=nearest, limit=1, nbt={Item:{tag:{isInterationEyesAnchor: 1b}}}]

# Store context 
# execute store result storage tpa:tpa temp.book.interaction_context.reachable_distance int 1 run attribute @s generic.block_interaction_range get
# For 1.20.4-, generic.block_interaction_range is not available according to ^ https://minecraft.wiki/w/Interaction_range
execute as @s[gamemode=!creative] run data modify storage tpa:tpa temp.book.interaction_context.reachable_distance set value 4.5d
execute as @s[gamemode=creative] run data modify storage tpa:tpa temp.book.interaction_context.reachable_distance set value 5d
data modify storage tpa:tpa temp.book.interaction_context.x set from entity @s Pos[0]
data modify storage tpa:tpa temp.book.interaction_context.y set from entity @s Pos[1]
data modify storage tpa:tpa temp.book.interaction_context.z set from entity @s Pos[2]
data modify storage tpa:tpa temp.book.interaction_context.dimension set from entity @s Dimension
data modify storage tpa:tpa temp.book.interaction_context.yaw set from entity @s Rotation[0]
data modify storage tpa:tpa temp.book.interaction_context.pitch set from entity @s Rotation[1]

# Store to storage
function tpa:get_name
data modify storage tpa:tpa temp.args.name set from storage tpa:tpa temp.name
function tpa:book/set_interaction_context_macro with storage tpa:tpa temp.args