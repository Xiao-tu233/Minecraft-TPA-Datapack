# Parent function: tpa:dialog

execute unless predicate tpa:available run function tpa:dialog/menu/back/unavailable
execute if predicate tpa:available run function tpa:dialog/menu/back/available