# OP entry point matching tpa:warp/option. The menu is data-backed and pages
# are persisted per viewer UID, so opening it never changes the users list.
scoreboard players set #users.editting tpa.variables 1
function tpa:users/page/get
function tpa:users/menu
