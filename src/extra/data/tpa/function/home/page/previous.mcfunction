# Parent function: tpa:home/available

scoreboard players remove #home.page.result tpa.variables 1
execute if score #home.page.result tpa.variables matches ..0 run scoreboard players set #home.page.result tpa.variables 1
scoreboard players operation #home.page.candidate tpa.variables = #home.page.result tpa.variables
function tpa:home/page/set

function tpa:home/menu