# Parent function tpa:warp/setname, tpa:warp/setdesc, tpa:warp/edit/apply/valid

# Remove expired session: 5 minutes
execute store result score #warp.delta_time tpa.variables run time query gametime
execute store result score #warp.last_edit_time tpa.variables run data get storage tpa:tpa temp.warp_edit.last_edit_time
scoreboard players operation #warp.delta_time tpa.variables -= #warp.last_edit_time tpa.variables
execute if score #warp.delta_time tpa.variables matches 6000.. run data get storage tpa:tpa temp.warp_edit

# Return Occupy: uid not matching
scoreboard players set #warp.occupied tpa.variables 0
execute store result score #warp.current_edittor tpa.variables run data get storage tpa:tpa temp.warp_edit.uid
execute unless score #warp.current_edittor tpa.variables = @s tpa.uid run scoreboard players set #warp.occupied tpa.variables 1
execute unless data storage tpa:tpa temp.warp_edit.uid run scoreboard players set #warp.occupied tpa.variables 0

execute if score #warp.occupied tpa.variables matches 1 run function tpa:warp/edit/occupied