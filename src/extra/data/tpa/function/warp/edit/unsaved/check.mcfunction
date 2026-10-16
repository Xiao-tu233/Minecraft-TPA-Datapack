# Parent function: tpa:warp/option

execute store result score #warp.current_edittor tpa.variables run data get storage tpa:tpa temp.warp_edit.uid
execute if score #warp.current_edittor tpa.variables = @s tpa.uid run function tpa:warp/edit/unsaved/warn