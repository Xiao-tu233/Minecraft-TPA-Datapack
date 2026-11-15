# Private: called after the parent function's checks pass.
function tpa:users/page/get
scoreboard players operation #users.page.offset tpa.variables = #users.page.result tpa.variables
scoreboard players remove #users.page.offset tpa.variables 1
scoreboard players operation #users.page.offset tpa.variables *= #users.page_size tpa.variables
scoreboard players set #users.selected_index tpa.variables 0
scoreboard players operation #users.selected_index tpa.variables -= #users tpa.variables
scoreboard players remove #users.selected_index tpa.variables 2
scoreboard players operation #users.selected_index tpa.variables += #users.page.offset tpa.variables
scoreboard players operation #users tpa.variables = #users.selected_index tpa.variables
function tpa:users/select_index
