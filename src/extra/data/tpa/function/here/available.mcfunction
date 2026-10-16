# Parent function: tpa:here
data modify storage tpa:tpa temp.args.request_teleport_button_tooltip set value "reqer_button_tpa_hoverevent"
data modify storage tpa:tpa temp.args.request_teleport_button_action_leftpart set value 'click_event: {action: "run_command", command: "/trigger tpa.tpa set '
data modify storage tpa:tpa temp.args.request_teleport_button_action_arg set from storage tpa:tpa temp.args.id
data modify storage tpa:tpa temp.args.request_teleport_button_action_rightpart set value '"}, '
data modify storage tpa:tpa temp.args.request_teleport_button_brackets set value ["[", "]"]