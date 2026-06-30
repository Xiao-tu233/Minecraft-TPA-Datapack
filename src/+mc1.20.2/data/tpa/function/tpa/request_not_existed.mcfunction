# Parent function: tpa:tpa/recver_available

execute if score @p[tag=to_modify] tpa.tpaccept_toggle matches 1 run function tpa:tpa/recver_auto_accepted
execute if score @p[tag=to_modify] tpa.tpaccept_toggle matches 0 run function tpa:tpa/add_request