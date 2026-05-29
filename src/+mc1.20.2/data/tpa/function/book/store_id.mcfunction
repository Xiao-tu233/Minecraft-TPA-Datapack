# Parent Function: tpa:each_line
# @macro: {id: int}

$data modify storage tpa:tpa temp.book.lines append value {text:'', click_event: {action: 'run_command', command: '/trigger tpa.tpa set $(id)'}, hover_event: {action:'show_text', value: [{interpret: true, storage: 'tpa:tpa', nbt: 'loaded_lang.tpa_menu_hoverevent_left_part'}, {text: ''}, {interpret: true, storage: 'tpa:tpa', nbt: 'loaded_lang.tpa_menu_hoverevent_right_part'}]}}
data modify storage tpa:tpa temp.book.lines[-1].text set from storage tpa:tpa temp.name
data modify storage tpa:tpa temp.book.lines[-1].hover_event.value[1] set from storage tpa:tpa temp.name
scoreboard players add #lines tpa.variables 1