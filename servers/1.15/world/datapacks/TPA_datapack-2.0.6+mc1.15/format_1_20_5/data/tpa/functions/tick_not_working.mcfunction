function tpa:load_lang
gamerule commandBlockOutput false
give @s minecraft:repeating_command_block[minecraft:block_entity_data={id: command_block, Command: "function tpa:tick", conditionMet: 1b, auto: 1b}, minecraft:custom_name='[{"storage": "tpa:tpa", "nbt": "temp.lang.tick_not_working_cmdblk_name"}]']