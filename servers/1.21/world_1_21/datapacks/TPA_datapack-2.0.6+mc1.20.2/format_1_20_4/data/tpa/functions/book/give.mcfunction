# @macro: {pages: str}

$item replace entity @s weapon.mainhand with minecraft:written_book{\
    isTpaBook:1b, \
    display: {Lore: ['$(lore)'], Name:'$(title)'}, \
    HideFlags: 255, \
    resolved: false, \
    author: "Xiao_tu233", \
    generation: 3, \
    title: $(title), \
    pages: [$(pages)] \
}
