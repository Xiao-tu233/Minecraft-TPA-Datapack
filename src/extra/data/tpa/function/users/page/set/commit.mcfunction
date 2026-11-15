# Private: called after the parent function's checks pass.
execute unless data storage tpa:tpa temp.users_page_scan run function tpa:users/page/append
scoreboard players operation #users.page.result tpa.variables = #users.page.candidate tpa.variables
