# Menu rewrite entrypoint. Keep the new dialog scaffold for the UID-slot menu.
# TODO: assemble fixed UID slots, localized labels/actions and final rendering.
function tpa:load_lang

data remove storage tpa:tpa temp.output.menu
data modify storage tpa:tpa temp.output.menu set value {type: "minecraft:multi_action", exit_action: {label: {translate: "gui.done"}, width: 200}, body: {type: "minecraft:plain_message"}, title: [{color: aqua}, {text: " (", color: "white"}, {color: "white"}, {text: "/", color: "gray"}, {color: "white"}, {text: ")", color: "white"}], pause: false, after_action: "close", columns: 6}

function 

scoreboard players set #users.result tpa.variables 3
data remove storage tpa:tpa temp.users.result
scoreboard players set #users.uid tpa.variables 0
function tpa:users/get