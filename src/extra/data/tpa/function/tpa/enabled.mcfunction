# Parent function: tpa:tpa
execute if score #recver tpa.variables = @s tpa.uid run function tpa:tpa/requested_self
execute unless score #recver tpa.variables = @s tpa.uid run function tpa:tpa/requested_others