data modify storage tpa:tpa temp.users_page_scan set from storage tpa:tpa users_pages[0]
execute if score #users.page.store_result tpa.variables matches 1 store result score #users.page.result tpa.variables run data get storage tpa:tpa users_pages[0].page
execute if score #users.page.replace_current tpa.variables matches 1 store result storage tpa:tpa users_pages[0].page int 1 run scoreboard players get #users.page.candidate tpa.variables
