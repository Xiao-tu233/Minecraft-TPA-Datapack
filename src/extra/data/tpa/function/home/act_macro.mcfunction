# Parent Function: tpa:home
# To be compative with 2.0.4-
$execute unless data storage tpa:tpa temp.home.$(id).dim run data modify storage tpa:tpa temp.home.$(id).dim set from storage tpa:tpa temp.home.$(id).Dimension
$function tpa:home/act with storage tpa:tpa temp.home.$(id)