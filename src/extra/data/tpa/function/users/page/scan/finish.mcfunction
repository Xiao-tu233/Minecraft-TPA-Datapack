# Private: called after the parent function's checks pass.
execute unless data storage tpa:tpa users_pages[0].sentinel run function tpa:users/page/scan/loop
data remove storage tpa:tpa users_pages[0]
