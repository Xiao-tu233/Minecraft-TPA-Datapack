# Parent function: tpa:home/page/scan/loop
#! This is a private function, shouldn't be called by functions outside tpa:home/page/ folder or even players

data modify storage tpa:tpa temp.home_page_scan set from storage tpa:tpa home_pages[0]
execute if score #home.page.store_result tpa.variables matches 1 store result score #home.page.result tpa.variables run data get storage tpa:tpa home_pages[0].page
execute if score #home.page.store_result tpa.variables matches 1 if data storage tpa:tpa home_pages[0].max_id store result score #home.max_id tpa.variables run data get storage tpa:tpa home_pages[0].max_id
execute if score #home.page.replace_current tpa.variables matches 1 store result storage tpa:tpa home_pages[0].page int 1 run scoreboard players get #home.page.candidate tpa.variables
execute if score #home.page.update_max_id tpa.variables matches 1 store result storage tpa:tpa home_pages[0].max_id int 1 run scoreboard players get #home.max_id tpa.variables
