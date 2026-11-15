# Public: persist the next page. The future menu caller renders afterwards.
function tpa:users/page/get
scoreboard players operation #users.page.candidate tpa.variables = #users.page.result tpa.variables
scoreboard players add #users.page.candidate tpa.variables 1
function tpa:users/page/set
