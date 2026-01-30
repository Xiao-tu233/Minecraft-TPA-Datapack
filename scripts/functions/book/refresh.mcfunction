# Parent function: tpa:book/state_validation
scoreboard players set #is_book_refreshed tpa.variables 1
kill @s
execute as @p run function tpa:sounds/pick_orb
tellraw @p[predicate=tpa:output/show_chatbar] [{storage:"tpa:tpa", nbt:"loaded_lang.header"}, \
    {storage:"tpa:tpa", nbt:"loaded_lang.book_refresh"}, ". " \
]
title @p[predicate=tpa:output/show_actionbar] actionbar [ \
    {storage:"tpa:tpa", nbt:"loaded_lang.book_refresh", color: "gold"} \
]
execute as @p run function tpa:book