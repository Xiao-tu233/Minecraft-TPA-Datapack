# Parent function: tpa:language/allow

# Adopt server language if which is not selected
scoreboard players operation #language tpa.config = #language tpa.variables

# Output at chatbar to everyone in server
tellraw @a[predicate=tpa:output/show_chatbar] [{interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.header"}, {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.lang_server_follow[0]"}, {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.name_display", hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.name"}}}, {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.lang_server_follow[1]"}, "." ]
