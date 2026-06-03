# Parent function: tpa:component_parser/__enter__
execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6Debug§r: ", \
    "Detected target chunk(", {entity: "@n[tag=tpa.text_display]", nbt: "Pos[]", separator: " "}, \
    ") not loaded, created a temporary forceload to load the chunk. "]
forceload add ~ ~ ~ ~