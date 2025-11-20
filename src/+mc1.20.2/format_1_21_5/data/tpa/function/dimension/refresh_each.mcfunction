# Parent function: tpa:dimension/refresh_each(loop), tpa:dimension/refresh

execute store result score #current_dimension tpa.variables run data get storage tpa:tpa temp.option.dimension[0].id

execute if score #current_dimension tpa.variables matches -1 run data modify storage tpa:tpa temp.option.dimension[0].name set from storage tpa:tpa loaded_lang.dimension_the_nether
execute if score #current_dimension tpa.variables matches -1 run data modify storage tpa:tpa temp.option.dimension[0].namespaceid set value "minecraft:the_nether"
execute if score #current_dimension tpa.variables matches 0 run data modify storage tpa:tpa temp.option.dimension[0].name set from storage tpa:tpa loaded_lang.dimension_overworld
execute if score #current_dimension tpa.variables matches 0 run data modify storage tpa:tpa temp.option.dimension[0].namespaceid set value "minecraft:overworld"
execute if score #current_dimension tpa.variables matches 1 run data modify storage tpa:tpa temp.option.dimension[0].name set from storage tpa:tpa loaded_lang.dimension_the_end
execute if score #current_dimension tpa.variables matches 1 run data modify storage tpa:tpa temp.option.dimension[0].namespaceid set value "minecraft:the_end"

execute unless data storage tpa:tpa temp.option.dimension[0].name run tellraw @a [{storage: "tpa:tpa", nbt: "loaded_lang.header"}, {storage: "tpa:tpa", nbt: "loaded_lang.dimension_unknown_detected_leftpart"}, {storage: "tpa:tpa", nbt: "temp.option.dimension[0].namespaceid"}, ",", {storage: "tpa:tpa", nbt: "temp.option.dimension[0].id"}, {storage: "tpa:tpa", nbt: "loaded_lang.dimension_unknown_detected_rightpart"}, {storage: "tpa:tpa", nbt: "loaded_lang.dimension_menu_button", click_event:{action:"run_command",command: "/function tpa:dimension/menu"}, hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.dimension_menu_button_hoverevent"}}}]

data modify storage tpa:tpa option.dimension append from storage tpa:tpa temp.option.dimension[0]
data remove storage tpa:tpa temp.option.dimension[0]
execute if data storage tpa:tpa temp.option.dimension[0] run function tpa:dimension/refresh_each