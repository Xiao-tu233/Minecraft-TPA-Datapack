# Parent function: tpa:tpa/requested_others
execute unless predicate tpa:available run function tpa:tpa/reqer_unavailable
execute if predicate tpa:available run function tpa:tpa/reqer_available