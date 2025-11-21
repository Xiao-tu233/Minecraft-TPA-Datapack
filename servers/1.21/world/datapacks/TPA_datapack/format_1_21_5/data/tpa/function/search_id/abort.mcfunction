scoreboard players set @s tpa.search_id.key 0
function tpa:load_lang
function tpa:sounds/click
tellraw @s[predicate=tpa:output/show_chatbar] [{storage: "tpa:tpa", nbt: "loaded_lang.header"}, {storage: "tpa:tpa", nbt: "loaded_lang.search_id_abort"}, " ", {storage: "tpa:tpa", nbt: "loaded_lang.search_id_recall", click_event:{action:"run_command",command: "/trigger tpa.search_id"}, hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.search_id_recall_hoverevent"}}}]
title @s[predicate=tpa:output/show_actionbar] actionbar {storage: "tpa:tpa", nbt: "loaded_lang.search_id_abort", color: "gold"}

function tpa:get_name
execute unless score #key tpa.variables matches 33 run function tpa:search_id/remove_input with storage tpa:tpa temp.args