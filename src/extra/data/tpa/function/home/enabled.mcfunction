# Parent function: tpa:home, tpa:sethome, tpa:removehome
execute unless predicate tpa:available run function tpa:home/unavailable
execute if predicate tpa:available run function tpa:home/available