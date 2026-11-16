# Public: persist the previous page. The future menu caller renders afterwards.
function tpa:users/page/get
scoreboard players operation #users.page.candidate tpa.variables = #users.page.result tpa.variables
scoreboard players remove #users.page.candidate tpa.variables 1
function tpa:users/page/set
function tpa:users/option
