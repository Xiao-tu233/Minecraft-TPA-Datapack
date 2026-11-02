# Parent function: tpa:home/enabled
scoreboard players set #home.page.candidate tpa.variables 1
scoreboard players operation #home.page.result tpa.variables = #home.page.candidate tpa.variables
function tpa:home/page/append