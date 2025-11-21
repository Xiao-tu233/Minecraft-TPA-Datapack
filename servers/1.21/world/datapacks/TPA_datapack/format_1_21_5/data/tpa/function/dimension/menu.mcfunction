# Called by: (player) Any OP, quoted by: tpa:options

# Refresh dimension count: dimension = len(dimension) - 1
execute store result score #dimension tpa.config run data get storage tpa:tpa option.dimension
# [{namespaceid: "minecraft:xxx", name: "Xxx Yyy", id: int, color: "#XXXXXX"}, ...]

# Load lang for display name edit later
scoreboard players operation #target_lang tpa.variables = #language tpa.config
function tpa:load_lang

# Title
tellraw @s [{storage:"tpa:tpa", nbt:"loaded_lang.header"}, {storage:"tpa:tpa", nbt:"loaded_lang.option_dimension_menu_title"}]

# Load the dimension data
data modify storage tpa:tpa temp.option.dimension set from storage tpa:tpa option.dimension
scoreboard players set #i tpa.variables 0
execute if data storage tpa:tpa temp.option.dimension[0] run function tpa:dimension/show_each

tellraw @s ["  ", {storage: "tpa:tpa", nbt: "loaded_lang.option_dimension_button_add", hover_event:{action:"show_text",value:{storage: "tpa:tpa", nbt: "loaded_lang.option_dimension_button_add_hoverevent"}},click_event:{action:"suggest_command",command:"/data modify storage tpa:tpa option.dimension append value {namespaceid: \"mynamespace:my_dimension\", name: \"Dimension Name\", color: \"#FF0000\", id: }"}}]