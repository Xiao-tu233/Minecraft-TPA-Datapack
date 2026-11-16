data modify storage tpa:tpa temp.users.candidate set value {}
data modify storage tpa:tpa temp.users.candidate.uid set from storage tpa:tpa temp.users_edit.uid
data modify storage tpa:tpa temp.users.candidate.uuid set from storage tpa:tpa temp.users_edit.uuid
function tpa:users/set_uuid
dialog clear @s
function tpa:users/option
