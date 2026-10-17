# Parent function: tpa:options ( Available on: Minecraft 1.17+ )
summon item ~ ~ ~ {Item: {id: "stone", Count: 1, tag: {isOptionServerCallingItem: 1b}}, PickupDelay: 32767s, Age: -32768s, Health: 0, NoGravity: true}
summon minecraft:text_display ~ ~ ~ {alignment:"center", Tags: ["tpa.text_display"]}
data modify entity @e[sort=nearest, limit=1, tag=tpa.text_display] text set value '["[TPA] ", {"storage": "tpa:tpa", "nbt": "loaded_lang.option_server_calling"}]'
data modify entity @e[sort=nearest, limit=1, nbt={Item: {tag: {isOptionServerCallingItem: 1b}}}] CustomName set from entity @e[sort=nearest, limit=1, tag=tpa.text_display] text 
kill @e[tag=tpa.text_display]
execute unless entity @s run say @e[sort=nearest, limit=1, nbt={Item: {tag: {isOptionServerCallingItem: 1b}}}]
execute unless entity @s run say Please modify configs in Client instead of Server terminal.
kill @e[nbt={Item: {tag: {isOptionServerCallingItem: 1b}}}]
