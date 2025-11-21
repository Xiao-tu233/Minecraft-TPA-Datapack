#> tpa:langtell/langtell_0.mcfunction
# This file folder is used to place all the "tellraw" functions
# And you can custom your language in each function in this folder
# language code and their language name:
# code |                name                 | local name
# 0    | English(US)                         | English(United States)
# 1    | Simplified_chinese(China Mainland)  | 简体中文(中国大陆)
# 2    | Traditional_chinese(Taiwan)         | 繁體中文(臺灣)
# 3    | custom language                     | -
# ...  | ...                                 | ...

#! Follow following steps to custom language:
# 1. replace all the "<Text here>" in langtell folder 
#    as the format of the language above which you are able to speak.
# 2. add your language and trigger in tpa:lang_menu function.
# 3. modify the maxinum types of languages at 
#    "
#    #> tpa:tick.mcfunction
#    ...
#    execute as @a[scores={language=3..}] run scoreboard players set @s language 0
#                                   ^
#    ...
#    "
# 4. Test your language ingame.

# in the functions with a certain language

# tpa:langtell/langtell_0: folder intro
# tpa:langtell/langtell_11: help page 1
# tpa:langtell/langtell_12: help page 2

# tpa:langtell/langtell_20: id display - tpa == 1
# tpa:langtell/langtell_21: tp urself - tpa == your player_id
# tpa:langtell/langtell_22: send tpa req - tpa > 1
# tpa:langtell/langtell_23: receive tpa req - player_id == others' tpa
# tpa:langtell/langtell_24: extended tpa menu page 1
# tpa:langtell/langtell_25: extended tpa menu page n
# tpa:langtell/langtell_26: search id - holding stuff
# tpa:langtell/langtell_27: search id - give book and quill
# tpa:langtell/langtell_28: don't switch item
# tpa:langtell/langtell_29: display searched id
# tpa:langtell/langtell_2a: player not exist

# tpa:langtell/langtell_31: enable always-accept - accept-toggle == 1 or tpaccept == 2
# tpa:langtell/langtell_32: disable always-accept - accept-toggle == 0 or tpaccept == 3
# tpa:langtell/langtell_33: tp executed (to requester)
# tpa:langtell/langtell_34: tp executed (to accepter)
# tpa:langtell/langtell_35: tp denied (to requester)
# tpa:langtell/langtell_36: tp denied (to denier)
# tpa:langtell/langtell_37: tp auto-accepted (to accepter)
# tpa:langtell/langtell_38: tp auto-accepted (to requester)

# tpa:langtell/langtell_41: ifAllowPlayerToDoBack not enable
# tpa:langtell/langtell_42: back failed
# tpa:langtell/langtell_43: back successfully

# tpa:langtell/langtell_51: unmute - mute == 0 or to_mute == 2
# tpa:langtell/langtell_52: mute - mute == 1 or to_mute == 1

# tpa:langtell/langtell_60: tpahere menu
# tpa:langtell/langtell_62: tphere request sent(to requester)
# tpa:langtell/langtell_63: tphere request sent(to receiver)
# tpa:langtell/langtell_64: tphere accepted(to requester)