function tpa:load_lang
gamerule commandBlockOutput false
give @s minecraft:repeating_command_block{display:{Name:'[{"storage": "tpa:tpa", "nbt": "tick_not_working_cmdblk_name"}]'}, BlockEntityTag: {Command: "function tpa:tick", conditionMet: 1b, auto: 1b}}