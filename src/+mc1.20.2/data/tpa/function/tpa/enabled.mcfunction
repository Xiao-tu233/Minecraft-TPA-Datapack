# Parent function: tpa:tpa
execute as @a if score #recver tpa.variables = @s tpa.uid run tag @s add to_modify

execute if score #recver tpa.variables = @s tpa.uid run function tpa:tpa/requested_self
execute if entity @p[tag=to_modify, predicate=!tpa:available] run function tpa:tpa/recver_unavailable
execute if entity @p[tag=to_modify, predicate=tpa:available] run function tpa:tpa/recver_available
 
tag @a remove to_modify