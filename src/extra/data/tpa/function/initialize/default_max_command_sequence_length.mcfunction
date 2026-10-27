# Parent function: tpa:initialize
execute store result score #max_command_sequence_length tpa.variables run gamerule minecraft:max_command_sequence_length
execute if score #max_command_sequence_length tpa.variables matches ..65535 run gamerule minecraft:max_command_sequence_length 65536