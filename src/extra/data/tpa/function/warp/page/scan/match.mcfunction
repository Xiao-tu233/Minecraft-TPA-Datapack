# Parent function: tpa:warp/page/scan/loop
#! This is a private function, shouldn't be called by functions outside tpa:warp/page/ folder or even players

data modify storage tpa:tpa temp.warp_page_scan set from storage tpa:tpa warp[0].pages[0]
execute if score #warp.page.store_result tpa.variables matches 1 store result score #warp.page.result tpa.variables run data get storage tpa:tpa warp[0].pages[0].page
execute if score #warp.page.replace_current tpa.variables matches 1 store result storage tpa:tpa warp[0].pages[0].page int 1 run scoreboard players get #warp.page.candidate tpa.variables