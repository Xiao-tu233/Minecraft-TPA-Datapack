# Parent Function: tpa:each_line
# @macro: {id: int, key: int, name: str}
$data merge storage tpa:tpa {book:{each_page:{id_$(key):'{"text":"$(name)","clickEvent":{"action":"run_command","value":"/trigger tpa.tpa set $(id)"},"hoverEvent":{"action":"show_text","value":"§b点击向玩家$(name)发送传送请求"}}'}}}
$data modify entity @e[limit=1, sort=nearest, type=minecraft:text_display,tag=tpa.text_display] text set value '{"storage":"tpa:tpa","nbt":"book.each_page.id_$(key)"}'
$data modify storage tpa:tpa book.each_page.id_$(key) set from entity @e[limit=1, sort=nearest, type=minecraft:text_display,tag=tpa.text_display] text
$data modify storage tpa:tpa book.each_page.id_$(key) set string storage tpa:tpa book.each_page.id_$(key) 9 -2
scoreboard players add #j tpa.variables 1