# @parent function: tpa:back/get, tpa:back/del
# Python Style: 
#  temp.back_got: compound = {}
#  temp.back: list[compound] = back
#  back = []
#  i = temp.back.__len__()
#  while i > 0:
#      _back = temp.back[0]
#      if _back.id == tpa.player_id[@s]:
#             temp.back_got = _back
#       else:
#             back.append(back_)
#      del temp.back[0]
#      i -= 1

execute store result score #id tpa.variables run data get storage tpa:tpa temp.back[0].id
execute if score #id tpa.variables = @s tpa.player_id run data modify storage tpa:tpa temp.back_got set from storage tpa:tpa temp.back[0]
execute unless score #id tpa.variables = @s tpa.player_id run data modify storage tpa:tpa back append from storage tpa:tpa temp.back[0]

# del temp.back[0]
data remove storage tpa:tpa temp.back[0]

# while i > 0
execute if data storage tpa:tpa temp.back[0] run function tpa:back/iter_pos