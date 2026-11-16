# UUID is entered as native SNBT, for example [I; 1, 2, 3, 4].
data remove storage tpa:tpa temp.users_edit
execute store result storage tpa:tpa temp.users_edit.uid int 1 run data get storage tpa:tpa temp.users.result.uid
data modify storage tpa:tpa temp.users_edit.old_uuid set from storage tpa:tpa temp.users.result.uuid
data modify storage tpa:tpa temp.dialog set value {type: "minecraft:multi_action", title: "Set user UUID", body: {type: "minecraft:plain_message", contents: ["Enter an int-array UUID SNBT value."], width: 500}, inputs: [{key: "edit", type: "minecraft:text", label: "UUID", initial: ""}], columns: 3, pause: false, after_action: "close"}
data modify storage tpa:tpa temp.dialog.actions set value [{action: {type: "minecraft:dynamic/run_command", template: "/data modify storage tpa:tpa temp.users_edit.uuid set value $(edit)"}, label: "[Input]"}, {action: {type: "minecraft:run_command", command: "/function tpa:users/edit/apply/uuid"}, label: "[Apply]"}, {action: {type: "minecraft:run_command", command: "/function tpa:users/edit/cancel"}, label: "[Cancel]"}]
data modify storage tpa:tpa temp.args set value {}
data modify storage tpa:tpa temp.args.dialog set from storage tpa:tpa temp.dialog
function tpa:util/dialog with storage tpa:tpa temp.args
