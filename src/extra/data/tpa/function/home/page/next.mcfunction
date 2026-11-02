# Parent function: tpa:home/available

scoreboard players add #home.page.result tpa.variables 1
execute if score #home.page.result tpa.variables >= #home.total_pages tpa.variables run scoreboard players operation #home.page.result tpa.variables = #home.total_pages tpa.variables
scoreboard players operation #home.page.candidate tpa.variables = #home.page.result tpa.variables
function tpa:home/page/set

function tpa:home/menu