# Parent function: tpa:dialog

data remove storage tpa:tpa temp.dialog
data modify storage tpa:tpa temp.dialog set value {type: "minecraft:multi_action", pause: false, after_action: "close", columns: 5, body: {type: "minecraft:plain_message", contents: []}, actions: []}
