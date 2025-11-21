$item replace entity @s weapon.mainhand with minecraft:written_book[\
    minecraft:custom_data={isTpaBook:1b},\
    minecraft:lore=["$(lore)"],\
    minecraft:custom_name="$(title)", \
    minecraft:tooltip_display={hidden_components: ["minecraft:written_book_content"]}, \
    minecraft:written_book_content={\
        author: "Xiao_tu233", \
        title: {raw: "UsingBookTitle"}, \
        resolved: 0b, \
        generation: 3, \
        pages: [] \
    }\
]