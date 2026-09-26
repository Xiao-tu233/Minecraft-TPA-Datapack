# Parent function: tpa:warp/edit/apply/valid

scoreboard players set #warp.edit.no_value tpa.variables 0
execute unless data storage tpa:tpa temp.warp_edit.name unless data storage tpa:tpa temp.warp_edit.desc run scoreboard players set #warp.edit.no_value tpa.variables 1
execute if score #warp.edit.no_value tpa.variables matches 1 run function tpa:warp/edit/no_value
execute if score #warp.edit.no_value tpa.variables matches 0 run function tpa:warp/edit/commit