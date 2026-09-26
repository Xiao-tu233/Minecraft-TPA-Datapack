# Parent function: tpa:warp/edit/apply

#! Validation here donesn't mean is result input, it means if index exists
function tpa:warp/edit/check_session
execute unless score #warp.occupied tpa.variables matches 1 run function tpa:warp/edit/apply/not_occupied