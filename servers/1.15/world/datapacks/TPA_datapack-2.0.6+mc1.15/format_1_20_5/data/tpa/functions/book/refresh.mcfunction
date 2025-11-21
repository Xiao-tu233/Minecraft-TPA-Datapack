
clear @p minecraft:written_book[minecraft:custom_data={isTpaBook:1b}]
kill @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{isTpaBook: 1b}}}}]
execute as @p run function tpa:book