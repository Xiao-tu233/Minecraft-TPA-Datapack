# Python-Content-Manager alike format:
#  do __enter__ before entering code block, and do __exit__ after exiting code block

scoreboard players set #forceload.current_chunk_loaded tpa.variables 1
execute store result score #forceload.current_chunk_loaded tpa.variables run forceload query ~ ~
execute if score #forceload.current_chunk_loaded tpa.variables matches 0 run function tpa:component_parser/create

summon minecraft:text_display ~ ~ ~ {alignment:"center", Tags: ["tpa.text_display"]}