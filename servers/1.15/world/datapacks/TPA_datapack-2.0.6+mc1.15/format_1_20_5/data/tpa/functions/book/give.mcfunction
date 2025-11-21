# @macro: {pages: str}

$item replace entity @s weapon.mainhand with minecraft:written_book[\
    minecraft:custom_data={isTpaBook:1b},\
    minecraft:lore=[\
        '$(lore)' \
    ],\
    hide_additional_tooltip={}, \
    minecraft:written_book_content={\
        author: "Xiao_tu233", \
        title: {"raw": $(title)}, \
        resolved: 0b, \
        generation: 3, \
        pages: [$(pages)] \
    }\
]
