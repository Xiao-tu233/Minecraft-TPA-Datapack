# Private: the viewer UID and page candidate have been checked by page/set.
data modify storage tpa:tpa temp.users_page_candidate set value {}
execute store result storage tpa:tpa temp.users_page_candidate.uid int 1 run scoreboard players get #users.page.uid tpa.variables
execute store result storage tpa:tpa temp.users_page_candidate.page int 1 run scoreboard players get #users.page.candidate tpa.variables
data modify storage tpa:tpa users_pages append from storage tpa:tpa temp.users_page_candidate
