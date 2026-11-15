# Scan a temporary copy; historical names in users are never removed.
data modify storage tpa:tpa temp.users.names set from storage tpa:tpa users[0].previous_names
function tpa:users/scan/previous_names_loop
