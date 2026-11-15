# Private: reuse Warp's sentinel rotation for viewer-specific page records.
# Page metadata is separate from users so users[0] remains a real user.
execute unless data storage tpa:tpa users_pages run data modify storage tpa:tpa users_pages set value []
execute store success score #users.page.scan_ok tpa.variables run data modify storage tpa:tpa users_pages append value {sentinel: 1b}
execute if score #users.page.scan_ok tpa.variables matches 1 run function tpa:users/page/scan/finish
