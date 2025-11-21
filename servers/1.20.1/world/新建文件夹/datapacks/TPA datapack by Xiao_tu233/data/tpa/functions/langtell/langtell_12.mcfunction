#> tpa:langtell/langtell_12.mcfunction
execute if score #debug_mode tpa_config matches 1 run tellraw @a "[§bTPA§r] §6 Debug: §rNow executing: §atpa:langtell/langtell_12"
playsound minecraft:entity.player.levelup ambient @s[scores={mute=0}]
execute as @s[scores={language=0}] run tellraw @s "=======================§bTPA§6 Help Menu§r======================"
execute as @s[scores={language=0}] run tellraw @s "[§bTPA§r] Use /trigger tpa to sent your tpa request and opt options."
execute as @s[scores={language=0}] run tellraw @s "[§bTPA§r] Modify back, always-accept, language and idfix in tpa menu."
execute as @s[scores={language=0}] run tellraw @s "[§bTPA§r] For operators, use /function tpa:options to change the configs."
execute as @s[scores={language=0}] run tellraw @s "[§bTPA§r] If you meet the problem, "
execute as @s[scores={language=0}] run tellraw @s "[§bTPA§r] which there're 2 players who were given a same player id, you can try id fix in tpa menu."
execute as @s[scores={language=0}] run tellraw @s "[§bTPA§r] id fix will reset all the ids of players."
execute as @s[scores={language=0}] run tellraw @s "[§bTPA§r] If you don't know someone's id who you've already known his name, use search id in tpa menu."
execute as @s[scores={language=0}] run tellraw @s "[§bTPA§r] If you want to go back to where you were teleported from, use /trigger back"
execute as @s[scores={language=0}] run tellraw @s "[§bTPA§r] If you think the sound is annoying, find mute datapack in tpa menu."
execute as @s[scores={language=0}] run tellraw @s "[§bTPA§r] If you want someone to be where you're, Use /trigger tpahere."
execute as @s[scores={language=0}] run tellraw @s ["======================( ", {"text":"§b<§r","clickEvent":{"action":"run_command","value":"/trigger help set 1"},"hoverEvent":{"action":"show_text","value":{"text":"§bShow previous page(1/2)"}}}, " 2/2 ", {"text":"§b>§r","hoverEvent":{"action":"show_text","value":{"text":"§bNo next page."}}}, " )======================"]

execute as @s[scores={language=1}] run tellraw @s "======================§bTPA§6 帮助菜单§r====================="
execute as @s[scores={language=1}] run tellraw @s "[§bTPA§r] 使用 /trigger tpa 来发送你的传送请求和设置选项"
execute as @s[scores={language=1}] run tellraw @s "[§bTPA§r] 在tpa界面中调整back, 自动接受, 语言和ID修复."
execute as @s[scores={language=1}] run tellraw @s "[§bTPA§r] 对于操作员(OP), 使用 /function tpa:options 来更改配置. "
execute as @s[scores={language=1}] run tellraw @s "[§bTPA§r] 如果你遇到两个相同玩家拥有同一id的问题,"
execute as @s[scores={language=1}] run tellraw @s "[§bTPA§r] 你可以尝试id修复, 此修复会重置所有玩家的id."
execute as @s[scores={language=1}] run tellraw @s "[§bTPA§r] 如果你想知道某人的数据包id但你只知道他的游戏id, 在tpa菜单中使用寻找id."
execute as @s[scores={language=1}] run tellraw @s "[§bTPA§r] 如果你想返回你上次传送的位置, 使用/trigger back"
execute as @s[scores={language=1}] run tellraw @s "[§bTPA§r] 如果你觉得数据包音效有点烦, 你可以在tpa菜单里静音数据包."
execute as @s[scores={language=1}] run tellraw @s "[§bTPA§r] 如果你想要某个人传送到你这里, 使用/trigger tpahere"
execute as @s[scores={language=1}] run tellraw @s ["======================( ", {"text":"§b<§r","clickEvent":{"action":"run_command","value":"/trigger help set 1"},"hoverEvent":{"action":"show_text","value":{"text":"§b查看上一页(1/2)"}}}, " 2/2 ", {"text":"§b>§r","hoverEvent":{"action":"show_text","value":{"text":"§b这是最后一页."}}}, " )======================"]


execute as @s[scores={language=2}] run tellraw @s "======================§bTPA§6 幫助選單§r====================="
execute as @s[scores={language=2}] run tellraw @s "[§bTPA§r] 使用 /trigger tpa 來發送你的傳送請求和設定選項."
execute as @s[scores={language=2}] run tellraw @s "[§bTPA§r] 在tpa界面中調整back, 自動接受, 語言和ID修復."
execute as @s[scores={language=2}] run tellraw @s "[§bTPA§r] 對於管理員, 使用 /function tpa:options 來更改配置. "
execute as @s[scores={language=2}] run tellraw @s "[§bTPA§r] 如果你遇到兩個相同玩家擁有同一id的問題, "
execute as @s[scores={language=2}] run tellraw @s "[§bTPA§r] 你可以嘗試id修復, 此修復會重置所有玩家的id."
execute as @s[scores={language=2}] run tellraw @s "[§bTPA§r] 如果你想知道某人的資料包id但你只知道他的遊戲id, 在tpa選單中使用尋找id. "
execute as @s[scores={language=2}] run tellraw @s "[§bTPA§r] 如果你想返回你上次傳送的位置, 使用/trigger back "
execute as @s[scores={language=2}] run tellraw @s "[§bTPA§r] 如果你覺得資料包音效有點吵, 你可以在tpa選單裏靜音資料包."
execute as @s[scores={language=2}] run tellraw @s "[§bTPA§r] 如果你想要某個人傳送到你這裡, 使用/trigger tpahere"
execute as @s[scores={language=2}] run tellraw @s ["======================( ", {"text":"§b<§r","clickEvent":{"action":"run_command","value":"/trigger help set 1"},"hoverEvent":{"action":"show_text","value":{"text":"§b查看上一頁(1/2)"}}}, " 2/2 ", {"text":"§b>§r","hoverEvent":{"action":"show_text","value":{"text":"§b這是最后一頁."}}}, " )======================"]

#custom language here
execute as @s[scores={language=3}] run tellraw @s "================§bTPA§6 <Text here>§r================"
execute as @s[scores={language=3}] run tellraw @s "[§bTPA§r] <Text here>"
execute as @s[scores={language=3}] run tellraw @s ["======================( ", {"text":"§b<§r","clickEvent":{"action":"run_command","value":"/trigger help set 1"},"hoverEvent":{"action":"show_text","value":{"text":"§<Text here>(1/2)"}}}, " 2/2 ", {"text":"§b>§r","hoverEvent":{"action":"show_text","value":{"text":"§b<Text here>"}}}, " )======================"]
