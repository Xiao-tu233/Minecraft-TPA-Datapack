# Parent function: tpa:initialize (Change storage home format from v2.0.5 to v2.0.6)

data modify storage tpa:tpa temp.home set value []

function tpa:home/migrate/iterate_uids

data modify storage tpa:tpa home set from storage tpa:tpa temp.home