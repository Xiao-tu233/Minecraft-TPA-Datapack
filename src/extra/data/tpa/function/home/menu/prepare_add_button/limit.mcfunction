# Parent function: tpa:home/menu/prepare_add_button
data modify storage tpa:tpa temp.output.button_add.label append value "/"
execute store result storage tpa:tpa temp.output.add_limit int 1 run scoreboard players get #home tpa.config
data modify storage tpa:tpa temp.output.button_add.label append string storage tpa:tpa temp.output.add_limit