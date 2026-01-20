Project To-do lists:    
- [o] public tp spot (warp) 
  - Every warp contains: Warp Position(xyz, dimension), Warp Name(Show before teleport button), Warp ID(Number), Warp Description(Optional but recommended, show when hover the warp name)
   - Dxcide: Show warps in 传送点菜单 or a independent warp menu? 
   - Fxr the first index of the warp list, make the first compound stores the lang for options.warp 
   - Rxalize [Move Up] [Move Down] 
   - Make dimensions customized(Add option: dimensions) 
- [o] Optimize the code structure 
- [x] Check if scoreboard objectives tpa is already exists to see if the other TPA datapack is installed §cNot Necessary
- [o] Update & Uninstall langauge supportive 
- [o] Not using the Vanilla tick interface, instead use schedule function 
- [o] Make the req timer ticks in the time_out function 
- [x] Use text component after scoreboard objectives declares §c Only static text components supported so achieving in 1.15- and light version
   Translated sample texts are below:
   - scoreboard_tpa: "TPA菜单/传送请求目标"
   - scoreboard_back: "返回上一位置"
   - scoreboard_tpaccept: "接受请求/自动接受"
   - scoreboard_tpa_help: "帮助"
   - scoreboard_tpa_tpaccept: "接受请求"
   - scoreboard_tpa_tpaccept_toggle: "自动接受"
   - scoreboard_tpa_tpa: "传送请求目标"
   - scoreboard_tpa_tpahere: "传送此处请求目标"
   - scoreboard_tpa_simple_menu: "简易菜单"
   - scoreboard_tpa_cancel_req: "取消请求"
   - scoreboard_tpa_idfix: "ID修复"
   - scoreboard_tpa_back: "返回上一位置"
   - scoreboard_tpa_extended_menu: "展开菜单"
   - scoreboard_tpa_mute: "静音"
   - scoreboard_tpa_output: "输出位置"
   - scoreboard_tpa_search_id: "搜索ID"
   - scoreboard_tpa_book: "传送书"
   - scoreboard_tpa_pos: "传送坐标输入状态"
   - scoreboard_tpa_pos_x: "传送坐标目标X坐标"
   - scoreboard_tpa_pos_y: "传送坐标目标Y坐标"
   - scoreboard_tpa_pos_z: "传送坐标目标Z坐标"
   - scoreboard_tpa_here: "广播位置"
   - scoreboard_tpa_sethome: "设置传送点"
   - scoreboard_tpa_home: "传送传送点"
   - scoreboard_home: "传送传送点"
   - scoreboard_tpa_removehome: "移除传送点"
   - scoreboard_tpa_language: "语言"
- [o] Fix home menu doesn't show existing homes(Version:1.21.6+) 
- [o] Make Key G available on displaying TPA menu 
- [ ] Combining language file into one, translate more languages in extra pack
- [o] Abandon ingame keyboard as dependency, instead, write it inbuilt datapack in easier way 
- [o] Re-write Carpet Fake Player detection or even use carpet scripts if problems continue (Problem occurs:  
   - Some fake players are spawned by players but insta-kicked by Datapack unexpectedly; 
   - When Fake Players working at worldpoint, tick function is stopped with entity data exception raising( It may be caused by low TPS situations as well )
      )
- [o] Boardcast Position displays red instead of purple in the dimension of the end; 
- [o] Avoid load lang into temp storage causing polute the storage 
- [o] Tell to modify configs in client instead of server terminal when server did `/function tpa:options` 
- [o] Use uid instead of the tag of TPA_user 
- [o] Use tpahere filefolder to simplify tpa:tpahere 
- [o] Fix !s will continue to make ids greater and greater: §r, will also update the whole system in the future.
   - Add also the third mode for compact_ids "混合模式"
   - #compact_ids == Any && #tp_spec == Any && #carpet_fake_player_fix == 0 -> fake: their uid
   - #compact_ids == 1 && #tp_spec == 0 && #carpet_fake_player_fix == 1 -> offline: null; spec, fake: -1
   - #compact_ids == 0 && #tp_spec == 0 && #carpet_fake_player_fix == 1 -> offline: their uid; spec: negative of their uid; fake: -1
   - #compact_ids == 0 && #tp_spec == 1 && #carpet_fake_player_fix == 1 -> offline: their uid; spec: their uid; fake: -1
- [o] When Server Terminal access `/function tpa:options` or `/function tpa:tick_not_working` console will now return warning mxg 
- [ ] Edit wiki
- [o] Make tpa.output Default: tellraw & actionbar 
- [x] Sneak detect need to be detected when using elytra to fly §cVanilla bug
- [x] Button to choose selected game language in the language menu §cNot Realizable
- [o] I can req myself : Caused by accidently deleting of tpa:tpa_conditions
- [o] Clear TPA book whenever player put that into a container(Not only chests): by achivements 
   - ^ tpa:book/track_missing
   - ^ (advancements) tpa:book_container_detect
   -! For 1.20.4-: tpa:book/set_interaction_context:7:106 generic.block_interaction_range instead of player.block_interaction_range
                 : tpa:book/track/confiscate_from_entity:5:435 Slot: byte instead of slot: int
                 : tpa:book/track/confiscate_from_ender_chest:5:435 Slot: byte instead of slot: int
   - Fxr Newer version: advencement tpa:book_container_detect, add shelf, #copper_chest  
   - Dxtect Item dropped when player died instead of dropping for refresh(Distance Detection) 
   - Use keybind instead of hard code key 'Q', 'F' §cNot Realizable, chat component not supportive
   -! Maybe make book wearable and craftable for different slots
   - Dxtect Block Container (Prevent from detecting the same block for times) §r, but gave up ray detection
- [o] Add re-get way when tpabook is turned offhand 
- [o] If one feature is disabled, show setting button beside to guide the user to enable it. 
- [o] Make Technic settings defaultly hidden whenever debug mode is enabled, they show. 
   - Containing: #sequence_timer, #sim_dist, #is_1_16(Rename Needed), #teleport_summon_retried(Rename Needed), #teleport_threshold_retry_summon(Rename Needed), #uses_binary_teleport, Shake or Nod related: #timer_sequence, #detectable_range, ...
- [o] Frequency will be set to 20 if 0 was set when calling tpa:tick_not_working function. 
- [o] Make Settings Initialize when version is not correct instead of everytimes. 
- [o] 1.15 teleport changes: 
   - Summon visual item of Target instead giving player a target to check the 1.15/1.16 
   - Make player keeping floating in the midair instead of falling them when chunks are loading
   - Show Retries Debug infos in action bar instead of chat
- [o] Make License showed in a text displayer and Button provided for ending reading 
- [o] Avoid using long target selectors instead, use predicates 
- [o] Compact with the newest pack.mcmeta format 
- [o] Show version infos in options like current datapack version, game version 
- [o] For Chinese-like Languages, use follow translates 
     Original Name | Short Name(通称) | Formal Name
     Home          | 家               | (私人)传送点
     Warp          | 地标             | 公共传送点
- [o] Add the version post time(UTC) when loaded the datapack right after the datapack version 
- [o] 考虑 init_language_storage是否要放在 initialize里 
- [o] ^ https://docs.mcbookshelf.dev/en/latest/modules/raycast/ Maybe Raycasting usable 
- [o] Make some menu to be used more convenient, automatically call menu again when editted 
- [o] Make custom dimension supported, add a new dimension number when which is called 
- [o] Move some load datas to tpa:tpa options instead of tpa:tpa * 
- [o] Add a sentence at the end of option that enabling debug mode to modify advenced settings 
- [o] Show the gray button of [Request Teleport] when player who cannot be requested sent a here 
- [o] Version overlay now changed: 1.20.2 - 1.20.3, 1.20.4, 1.20.5-1.20.6 -> 1.20.2, 1.20.3 - 1.20.4, 1.20.5-1.20.6 
- [o] Add following switches: 
   - Accept Toggles(When tpaccept_toggle+==4): Disable -> Enable -> Disable
   - Mute(When +==4): Unmute -> Mute -> unmute
   - Outputs At(When +==6): Both -> Actionbar -> Chatbar -> Both
- [ ] Searching ID inputs may be interupted by other players when they're inputting too
- [ ] license could be a written book to be read
- [ ] warp
   - 地标编辑考虑将编辑按钮合并到上方 对于每个点 可以单选 选择后点击上方编辑按钮修改即将并入的内容的细节 点击应用来并入修改 取消来放弃更改

 TESTS:
   L   E
- [ ] [ ] mc1.13 on 1.13
- [ ] [ ] mc1.15 on 1.15
- [ ] [ ] mc1.15 on 1.20.1
- [ ] [ ] mc1.20.2 on 1.20.2
- [ ] [ ] mc1.20.2 on 1.20.4
- [ ] [ ] mc1.20.2 on 1.20.5
- [ ] [ ] mc1.20.2 on 1.21
- [ ] [ ] mc1.20.2 on 1.21.5
- [ ] [ ] mc1.20.2 on 1.21.6
- [ ] [ ] mc1.20.2 on lastest release

 Futures: (v2.1)
- Add Signed Binary TP(to avoid numbers like 1023 takes too long)
- [ ] Head gestures (Functions are at zhencangthings/datapacks/head_gestures)
   - Sneak + Head up/down: Agree/Deny
   - Sneak + Turn around: open menu
   - Sneak + left/right turn > 30 degs, left/right option
   - Sneak + Head up for 5 secs: temply disable hg
   - And then without sneak, down for 3 secs: enable
   - every gestures should be interface-ized
   - Tutorial for new players

- [ ] Lang contains author key to specify the source of the translations
   - Consider about the color of actionbar
   - For 1.13-1.15 添加虚拟物品实体储存1.15+的 storage tpa:tpa 物品储存位置需要被加载到(玩家位置上空 或 出生点常加载区块)
   - 传送前摇 落地空气检测
   - 触发保护及延迟机制要基于请求是否是被接收者拖了很久才接 如果发了马上接则不应该触发这些 或者这里的threshold应该允许设置
   - {
           "teleport_delay": 3,            // 请求被接受后延迟秒数（设置为0即与原来一致）
         "interrupt_by_moving": boolean  // 可以禁止透过移动中断传送避免误判 考虑使用视角转向以及按钮 或者使用实体子谓词{type:player, input: *}
         "may_skip_delay": boolean,      // 允许跳过延迟
         "safe_mode": "strict",          // 安全检查
          off	不检测	直接传送（风险最大）
          basic	检查脚下是否为空气/液体	若不安全则取消传送
          strict	检查脚下方块可站立、头顶空间可容纳、周围无岩浆/虚空
      }
   - 加入服务器预设配置 方便不同体量服务器
   - Chest menu
   - Add a snowball menu
   - If the above one is posible, make Actionbar a screen and player and turn their rotations to control the 光标 in a GUI-like way
   - Update TPA book format, including buttons in TPA menu
   - Use binary format to achieve tp instead of anchors:
     E.g. Our target x/z is 1000
      1000 = 0b11 1110 1000
      So, we run tp ~0b(1*0b10**n) ~ ~ whenever n is 1
      Real command: ...more larger detects 
                    execute as @a[scores={...=2..}] run tp @s ~2 ~ ~
                    execute as @a[scores={...=2..}] run scoreboard players remove @s ... 2
                    execute as @a[scores={...=1..}] run tp @s ~1 ~ ~
                    execute as @a[scores={...=1..}] run scoreboard players remove @s ... 1
      The reason why it can't be a must because we must have the maxinum distance when using binary format.
   - Use more predicts instead of conditions "execute if"
   - Considering use `execute positioned over <heightmap> -> execute: 将执行位置设置为符合特定高度图的一纵列方块的最高的位置。`
   - Consider use tag instead of item customdata to select Visual Items
   - Show specific player acount in TPA menu according to the currently server player and even server settings
   - For 1.17+ consider use entity mark to replace most of the visual items
   - Add Search ID Book back, by crafting TPA menu book to get one
   - Add [APPLY] button in options menu
   - ID 改革
     id译名： 编号
     uid译名：用户编号
     玩家id译名：玩家名称
     对于每个玩家（uid）建立他们自己的名单显示列表 记录上一次呼出菜单时每个玩家的顺序 在每次呼出任何TPA菜单或刷新传送菜单书时的时候更新列表
     建立公共存储 Compound Array 格式为 每个Compound包括 reqer uid, recver uid, req direction(bool), time out(int, 单位tick)
     建立两个新的触发器准则记分项（分别用来控制两个方向的请求）
      玩家发送请求后 循环遍历名单显示列表查找所申请的玩家uid 然后将新触发器的请求转化为tpa.tpa/tpa.tpahere + 接受者uid的对应请求（或者跳过这一步但做兼容） 最后将其记录到 公共存储中
     菜单调用方面 在每次调用菜单时在temp建立空列表 遍历所有玩家将允许被发送请求的玩家加入temp 
     最后用模板tellraw来显示固定人数的菜单（伪代码形似tellraw @s [{nbt: tempList[0]}, ... {nbt:tempList[20]}] 
     需要考虑一点 是否应该允许玩家同时像两名玩家发送请求 基于新的方式似乎是可以实现的 但是不知道有没有必要
     使用modrinth上数据包的方案 loottable获得玩家头颅从而获得玩家游戏名
     考虑是否有开销影响：在每个玩家进游戏的时候计算他们的游戏名 然后仅仅在构建菜单是调用他们而不是对于每个玩家都重新计算 （此处有优化空间 可以复制一份uid和玩家游戏名的数组 在每查找到一名玩家后移除一个）
     新的id管理方案可以直接移除id修复（或者保守一点将其移入设置界面）
  区分对应所需权限的按钮 with 不同的按钮边框颜色
  考虑减少item作为锚点 而是盔甲架 例子如下
  summon armor_stand ~ ~ ~ {Tags:["tpa.teleport_anchor"],Invisible:1b,Marker:1b,NoGravity:1b,Invulnerable:1b,Silent:1b}
  无点击事件 灰色
  无需op 白色
  需op 金色
  避免leftpart 和rightpart 使用列表
  对于2个插入元素及以上 使用顺序数字来表示 
  0 for ABC
  1 for ACB
  2 for BAC
  and ...3 more
  Consider more flexible way for language extras: containing indexes checking when language is loaded
- [ ] Make menus like home and warp page switchable to make every button directly commands accessible without index adding in the end 比方说传送点，第一页比如我放5个位置 那就会存在玩家分数储存为页码比如是2 那我就会在触发记分项的时候比方说触发的8 那就会是 传送点#6的第二个操作