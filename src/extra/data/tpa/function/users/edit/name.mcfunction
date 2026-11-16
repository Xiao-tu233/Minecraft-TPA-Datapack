# Open a text-input dialog for the selected user's current name.
data remove storage tpa:tpa temp.users_edit
execute store result storage tpa:tpa temp.users_edit.uid int 1 run data get storage tpa:tpa temp.users.result.uid
data modify storage tpa:tpa temp.users_edit.old_name set from storage tpa:tpa temp.users.result.name
data modify storage tpa:tpa temp.dialog set value {type: "minecraft:multi_action", title: "Set user name", body: {type: "minecraft:plain_message", contents: ["Enter a new current name."], width: 500}, inputs: [{key: "edit", type: "minecraft:text", label: "Name", initial: ""}], columns: 3, pause: false, after_action: "close"}
data modify storage tpa:tpa temp.dialog.actions set value [{action: {type: "minecraft:dynamic/run_command", template: "/data modify storage tpa:tpa temp.users_edit.name set value \"$(edit)\""}, label: "[Input]"}, {action: {type: "minecraft:run_command", command: "/function tpa:users/edit/apply/name"}, label: "[Apply]"}, {action: {type: "minecraft:run_command", command: "/function tpa:users/edit/cancel"}, label: "[Cancel]"}]
data modify storage tpa:tpa temp.args set value {}
data modify storage tpa:tpa temp.args.dialog set from storage tpa:tpa temp.dialog
function tpa:util/dialog with storage tpa:tpa temp.args
