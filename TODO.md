
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
# - Fix home menu doesn't show existing homes(Version:1.21.6+) §aOK
# - Make Key G available on displaying TPA menu §aOK
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
#!    -! For Newer version: advencement tpa:book_container_detect, add shelf, #copper_chest
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
# - Make custom dimension supported, add a new dimension number when which is called §