# Parent function: tpa:dialog

execute unless predicate tpa:available run function tpa:dialog/menu/book/unavailable
execute if predicate tpa:available run function tpa:menu/book/available