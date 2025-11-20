# Parent Function: tpa:book/each_page

data modify entity @n[type=text_display, tag=tpa.text_display] text set value {storage: 'tpa:tpa', nbt: 'temp.book.lines[]', separator: '\n', interpret: true}
data modify storage tpa:tpa temp.book.pages append from entity @n[type=text_display, tag=tpa.text_display] text

