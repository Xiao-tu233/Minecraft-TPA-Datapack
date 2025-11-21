# Parent Function: tpa:home/display_loop
# @macro: {id: int, name: str}
# @return: 0: home not exist, 1: home exists
$execute if data storage tpa:tpa temp.home.$(id) run return 1
return 0