# Parent Function: tpa:each_line
# @macro: {id: int, key: int, name: str}
$data modify storage tpa:tpa book.each_page append value {text: "$(name)", click_event: {action: "run_command", command: "/trigger tpa.tpa set $(id)"}, hover_event: {action: "show_text",value: "§b点击向玩家$(name)发送传送请求"}}
scoreboard players add #current_line tpa.variables 1
scoreboard players add #j tpa.variables 1