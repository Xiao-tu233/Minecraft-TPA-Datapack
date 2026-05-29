# Parent function: tpa:options

tellraw @s "下方设置为高级设置，请勿随意修改，除非你知道自己在做什么"

execute if score #uses_tick_scheduling tpa.config matches 1 run tellraw @s ["  ", {"text": "是否使用/schedule指令调用Tick函数", "color": "aqua"}, ": ", {"text": "§a启用§r"}]
execute if score #uses_tick_scheduling tpa.config matches 0 run tellraw @s ["  ", {"text": "是否使用/schedule指令调用Tick函数", "color": "aqua"}, ": ", {"text": "§c禁用§r"}]
tellraw @s ["  §6- ", {"text": "§r[§a启用§r", "clickEvent":{"action":"run_command","value":"/scoreboard players set #uses_tick_scheduling tpa.config 1"}},"|",{"text": "§c禁用§r]", "clickEvent":{"action":"run_command","value":"/scoreboard players set #uses_tick_scheduling tpa.config 0"}}]

execute if score #uses_string_dimension tpa.config matches 1 run tellraw @s ["  ", {"text": "是否识别字符串维度", "color": "aqua", "hoverEvent": {"action": "show_text", "value": {"text": "§b在下方选择§a用字符串储存维度1.16+(启用) §6抑或是 §c用整型储存维度1.16-(禁用)"}}}, ": ", {"text": "§a启用§r"}]
execute if score #uses_string_dimension tpa.config matches 0 run tellraw @s ["  ", {"text": "是否识别字符串维度", "color": "aqua", "hoverEvent": {"action": "show_text", "value": {"text": "§b在下方选择§a用字符串储存维度1.16+(启用) §6抑或是 §c用整型储存维度1.16-(禁用)"}}}, ": ", {"text": "§c禁用§r"}]
tellraw @s ["  §6- ", {"text": "§r[§a启用§r", "clickEvent":{"action":"run_command","value":"/scoreboard players set #uses_string_dimension tpa.config 1"}},"|",{"text": "§c禁用§r]", "clickEvent":{"action":"run_command","value":"/scoreboard players set #uses_string_dimension tpa.config 0"}}]

tellraw @s ["  ", {"text": "已兼容维度", "color": "aqua", "hoverEvent": {"action": "show_text", "value": {"text": "§b在下方设置按钮打开§a维度兼容§6菜单 §b同时右侧的数字会是目前已兼容的维度数量"}}}, ": ", {"score":{"name":"#dimension","objective":"tpa.config"}, "color": "white", "hoverEvent": {"action": "show_text", "value": [{"text": "§b服务器目前兼容了 "}, {"score":{"name":"#dimension","objective":"tpa.config"}, "color": "white"}, {"text": " 个维度"}]}}]
tellraw @s ["  §6- ", {"text": "§r[§a设置§r]", "clickEvent":{"action":"run_command","value":"/function tpa:dimension/menu"}}]

execute if score #uses_binary_teleport tpa.config matches 1 run tellraw @s ["  ", {"text": "是否使用二分法传送", "color": "aqua", "hoverEvent": {"action": "show_text", "value": {"text": "§b在下方选择§a使用二分法传送(启用) §6抑或是 §c使用锚点传送(禁用)"}}}, ": ", {"text": "§a启用§r"}]
execute if score #uses_binary_teleport tpa.config matches 0 run tellraw @s ["  ", {"text": "是否使用二分法传送", "color": "aqua", "hoverEvent": {"action": "show_text", "value": {"text": "§b在下方选择§a使用二分法传送(启用) §6抑或是 §c使用锚点传送(禁用)"}}}, ": ", {"text": "§c禁用§r"}]
tellraw @s ["  §6- ", {"text": "§r[§a启用§r", "clickEvent":{"action":"run_command","value":"/scoreboard players set #uses_binary_teleport tpa.config 1"}},"|",{"text": "§c禁用§r]", "clickEvent":{"action":"run_command","value":"/scoreboard players set #uses_binary_teleport tpa.config 0"}}]

tellraw @s ["  ", {"text": "模拟距离", "color": "aqua", "hoverEvent": {"action": "show_text", "value": {"text": "§b在下方更改§a模拟距离 §r(§6单位: 区块§r)  请在点击前保证主世界原点模拟距离内没有玩家"}}}, ": ", {"score":{"name":"#sim_dist","objective":"tpa.config"}, "color": "white"}]
tellraw @s ["  §6- ", {"text": "§r[§a设置§r]", "clickEvent":{"action":"suggest_command","value":"/scoreboard players set #sim_dist tpa.config "}}, " ", {"text": "[§a计算§r]", "clickEvent":{"action":"run_command","value":"/function tpa:teleport/cal_sim_dist"}}]

tellraw @s ["  ", {"text": "寻找传送锚点的重试次数", "color": "aqua", "hoverEvent": {"action": "show_text", "value": {"text": "§b在下方更改§a寻找传送锚点的重试次数 §r(§6单位: 次 §r或 §6游戏刻/运行频率 §r), §b调节过大会延长等待, 过小可能导致锚点误判或污染"}}}, ": ", {"score":{"name":"#anchor_search_retries","objective":"tpa.config"}, "color": "white"}]
tellraw @s ["  §6- ", {"text": "§r[§a设置§r]", "clickEvent":{"action":"suggest_command","value":"/scoreboard players set #anchor_search_retries tpa.config "}}]

tellraw @s ["  ", {"text": "传送锚点最大召唤尝试次数", "color": "aqua", "hoverEvent": {"action": "show_text", "value": {"text": "§b在下方更改§a传送锚点最大召唤尝试次数 §r(§6单位: 次§r) §b调节过大会增加卡顿和无效等待, 过小可能导致传送频繁失败"}}}, ": ", {"score":{"name":"#max_anchor_summons_attempts","objective":"tpa.config"}, "color": "white"}]
tellraw @s ["  §6- ", {"text": "§r[§a设置§r]", "clickEvent":{"action":"suggest_command","value":"/scoreboard players set #max_anchor_summons_attempts tpa.config "}}]
