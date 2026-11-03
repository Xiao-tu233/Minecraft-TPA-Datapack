# Parent function: tpa:home/menu/has_home
# Persist the last valid page after the menu recalculates total_pages.

scoreboard players operation #home.page.candidate tpa.variables = #home.total_pages tpa.variables
function tpa:home/page/set
