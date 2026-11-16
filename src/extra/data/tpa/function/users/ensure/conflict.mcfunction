# Duplicate UUID records are data corruption; never append a third record.
execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6Debug§r: users UUID lookup is ambiguous for ", {selector: "@s"}, ". No record was added."]
