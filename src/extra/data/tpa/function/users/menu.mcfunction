# Render the current five-record page. All list selection uses 1-based
# positions; callers resolve the record and then act on its stable UID.
function tpa:load_lang
function tpa:users/page/get
scoreboard players operation #users.page.offset tpa.variables = #users.page.result tpa.variables
scoreboard players remove #users.page.offset tpa.variables 1
scoreboard players operation #users.page.offset tpa.variables *= #5 tpa.variables
scoreboard players operation #users.menu.start tpa.variables = #users.page.offset tpa.variables
scoreboard players add #users.menu.start tpa.variables 1
scoreboard players operation #users.menu.end tpa.variables = #users.menu.start tpa.variables
scoreboard players add #users.menu.end tpa.variables 4
data remove storage tpa:tpa temp.users.input
execute store result storage tpa:tpa temp.users.input.start int 1 run scoreboard players get #users.menu.start tpa.variables
execute store result storage tpa:tpa temp.users.input.end int 1 run scoreboard players get #users.menu.end tpa.variables
function tpa:users/get_range

data remove storage tpa:tpa temp.output.menu
data modify storage tpa:tpa temp.output.menu set value {type: "minecraft:multi_action", exit_action: {label: {translate: "gui.done"}, width: 200}, body: {type: "minecraft:plain_message"}, title: [{color: aqua}, {text: " (", color: "white"}, {color: "white"}, {text: "/", color: "gray"}, {color: "white"}, {text: ")", color: "white"}], pause: false, after_action: "close", columns: 2}

tellraw @s ["------------ Users (", {score: {name: "#users.page.result", objective: "tpa.variables"}}, "/", {score: {name: "#users.total_pages", objective: "tpa.variables"}}, ") ------------"]
execute if score #users.total tpa.variables matches 0 run tellraw @s "No user records"
execute if data storage tpa:tpa temp.users.results[0] run function tpa:users/menu/slot_1
execute if data storage tpa:tpa temp.users.results[1] run function tpa:users/menu/slot_2
execute if data storage tpa:tpa temp.users.results[2] run function tpa:users/menu/slot_3
execute if data storage tpa:tpa temp.users.results[3] run function tpa:users/menu/slot_4
execute if data storage tpa:tpa temp.users.results[4] run function tpa:users/menu/slot_5
execute if score #users.page.result tpa.variables matches 2.. run tellraw @s {text: "[< Previous]", color: "aqua", click_event: {action: "run_command", command: "/function tpa:users/page/previous"}}
execute if score #users.page.result tpa.variables < #users.total_pages tpa.variables run tellraw @s {text: "[Next >]", color: "aqua", click_event: {action: "run_command", command: "/function tpa:users/page/next"}}
