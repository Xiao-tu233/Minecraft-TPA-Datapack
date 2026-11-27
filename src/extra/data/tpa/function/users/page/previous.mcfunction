# Public: go back one saved page and render the menu again.
function tpa:users/page/get
scoreboard players operation #users.page.candidate tpa.variables = #users.page.result tpa.variables
scoreboard players remove #users.page.candidate tpa.variables 1
function tpa:users/page/set
function tpa:users/menu
