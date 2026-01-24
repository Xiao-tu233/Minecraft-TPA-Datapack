# Called by: (Player) Any Operator
#! Never forget to edit tpa:initialize after adding option here

tellraw @s [{"text": "======================§bTPA§6 设置菜单§r====================="}]
tellraw @s [{"text": "请在下方调整设置: (需重新呼出菜单以查看更改)"}]

tellraw @s ["  ", {"text": "数据包版本", "color": "aqua"}, ": ", {"text": "2.0.6", "color": "green"}]
tellraw @s ["  ", {"text": "据包文件兼容的游戏版本", "color": "aqua"}, ": ", {"text": "1.13 - 1.14.4", "color": "green"}]
tellraw @s ["  ", {"text": "当前检测到的游戏版本", "color": "aqua"}, ": ", {"text": "1.13 - 1.14.4", "color": "green"}]

execute if score #debug_mode tpa.config matches 1 run tellraw @s ["  ", {"text": "调试模式", "color": "aqua"}, ": ", {"text": "§a启用§r"}]
execute if score #debug_mode tpa.config matches 0 run tellraw @s ["  ", {"text": "调试模式", "color": "aqua"}, ": ", {"text": "§c禁用§r"}]
tellraw @s ["      §6- ", {"text": "§r[§a启用§r", "clickEvent":{"action":"run_command","value":"/scoreboard players set #debug_mode tpa.config 1"}},"|",{"text": "§c禁用§r]", "clickEvent":{"action":"run_command","value":"/scoreboard players set #debug_mode tpa.config 0"}}]

execute if score #tp_spec tpa.config matches 1 run tellraw @s ["  ", {"text": "允许传送旁观者", "color": "aqua"}, ": ", {"text": "§a启用§r"}]
execute if score #tp_spec tpa.config matches 0 run tellraw @s ["  ", {"text": "允许传送旁观者", "color": "aqua"}, ": ", {"text": "§c禁用§r"}]
tellraw @s ["      §6- ", {"text": "§r[§a启用§r", "clickEvent":{"action":"run_command","value":"/scoreboard players set #tp_spec tpa.config 1"}},"|",{"text": "§c禁用§r]", "clickEvent":{"action":"run_command","value":"/scoreboard players set #tp_spec tpa.config 0"}}]

execute if score #compact_ids tpa.config matches 1 run tellraw @s ["  ", {"text": "是否在玩家离线后移除编号空位", "color": "aqua"}, ": ", {"text": "§a启用§r"}]
execute if score #compact_ids tpa.config matches 0 run tellraw @s ["  ", {"text": "是否在玩家离线后移除编号空位", "color": "aqua"}, ": ", {"text": "§c禁用§r"}]
tellraw @s ["      §6- ", {"text": "§r[§a启用§r", "clickEvent":{"action":"run_command","value":"/scoreboard players set #compact_ids tpa.config 1"}},"|",{"text": "§c禁用§r]", "clickEvent":{"action":"run_command","value":"/scoreboard players set #compact_ids tpa.config 0"}}]

execute if score #carpet_fake_player_fix tpa.config matches 1 run tellraw @s ["  ", {"text": "Carpet模组假人修复", "color": "aqua"}, ": ", {"text": "§a启用§r"}]
execute if score #carpet_fake_player_fix tpa.config matches 0 run tellraw @s ["  ", {"text": "Carpet模组假人修复", "color": "aqua"}, ": ", {"text": "§c禁用§r"}]
tellraw @s ["      §6- ", {"text": "§r[§a启用§r", "clickEvent":{"action":"run_command","value":"/function tpa:fake_player/disable"}},"|",{"text": "§c禁用§r]", "clickEvent":{"action":"run_command","value":"/scoreboard players set #carpet_fake_player_fix tpa.config 0"}}]

execute if score #back tpa.config matches 1 run tellraw @s ["  ", {"text": "禁止玩家返回上一位置", "color": "aqua"}, ": ", {"text": "§a启用§r"}]
execute if score #back tpa.config matches 0 run tellraw @s ["  ", {"text": "禁止玩家返回上一位置", "color": "aqua"}, ": ", {"text": "§c禁用§r"}]
tellraw @s ["      §6- ", {"text": "§r[§a启用§r", "clickEvent":{"action":"run_command","value":"/scoreboard players set #back tpa.config 1"}},"|",{"text": "§c禁用§r]", "clickEvent":{"action":"run_command","value":"/scoreboard players set #back tpa.config 0"}}]

execute if score #search_id tpa.config matches 1 run tellraw @s ["  ", {"text": "是否禁用搜索ID", "color": "aqua"}, ": ", {"text": "§a启用§r"}]
execute if score #search_id tpa.config matches 0 run tellraw @s ["  ", {"text": "是否禁用搜索ID", "color": "aqua"}, ": ", {"text": "§c禁用§r"}]
tellraw @s ["      §6- ", {"text": "§r[§a启用§r", "clickEvent":{"action":"run_command","value":"/scoreboard players set #search_id tpa.config 1"}},"|",{"text": "§c禁用§r]", "clickEvent":{"action":"run_command","value":"/scoreboard players set #search_id tpa.config 0"}}]

execute if score #book tpa.config matches 1 run tellraw @s ["  ", {"text": "禁止玩家使用传送书", "color": "aqua"}, ": ", {"text": "§a启用§r"}]
execute if score #book tpa.config matches 0 run tellraw @s ["  ", {"text": "禁止玩家使用传送书", "color": "aqua"}, ": ", {"text": "§c禁用§r"}]
tellraw @s ["      §6- ", {"text": "§r[§a启用§r", "clickEvent":{"action":"run_command","value":"/scoreboard players set #book tpa.config 1"}},"|",{"text": "§c禁用§r]", "clickEvent":{"action":"run_command","value":"/scoreboard players set #book tpa.config 0"}}]

execute if score #player_lang tpa.config matches 1 run tellraw @s ["  ", {"text": "是否允许玩家语言选择", "color": "aqua"}, ": ", {"text": "§a启用§r"}]
execute if score #player_lang tpa.config matches 0 run tellraw @s ["  ", {"text": "是否允许玩家语言选择", "color": "aqua"}, ": ", {"text": "§c禁用§r"}]
tellraw @s ["      §6- ", {"text": "§r[§a启用§r", "clickEvent":{"action":"run_command","value":"/scoreboard players set #player_lang tpa.config 1"}},"|",{"text": "§c禁用§r]", "clickEvent":{"action":"run_command","value":"/scoreboard players set #player_lang tpa.config 0"}}]

execute if score #stricter_book_check tpa.config matches 1 run tellraw @s ["  ", {"text": "更严格的传送书检测", "color": "aqua"}, ": ", {"text": "§a启用§r"}]
execute if score #stricter_book_check tpa.config matches 0 run tellraw @s ["  ", {"text": "更严格的传送书检测", "color": "aqua"}, ": ", {"text": "§c禁用§r"}]
tellraw @s ["  §6- ", {"text": "§r[§a启用§r", "clickEvent":{"action":"run_command","value":"/function tpa:book/track/enable"}},"|",{"text": "§c禁用§r]", "clickEvent":{"action":"run_command","value":"/scoreboard players set #stricter_book_check tpa.config 0"}}]

# non-boolean values part:
tellraw @s ["  ", {"text": "服务器语言", "color": "aqua", "hoverEvent": {"action": "show_text", "value": {"text": "§b在下方进入语言选择菜单"}}}, ": ", {"text": "简体中文(中国大陆)", "color": "white"}]
tellraw @s ["      §6- ", {"text": "§r[§a设置§r]", "clickEvent":{"action":"run_command","value":"/function tpa:option_lang_menu"}}]
tellraw @s ["  ", {"text": "拥有传送点的个数", "color": "aqua", "hoverEvent": {"action": "show_text", "value": {"text": "§b在下方更改§a拥有传送点的个数 §r(§6单位: 个§r), §b填0来设置禁止传送点 §b填-1来设置不限制传送点的数量(不推荐)"}}}, ": ", {"score":{"name":"#home","objective":"tpa.config"}, "color": "white"}]
tellraw @s ["      §6- ", {"text": "§r[§a设置§r]", "clickEvent":{"action":"suggest_command","value":"/scoreboard players set #home tpa.config "}}]
tellraw @s ["  ", {"text": "传送坐标允许半径", "color": "aqua", "hoverEvent": {"action": "show_text", "value": {"text": "§b在下方更改§a传送坐标允许半径 §r(§6单位: 米§r), §b填0来设置禁止传送 §b填-1来设置不限制半径(不推荐)"}}}, ": ", {"score":{"name":"#tp_pos","objective":"tpa.config"}, "color": "white"}]
tellraw @s ["      §6- ", {"text": "§r[§a设置§r]", "clickEvent":{"action":"suggest_command","value":"/scoreboard players set #tp_pos tpa.config "}}]
tellraw @s ["  ", {"text": "传送坐标冷却时间", "color": "aqua", "hoverEvent": {"action": "show_text", "value": {"text": "§b在下方更改§a冷却时间 §r(§6单位: 1 游戏刻 = 1/20 秒§r), §b填0来设置无冷却 §b填-1来设置禁止传送"}}}, ": ", {"score":{"name":"#tp_pos_cooldown","objective":"tpa.config"}, "color": "white"}]
tellraw @s ["      §6- ", {"text": "§r[§a设置§r]", "clickEvent":{"action":"suggest_command","value":"/scoreboard players set #tp_pos_cooldown tpa.config "}}]
tellraw @s ["  ", {"text": "传送请求超时时间", "color": "aqua", "hoverEvent": {"action": "show_text", "value": {"text": "§b在下方更改§a传送请求超时时间 §r(§6单位: 1 游戏刻 = 1/20 秒§r), §b填0来设置禁止传送 §b填-1来设置永不超时"}}}, ": ", {"score":{"name":"#time_out","objective":"tpa.config"}, "color": "white"}]
tellraw @s ["      §6- ", {"text": "§r[§a设置§r]", "clickEvent":{"action":"suggest_command","value":"/scoreboard players set #time_out tpa.config "}}]
tellraw @s ["  ", {"text": "§bID修复冷却时间", "color": "aqua", "hoverEvent": {"action": "show_text", "value": {"text": "§b在下方更改§aID修复冷却时间 §r(§6单位: 1 游戏刻 = 1/20 秒§r), §b填0来设置无冷却 填-1来设置禁止ID修复"}}}, ": ", {"score":{"name":"#idfix_cooldown","objective":"tpa.config"}, "color": "white"}]
tellraw @s ["      §6- ", {"text": "§r[§a设置§r]", "clickEvent":{"action":"suggest_command","value":"/scoreboard players set #idfix_cooldown tpa.config "}}]
tellraw @s ["  ", {"text": "公共传送点", "color": "aqua", "hoverEvent": {"action": "show_text", "value": {"text": "§b在下方设置按钮打开§a公共传送点§6菜单 §b同时右侧的数字会是目前已经设置的公共传送点数量"}}}, ": ", {"score":{"name":"#warp","objective":"tpa.config"}, "color": "white", "hoverEvent": {"action": "show_text", "value": [{"text": "§b服务器目前设置了 "}, {"score":{"name":"#warp","objective":"tpa.config"}, "color": "white"}, {"text": "§b 个公共传送点"}]}}]
tellraw @s ["  §6- ", {"text": "§r[§a设置§r]", "clickEvent":{"action":"run_command","value":"/function tpa:warp/option"}}]
tellraw @s ["  ", {"text": "数据包运行频率", "color": "aqua", "hoverEvent": {"action": "show_text", "value": {"text": "§b在下方更改§a数据包运行频率 §r(§6单位: 1 游戏刻 = 1/20 秒§r), §b填0来禁止数据包运行"}}}, ": ", {"score":{"name":"#frequency","objective":"tpa.config"}, "color": "white"}]
tellraw @s ["      §6- ", {"text":"[§a20 Hz§r","clickEvent":{"action":"run_command","value":"/scoreboard players set #frequency tpa.config 20"}},"|",{"text":"§a10 Hz§r","clickEvent":{"action":"run_command","value":"/scoreboard players set #frequency tpa.config 10"}},"|",{"text":"§a5 Hz§r","clickEvent":{"action":"run_command","value":"/scoreboard players set #frequency tpa.config 5"}},"|",{"text":"§a4 Hz§r", "clickEvent": {"action": "run_command", "value": "/scoreboard players set #frequency tpa.config 4"}},"|",{"text":"§a2 Hz§r","clickEvent":{"action":"run_command","value":"/scoreboard players set #frequency tpa.config 2"}},"|",{"text":"§a1 Hz§r","clickEvent":{"action":"run_command","value":"/scoreboard players set #frequency tpa.config 1"}},"|",{"text": "§c禁用§r]","clickEvent":{"action":"run_command","value":"/scoreboard players set #frequency tpa.config 0"}}]

execute if score #debug_mode tpa.config matches 0 run tellraw @s ["  打开调试模式以调节更多设置(高级设置)"]
execute if score #debug_mode tpa.config matches 1 run function tpa:options_advenced

tellraw @s [{"text": "[§4卸载§r]","clickEvent":{"action":"run_command","value":"/function tpa:uninstall"},"hoverEvent":{"action":"show_text","value":{"text": "§4点击此按钮来§l§n卸载§r§4TPA数据包! 请考虑你是否真的需要!"}}}," ", {"text": "[§4更新§r]","clickEvent":{"action":"run_command","value":"/function tpa:update"},"hoverEvent":{"action":"show_text","value":{"text": "§b点击开始更新数据包"}}}," ",{"text": "[§4协议§r]","clickEvent":{"action":"run_command","value":"/function tpa:license"},"hoverEvent":{"action":"show_text","value":{"text": "§b使用 TPA 数据包时请遵循我们在 GitHub 上开源协议. §b同时, 作者§l§n不建议§r§b将本数据包用于§l§n商业用途§r§b的服务器. §b为避免误解, 请您在使用前仔细阅读并理解完整协议内容. "}}}, " ", {"text": "[§4帮助§r]","clickEvent":{"action":"run_command","value":"/function tpa:help"},"hoverEvent":{"action":"show_text","value":{"text": "§b点击打开帮助菜单"}}}, " ", {"text": "[§4无法运行§r]","clickEvent":{"action":"run_command","value":"/function tpa:tick_not_working"},"hoverEvent":{"action":"show_text","value":{"text": "§b当遇到tick函数无法运行(TPA菜单无法打开)时请点击"}}}]
tellraw @s ["====================================================="]

# " §6睡眠模式 唤醒时长: ",# {"text":"[§a设置§r]",# "hoverEvent":{"action":"show_text","value":{"text":"§b点击更改§a睡眠模式 唤醒时长 §r(§6单位: 1 游戏刻 = 1/20 秒§r), \n§b填0来设置仅启用基础功能 填-1来设置禁用休眠模式 "}},# "clickEvent":{"action":"suggest_command","value":"/scoreboard players set #sleep_mode tpa.config "}}," \n",
