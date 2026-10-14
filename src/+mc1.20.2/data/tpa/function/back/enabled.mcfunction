# Parent function: tpa:back

execute if score #back tpa.variables matches 1.. run function tpa:back/positive_triggered
execute if score #back tpa.variables matches ..-1 run function tpa:back/negative_triggered