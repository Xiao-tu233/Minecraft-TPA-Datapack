execute as @a if score @s tpa matches 1 run function tpa:iddisplay
execute as @a[scores={language=0}] if score @s tpa = @s player_id run tellraw @s ["[§bTPA§r] You can't teleport to yourself."]
execute as @a[scores={language=1}] if score @s tpa = @s player_id run tellraw @s ["[§bTPA§r] 你不能tp你自己."]
execute as @a[scores={language=2}] if score @s tpa = @s player_id run tellraw @s ["[§bTPA§r] 你不能tp你自己."]
execute as @a unless score @s tpa = @s player_id if score @s tpa matches 2..21 run scoreboard players operation @s tp_to = @s tpa
execute as @a[scores={tpa=2..21}] run scoreboard players enable @s tp_to
execute as @a[scores={language=0}] unless score @s tpa = @s player_id if score @s tpa matches 2..21 run tellraw @s ["[§bTPA§r] You sent a teleport request. Waiting for him to accept. ",{"text":"[§4Cancel§r]","clickEvent":{"action":"run_command","value":"/trigger tp_to set 0"},"hoverEvent":{"action":"show_text","value":{"text":"§bCancel teleport request"}}}]
execute as @a[scores={language=1}] unless score @s tpa = @s player_id if score @s tpa matches 2..21 run tellraw @s ["[§bTPA§r] 你发送了一个传送请求. 等待他接受. ",{"text":"[§4取消§r]","clickEvent":{"action":"run_command","value":"/trigger tp_to set 0"},"hoverEvent":{"action":"show_text","value":{"text":"§b取消传送请求"}}}]
execute as @a[scores={language=2}] unless score @s tpa = @s player_id if score @s tpa matches 2..21 run tellraw @s ["[§bTPA§r] 你發送了一個傳送請求. 等待他接受 ",{"text":"[§4取消§r]","clickEvent":{"action":"run_command","value":"/trigger tp_to set 0"},"hoverEvent":{"action":"show_text","value":{"text":"§b取消傳送請求"}}}]

execute as @a run execute as @s[scores={tpaccept=-1..1}] run scoreboard players operation @s accept = @s tpaccept
execute as @a[scores={tpaccept=2..3}] run function tpa:toggletpa
execute as @a if score @s tpa matches 2..21 unless score @s player_id = @s tpa run scoreboard players operation @s req = @s tpa
execute as @a run execute as @s[scores={tpaccept=-1..1}] run function tpa:recvreq
execute as @a[scores={accept=1}] run execute as @a[scores={tp_to=2..21}] run function tpa:tp/tp1
execute as @a[scores={accept=-1}] run execute as @a[scores={tp_to=2..21}] run function tpa:tpadeny/tp1

execute as @a run scoreboard players set @s tpa 0
execute as @a run scoreboard players set @s[scores={tpaccept=-1..1}] accept 0

function tpa:canttpaccept