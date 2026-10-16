# Parent function: tpa:book

execute unless predicate tpa:available run function tpa:book/unavailable
execute if predicate tpa:available run function tpa:book/available