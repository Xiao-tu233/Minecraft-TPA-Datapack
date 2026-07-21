# Parent function: tpa:back

execute unless predicate tpa:available run function tpa:back/unavailable
execute if predicate tpa:available run function tpa:back/available