# Parent function: tpa:tick_not_working ( 1.17+ だけ )
# Server calling check
summon item ~ ~ ~ {Item: {id: "stone", Count: 1, tag: {isOptionServerCallingItem: 1b}}, PickupDelay: 32767s, Age: -32768s, Health: 0, NoGravity: true}
summon minecraft:text_display ~ ~ ~ {alignment:"center",Tags:["tpa.text_display"]}
data modify entity @e[sort=nearest, limit=1, tag=tpa.text_display] text set value '["[TPA] ", {"storage": "tpa:tpa", "nbt": "loaded_lang.tick_not_working_server_calling"}]'
data modify entity @e[sort=nearest, limit=1, nbt={Item: {tag: {isOptionServerCallingItem: 1b}}}] CustomName set from entity @e[sort=nearest, limit=1, tag=tpa.text_display] text 
kill @e[tag=tpa.text_display]
execute unless entity @s run say @e[sort=nearest, limit=1, nbt={Item: {tag: {isOptionServerCallingItem: 1b}}}]
execute unless entity @s run say Please acquire Command block in client instead of server terminal.
kill @e[nbt={Item: {tag: {isOptionServerCallingItem: 1b}}}]