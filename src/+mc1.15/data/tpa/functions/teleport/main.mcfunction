execute if score #sim_dist tpa.config = #sim_dist tpa.config run function tpa:teleport/main__

execute unless score #sim_dist tpa.config = #sim_dist tpa.config run function tpa:sounds/no
execute unless score #sim_dist tpa.config = #sim_dist tpa.config run tellraw @s[scores={tpa.output=1..2}] [{"storage":"tpa:tpa", "nbt":"temp.lang.header"}, {"storage":"tpa:tpa", "nbt":"temp.lang.teleport_tryagain"}, "."]
execute unless score #sim_dist tpa.config = #sim_dist tpa.config run title @s[scores={tpa.output=0..1}] actionbar [{"storage":"tpa:tpa", "nbt":"temp.lang.teleport_tryagain", "color": "red"}]
execute unless score #sim_dist tpa.config = #sim_dist tpa.config as @p run function tpa:teleport/cal_sim_dist
