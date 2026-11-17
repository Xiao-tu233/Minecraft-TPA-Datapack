# Private: remove the saved page record for #users.uid after a user record is removed.
data remove storage tpa:tpa temp.users_page_scan
scoreboard players operation #users.page.uid tpa.variables = #users.uid tpa.variables
scoreboard players set #users.page.store_result tpa.variables 0
scoreboard players set #users.page.replace_current tpa.variables 0
scoreboard players set #users.page.remove_current tpa.variables 1
function tpa:users/page/scan
scoreboard players set #users.page.remove_current tpa.variables 0
