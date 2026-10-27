# Parent function: tpa:initialize
execute store result score #max_command_sequence_length tpa.variables run gamerule maxCommandChainLength
execute if score #max_command_sequence_length tpa.variables matches ..65535 run gamerule maxCommandChainLength 65536