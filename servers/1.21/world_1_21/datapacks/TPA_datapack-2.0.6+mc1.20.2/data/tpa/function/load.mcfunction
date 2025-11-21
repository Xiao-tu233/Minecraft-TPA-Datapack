# TPA load function: run when datapack loads

scoreboard objectives remove tpa.variables
scoreboard objectives add tpa.variables dummy
scoreboard objectives add tpa.config dummy
execute unless score #version tpa.config matches 206 run function tpa:initialize

# Load language file
scoreboard players operation #target_lang tpa.variables = #language tpa.config
function tpa:load_lang

tellraw @a [{"storage": "tpa:tpa", "nbt": "loaded_lang.header"}, {"storage": "tpa:tpa", "nbt": "loaded_lang.load_title"}]

tellraw @a [{"storage": "tpa:tpa", "nbt": "loaded_lang.header"}, {"storage": "tpa:tpa", "nbt": "loaded_lang.load_add_objectives"}]
scoreboard objectives add tpa trigger
scoreboard objectives add back trigger
scoreboard objectives add tpaccept trigger
scoreboard objectives add tpa.help trigger
scoreboard objectives add tpa.tpaccept trigger
scoreboard objectives add tpa.tpaccept_toggle trigger
scoreboard objectives add tpa.tpa trigger
scoreboard objectives add tpa.tp_to dummy
scoreboard objectives add tpa.tpahere trigger
scoreboard objectives add tpa.simple_menu trigger
scoreboard objectives add tpa.tp_here dummy
scoreboard objectives add tpa.cancel_req trigger
scoreboard objectives remove tpa.player_id
scoreboard objectives add tpa.player_id dummy
scoreboard objectives add tpa.uid dummy
scoreboard objectives add tpa.is_online dummy
scoreboard objectives add tpa.spec dummy
scoreboard objectives add tpa.idfix trigger
scoreboard objectives add tpa.idfix_cd dummy
scoreboard objectives add tpa.back trigger
scoreboard objectives add tpa.extended_menu trigger
scoreboard objectives add tpa.mute trigger
scoreboard objectives add tpa.output trigger
scoreboard objectives add tpa.search_id trigger
scoreboard objectives add tpa.search_id.key trigger
scoreboard objectives add tpa.search_id.capslock dummy
scoreboard objectives add tpa.req_timer dummy
scoreboard objectives add tpa.if_death deathCount
scoreboard objectives add tpa.if_online dummy
scoreboard objectives add tpa.book trigger
scoreboard objectives add tpa.pos trigger
scoreboard objectives add tpa.pos.x trigger
scoreboard objectives add tpa.pos.y trigger
scoreboard objectives add tpa.pos.z trigger
scoreboard objectives add tpa.pos.x_temp dummy
scoreboard objectives add tpa.pos.y_temp dummy
scoreboard objectives add tpa.pos.z_temp dummy
scoreboard objectives add tpa.pos_cd dummy
scoreboard objectives add tpa.here trigger
scoreboard objectives add tpa.sethome trigger
scoreboard objectives add tpa.home trigger
scoreboard objectives add home trigger
scoreboard objectives add tpa.removehome trigger
scoreboard objectives add tpa.language trigger
scoreboard objectives add tpa.lang_temp dummy
scoreboard objectives add tpa.warp trigger
# scoreboard objectives add tpa.head_gestures dummy
# scoreboard objectives add tpa.yaw dummy
# scoreboard objectives add tpa.pitch dummy
# scoreboard objectives add tpa.yaw.origin dummy
# scoreboard objectives add tpa.pitch.origin dummy
# scoreboard objectives add tpa.first_extreme dummy
# scoreboard objectives add tpa.second_extreme dummy
# scoreboard objectives add tpa.hg.interval_timer dummy
# scoreboard objectives add tpa.hg.sequence_timer dummy
tellraw @a [{"storage": "tpa:tpa", "nbt": "loaded_lang.header"}, {"storage": "tpa:tpa", "nbt": "loaded_lang.load_added_objectives"}]
tellraw @a [{"storage": "tpa:tpa", "nbt": "loaded_lang.header"}, {"storage": "tpa:tpa", "nbt": "loaded_lang.load_reset_scores"}]
scoreboard players set #global_current tpa.player_id 2
execute unless score #global_current tpa.uid = #global_current tpa.uid run scoreboard players set #global_current tpa.uid 2
execute if score #compact_ids tpa.config matches 0 run scoreboard players set @a tpa.player_id 1
scoreboard players set @a tpa.tp_to 0
scoreboard players set @a tpa.tp_here 0
scoreboard players set @a tpa.tpaccept 0
scoreboard players set @a tpa.req_timer 0
scoreboard players set @a tpa.if_death 0
scoreboard players set @a tpa.pos 0
scoreboard players set @a tpa.search_id.key 0
scoreboard players set @a tpa.search_id.capslock 0
tellraw @a [{"storage": "tpa:tpa", "nbt": "loaded_lang.header"}, {"storage": "tpa:tpa", "nbt": "loaded_lang.load_did_reset_scores"}]

tellraw @a [{"storage": "tpa:tpa", "nbt": "loaded_lang.header"}, {"storage": "tpa:tpa", "nbt": "loaded_lang.load_init_storage"}]
data modify storage tpa:tpa back set value {}
data remove storage tpa:tpa search_id
data remove storage tpa:tpa book
data remove storage tpa:tpa temp

tellraw @a [{"storage": "tpa:tpa", "nbt": "loaded_lang.header"}, {"storage": "tpa:tpa", "nbt": "loaded_lang.load_initted_storage"}]

tellraw @a [{"storage": "tpa:tpa", "nbt": "loaded_lang.header"}, {"storage": "tpa:tpa", "nbt": "loaded_lang.load_remove_tags"}]
tag @a remove not_match
tag @a remove to_modify
tag @a remove id
kill @e[type=text_display, tag=tpa.license_displayer]
tellraw @a [{"storage": "tpa:tpa", "nbt": "loaded_lang.header"}, {"storage": "tpa:tpa", "nbt": "loaded_lang.load_removed_tags"}]

tellraw @a [{"storage": "tpa:tpa", "nbt": "loaded_lang.header"}, {"storage": "tpa:tpa", "nbt": "loaded_lang.load_init_vars"}]
# constants
scoreboard players set #-1 tpa.variables -1
scoreboard players set #2 tpa.variables 2
scoreboard players set #3 tpa.variables 3
scoreboard players set #4 tpa.variables 4
scoreboard players set #5 tpa.variables 5
scoreboard players set #9 tpa.variables 9
scoreboard players set #14 tpa.variables 14
scoreboard players set #20 tpa.variables 20
# Variables initializations
scoreboard players set #commands_not_match tpa.variables 0
scoreboard players set #debug_mode tpa.config 0
execute if score #carpet_fake_player_fix tpa.config matches 0 run tag @a remove tpa.fake_player
tellraw @a [{"storage": "tpa:tpa", "nbt": "loaded_lang.header"}, {"storage": "tpa:tpa", "nbt": "loaded_lang.load_initted_vars"}]

tellraw @a [\
    {"storage": "tpa:tpa", "nbt": "loaded_lang.header"}, {"storage": "tpa:tpa", "nbt": "loaded_lang.load_done"}, {"storage": "tpa:tpa", "nbt": "option.version_range"}, {"storage": "tpa:tpa", "nbt": "loaded_lang.load_done_extra"},\
    {"storage": "tpa:tpa", "nbt": "option.version", "hoverEvent":{"action":"show_text","value":{"storage": "tpa:tpa", "nbt": "loaded_lang.load_version_hoverevent"}}}\
]

# Show the publish date, with local format
function tpa:load_date_format
tellraw @a [\
    {"storage": "tpa:tpa", "nbt": "loaded_lang.header"}, {"storage": "tpa:tpa", "nbt": "loaded_lang.load_date_check_left_part"}, \
    {"storage": "tpa:tpa", "nbt": "temp.option.dates[]", "separator": ""}, "(UTC+8)", {"storage": "tpa:tpa", "nbt": "loaded_lang.load_date_check_right_part"}\
]
tellraw @a [{"storage": "tpa:tpa", "nbt": "loaded_lang.header"}, {"storage": "tpa:tpa", "nbt": "loaded_lang.load_welcome"}]
tellraw @a [{"storage": "tpa:tpa", "nbt": "loaded_lang.header"}, {"storage": "tpa:tpa", "nbt": "loaded_lang.load_copyright_claim"}]
tellraw @a [{"storage": "tpa:tpa", "nbt": "loaded_lang.header"}, {"storage": "tpa:tpa", "nbt": "loaded_lang.load_author"}]
tellraw @a [\
    {"storage": "tpa:tpa", "nbt": "loaded_lang.header"}, " ", \
    {"text":"§9Discord","hoverEvent":{"action":"show_text", "value":"https://discord.gg/QgkpxsFahw"},"clickEvent":{"action":"open_url","value":"https://discord.gg/QgkpxsFahw"}}," • ",\
    {"text":"§cYouTube","hoverEvent":{"action":"show_text", "value":"https://www.youtube.com/channel/UCMOgi9XLPgVjLJRV6-YqQmg"},"clickEvent":{"action":"open_url","value":"https://www.youtube.com/channel/UCMOgi9XLPgVjLJRV6-YqQmg"}}," • ",\
    {"text":"§bBilibili","hoverEvent":{"action":"show_text", "value":"https://space.bilibili.com/433412367"},"clickEvent":{"action":"open_url","value":"https://www.bilibili.com/space/433412367"}}," • ",\
    {"text":"§rQQ群","hoverEvent":{"action":"show_text", "value":"点击复制群号: 814709389"},"clickEvent":{"action":"copy_to_clipboard","value":"814709389"}}, " • ", \
    {"text":"§0Github","hoverEvent":{"action":"show_text", "value":"https://github.com/Xiao-tu233/Minecraft-TPA-Datapack"},"clickEvent":{"action":"open_url","value":"https://github.com/Xiao-tu233/Minecraft-TPA-Datapack"}}\
]
tellraw @a [\
    {"storage": "tpa:tpa", "nbt": "loaded_lang.header"}, \
    {"storage": "tpa:tpa", "nbt": "loaded_lang.load_button_options", "color": "gold", "clickEvent":{"action":"run_command","value":"/function tpa:options"},"hoverEvent":{"action":"show_text","value":{"storage": "tpa:tpa", "nbt": "loaded_lang.load_button_options_hoverevent"}}}," ",\
    {"storage": "tpa:tpa", "nbt": "loaded_lang.load_button_help", "color": "gold", "clickEvent":{"action":"run_command","value":"/function tpa:help"},"hoverEvent":{"action":"show_text","value":{"storage": "tpa:tpa", "nbt": "loaded_lang.load_button_help_hoverevent"}}}," ",\
    {"storage": "tpa:tpa", "nbt": "loaded_lang.load_button_update", "color": "gold", "clickEvent":{"action":"run_command","value":"/function tpa:update"},"hoverEvent":{"action":"show_text","value":{"storage": "tpa:tpa", "nbt": "loaded_lang.load_button_update_hoverevent"}}}," ",\
    {"storage": "tpa:tpa", "nbt": "loaded_lang.load_button_license", "color": "gold", "clickEvent":{"action":"run_command","value":"/function tpa:license"},"hoverEvent":{"action":"show_text","value":{"storage": "tpa:tpa", "nbt": "loaded_lang.load_button_license_hoverevent"}}}]

execute unless score #language tpa.config matches 1.. run tellraw @a [{"storage": "tpa:tpa", "nbt": "loaded_lang.header"}, "检测到默认语言未设置, 请点击下方设置TPA数据包的服务器默认语言 | Detected Default language is not set, please click below to set default server language of TPA datapack:  ", {"text": "[§a设置 | Set§r]", "clickEvent": {"action": "run_command", "value": "/function tpa:option_lang_menu"}}]
function tpa:dimension/refresh

# Call the tick function if the option is enabled
execute if score #uses_tick_scheduling tpa.config matches 1 run function tpa:tick

#! 超级大饼:    
# - public tp spot (warp) §aOK
#     - Every warp contains: Warp Position(xyz, dimension), Warp Name(Show before teleport button), Warp ID(Number), Warp Description(Optional but recommended, show when hover the warp name)
#     - Dicide: Show warps in 传送点菜单 or a independent warp menu? §aOK
#     - For the first index of the warp list, make the first compound stores the lang for options.warp §aOK
#     - Realize [Move Up] [Move Down] §aOK
#     - Make dimensions customized(Add option: dimensions) §aOK
# - Optimize the code structure §aOK
# - Check if scoreboard objectives tpa is already exists to see if the other TPA datapack is installed §cNot Necessary
# - Update & Uninstall langauge supportive §aOK
# - Not using the Vanilla tick interface, instead use schedule function §aOK
# - Make the req timer ticks in the time_out function §aOK
#! - Use text component after scoreboard objectives declares §c Only static text components supported so achieving in 1.15- and light version
#   Translated sample texts are below:
#   - scoreboard_tpa: "TPA菜单/传送请求目标"
#   - scoreboard_back: "返回上一位置"
#   - scoreboard_tpaccept: "接受请求/自动接受"
#   - scoreboard_tpa_help: "帮助"
#   - scoreboard_tpa_tpaccept: "接受请求"
#   - scoreboard_tpa_tpaccept_toggle: "自动接受"
#   - scoreboard_tpa_tpa: "传送请求目标"
#   - scoreboard_tpa_tpahere: "传送此处请求目标"
#   - scoreboard_tpa_simple_menu: "简易菜单"
#   - scoreboard_tpa_cancel_req: "取消请求"
#   - scoreboard_tpa_idfix: "ID修复"
#   - scoreboard_tpa_back: "返回上一位置"
#   - scoreboard_tpa_extended_menu: "展开菜单"
#   - scoreboard_tpa_mute: "静音"
#   - scoreboard_tpa_output: "输出位置"
#   - scoreboard_tpa_search_id: "搜索ID"
#   - scoreboard_tpa_book: "传送书"
#   - scoreboard_tpa_pos: "传送坐标输入状态"
#   - scoreboard_tpa_pos_x: "传送坐标目标X坐标"
#   - scoreboard_tpa_pos_y: "传送坐标目标Y坐标"
#   - scoreboard_tpa_pos_z: "传送坐标目标Z坐标"
#   - scoreboard_tpa_here: "广播位置"
#   - scoreboard_tpa_sethome: "设置传送点"
#   - scoreboard_tpa_home: "传送传送点"
#   - scoreboard_home: "传送传送点"
#   - scoreboard_tpa_removehome: "移除传送点"
#   - scoreboard_tpa_language: "语言"
#! - Fix home menu doesn't show existing homes(Version:1.21.6+)
#! - Make Key G available on displaying TPA menu
#! - Combining language file into one, translate more languages in extra pack
# - Abandon ingame keyboard as dependency, instead, write it inbuilt datapack in easier way §aOK
# - Re-write Carpet Fake Player detection or even use carpet scripts if problems continue (Problem occurs:  §aOK
#    - Some fake players are spawned by players but insta-kicked by Datapack unexpectedly; 
#    - When Fake Players working at worldpoint, tick function is stopped with entity data exception raising( It may be caused by low TPS situations as well );
#      )
# - Boardcast Position displays red instead of purple in the dimension of the end; §aOK
# - Avoid load lang into temp storage causing polute the storage §aOK
# - Tell to modify configs in client instead of server terminal when server did `/function tpa:options` §aOK
# - Use uid instead of the tag of TPA_user §aOK
# - Use tpahere filefolder to simplify tpa:tpahere §aOK
# - Fix !s will continue to make ids greater and greater: §aOK§r, will also update the whole system in the future.
    # Add also the third mode for compact_ids "混合模式"
    # #compact_ids == Any && #tp_spec == Any && #carpet_fake_player_fix == 0 -> fake: their uid
    # #compact_ids == 1 && #tp_spec == 0 && #carpet_fake_player_fix == 1 -> offline: null; spec, fake: -1
    # #compact_ids == 0 && #tp_spec == 0 && #carpet_fake_player_fix == 1 -> offline: their uid; spec: negative of their uid; fake: -1
    # #compact_ids == 0 && #tp_spec == 1 && #carpet_fake_player_fix == 1 -> offline: their uid; spec: their uid; fake: -1
# - When Server Terminal access `/function tpa:options` or `/function tpa:tick_not_working` console will now return warning msg §aOK
#! - Edit wiki
# - Make tpa.output Default: tellraw & actionbar §aOK
# - Sneak detect need to be detected when using elytra to fly §cVanilla bug
# - Button to choose selected game language in the language menu §cNot Realizable
# - I can req myself §aOK: Caused by accidently deleting of tpa:tpa_conditions
# - Clear TPA book whenever player put that into a container(Not only chests): by achivements §aOK
#    - ^ tpa:book/track_missing
#    - ^ (advancements) tpa:book_container_detect
#    -! For 1.20.4-: tpa:book/set_interaction_context:7:106 generic.block_interaction_range instead of player.block_interaction_range
#                 : tpa:book/track/confiscate_from_entity:5:435 Slot: byte instead of slot: int
#                 : tpa:book/track/confiscate_from_ender_chest:5:435 Slot: byte instead of slot: int
#    -! For Newer version: advencement tpa:book_container_detect, add shelf, #copper_chest
#    - Detect Item dropped when player died instead of dropping for refresh(Distance Detection) §aOK
#    - Use keybind instead of hard code key 'Q', 'F' §cNot Realizable, chat component not supportive
#    -! Maybe make book wearable and craftable for different slots
#    - Detect Block Container (Prevent from detecting the same block for times) §aOK§r, but gave up ray detection
# - Add re-get way when tpabook is turned offhand §aOK
# - If one feature is disabled, show setting button beside to guide the user to enable it. §aOK
# - Make Technic settings defaultly hidden whenever debug mode is enabled, they show. §aOK
#    - Containing: #sequence_timer, #sim_dist, #is_1_16(Rename Needed), #teleport_summon_retried(Rename Needed), #teleport_threshold_retry_summon(Rename Needed), #uses_binary_teleport, Shake or Nod related: #timer_sequence, #detectable_range, ...
# - Frequency will be set to 20 if 0 was set when calling tpa:tick_not_working function. §aOK
# - Make Settings Initialize when version is not correct instead of everytimes. §aOK
#! - 1.15 teleport changes:
#    - Summon visual item of Target instead giving player a target to check the 1.15/1.16 
#    - Make player keeping floating in the midair instead of falling them when chunks are loading
#    - Show Retries Debug infos in action bar instead of chat
# - Make License showed in a text displayer and Button provided for ending reading §aOK
# - Avoid using long target selectors instead, use predicates §aOK
# - Compact with the newest pack.mcmeta format §aOK
# - Show version infos in options like current datapack version, game version §aOK
# - For Chinese-like Languages, use follow translates §aOK
#     Original Name | Short Name(通称) | Formal Name
#     Home          | 家               | (私人)传送点
#     Warp          | 地标             | 公共传送点
# - Add the version post time(UTC) when loaded the datapack right after the datapack version §aOK
# - 考虑 init_language_storage是否要放在 initialize里 §aOK
# - ^ https://docs.mcbookshelf.dev/en/latest/modules/raycast/ Maybe Raycasting usable §aOK
# - Make some menu to be used more convenient, automatically call menu again when editted §aOK
# - Make custom dimension supported, add a new dimension number when which is called §aOK
# - Move some load datas to tpa:tpa options instead of tpa:tpa * §aOK
# - Add a sentence at the end of option that enabling debug mode to modify advenced settings §aOK
# - Show the gray button of [Request Teleport] when player who cannot be requested sent a here §aOK

# TESTS:
# [ ] - mc1.13 on 1.13
# [ ] - mc1.15 on 1.15
# [ ] - mc1.15 on 1.20.1
# [ ] - mc1.20.2 on 1.20.2
# [ ] - mc1.20.2 on 1.20.3
# [ ] - mc1.20.2 on 1.20.5
# [v] - mc1.20.2 on 1.21
# [ ] - mc1.20.2 on 1.21.5
# [ ] - mc1.20.2 on 1.21.6
# [ ] - mc1.20.2 on lastest release

# Futures: (v2.1)
# - Head gestures (Functions are at zhencangthings/datapacks/head_gestures)
#    - Sneak + Head up/down: Agree/Deny
#    - Sneak + Turn around: open menu
#       - Sneak + left/right turn > 30 degs, left/right option
#    - Sneak + Head up for 5 secs: temply disable hg
#       - And then without sneak, down for 3 secs: enable
#    - every gestures should be interface-ized
#    - Tutorial for new players

# - Consider about the color of actionbar
# - For 1.13-1.15 添加虚拟物品实体储存1.15+的 storage tpa:tpa 物品储存位置需要被加载到(玩家位置上空 或 出生点常加载区块)
# - 传送前摇 落地空气检测
#    - 触发保护及延迟机制要基于请求是否是被接收者拖了很久才接 如果发了马上接则不应该触发这些 或者这里的threshold应该允许设置
#    - {
#        "teleport_delay": 3,            // 请求被接受后延迟秒数（设置为0即与原来一致）
#        "interrupt_by_moving": boolean  // 可以禁止透过移动中断传送避免误判 考虑使用视角转向以及按钮 或者使用实体子谓词{type:player, input: *}
#        "may_skip_delay": boolean,      // 允许跳过延迟
#        "safe_mode": "strict",          // 安全检查
#         off	不检测	直接传送（风险最大）
#         basic	检查脚下是否为空气/液体	若不安全则取消传送
#         strict	检查脚下方块可站立、头顶空间可容纳、周围无岩浆/虚空
#     }
# - 加入服务器预设配置 方便不同体量服务器
# - Chest menu
# - Add a snowball menu
#    - If the above one is posible, make Actionbar a screen and player and turn their rotations to control the 光标 in a GUI-like way
# - Update TPA book format, including buttons in TPA menu
# - Use binary format to achieve tp instead of anchors:
#    E.g. Our target x/z is 1000
#     1000 = 0b11 1110 1000
#     So, we run tp ~0b(1*0b10**n) ~ ~ whenever n is 1
#     Real command: ...more larger detects 
#                   execute as @a[scores={...=2..}] run tp @s ~2 ~ ~
#                   execute as @a[scores={...=2..}] run scoreboard players remove @s ... 2
#                   execute as @a[scores={...=1..}] run tp @s ~1 ~ ~
#                   execute as @a[scores={...=1..}] run scoreboard players remove @s ... 1
#     The reason why it can't be a must because we must have the maxinum distance when using binary format.
# - Use more predicts instead of conditions "execute if"
# - Considering use `execute positioned over <heightmap> -> execute: 将执行位置设置为符合特定高度图的一纵列方块的最高的位置。`
# - Consider use tag instead of item customdata to select Visual Items
# - Show specific player acount in TPA menu according to the currently server player and even server settings
# - For 1.17+ consider use entity mark to replace most of the visual items
# - Add Search ID Book back, by crafting TPA menu book to get one
# - Add [APPLY] button in options menu
# - ID 改革
#  id译名： 编号
#  uid译名：用户编号
#  玩家id译名：玩家名称
#  对于每个玩家（uid）建立他们自己的名单显示列表 记录上一次呼出菜单时每个玩家的顺序 在每次呼出任何TPA菜单或刷新传送菜单书时的时候更新列表
#  建立公共存储 Compound Array 格式为 每个Compound包括 reqer uid, recver uid, req direction(bool), time out(int, 单位tick)
#  建立两个新的触发器准则记分项（分别用来控制两个方向的请求）
#  玩家发送请求后 循环遍历名单显示列表查找所申请的玩家uid 然后将新触发器的请求转化为tpa.tpa/tpa.tpahere + 接受者uid的对应请求（或者跳过这一步但做兼容） 最后将其记录到 公共存储中
#  菜单调用方面 在每次调用菜单时在temp建立空列表 遍历所有玩家将允许被发送请求的玩家加入temp 
#  最后用模板tellraw来显示固定人数的菜单（伪代码形似tellraw @s [{nbt: tempList[0]}, ... {nbt:tempList[20]}] 
#  需要考虑一点 是否应该允许玩家同时像两名玩家发送请求 基于新的方式似乎是可以实现的 但是不知道有没有必要
#  使用modrinth上数据包的方案 loottable获得玩家头颅从而获得玩家游戏名
#  考虑是否有开销影响：在每个玩家进游戏的时候计算他们的游戏名 然后仅仅在构建菜单是调用他们而不是对于每个玩家都重新计算 （此处有优化空间 可以复制一份uid和玩家游戏名的数组 在每查找到一名玩家后移除一个）
#  新的id管理方案可以直接移除id修复（或者保守一点将其移入设置界面）