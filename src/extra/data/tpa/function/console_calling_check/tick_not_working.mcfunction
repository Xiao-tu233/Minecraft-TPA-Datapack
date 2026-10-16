data modify entity @n[tag=tpa.text_display] text set value ["[TPA] ", {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tick_not_working_server_calling"}]
data modify entity @n[tag=tpa.text_display] CustomName set from entity @n[tag=tpa.text_display] text 
execute unless entity @s run say @n[tag=tpa.text_display]
execute unless entity @s run say Please acquire Command block in client instead of server terminal.