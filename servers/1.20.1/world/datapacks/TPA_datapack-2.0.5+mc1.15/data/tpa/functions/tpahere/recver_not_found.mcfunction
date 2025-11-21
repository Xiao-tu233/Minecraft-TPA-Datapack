function tpa:sounds/no
tellraw @s[scores={tpa.output=1..2}] [{"storage":"tpa:tpa", "nbt":"temp.lang.header"}, {"storage":"tpa:tpa", "nbt":"temp.lang.reqer_req_not_exist"}, ". "]
title @s[scores={tpa.output=0..1}] subtitle [{"storage":"tpa:tpa", "nbt":"temp.lang.reqer_req_not_exist"}]