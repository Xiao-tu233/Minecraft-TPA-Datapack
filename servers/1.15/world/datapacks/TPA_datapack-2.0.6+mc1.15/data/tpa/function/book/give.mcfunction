# @macro: {pages: str}
scoreboard players set @s tpa.book 2
$item replace entity @s weapon.mainhand with minecraft:written_book[\
    minecraft:custom_data={isTpaBook:1b},\
    minecraft:lore=[\
        '$(lore)' \
    ],\
    minecraft:hide_additional_tooltip={}, \
    minecraft:written_book_content={\
        author: "Xiao_tu233", \
        title: {"raw": $(title)}, \
        resolved: 0b, \
        generation: 3, \
        pages: [$(pages)] \
    }\
]
