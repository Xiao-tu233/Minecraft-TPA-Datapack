Project To-do lists:

 TESTS:
- [ ] mc1.13 on 1.13
- [ ] mc1.15 on 1.15
- [ ] mc1.15 on 1.20.1
- [ ] mc1.20.2 on 1.20.2
- [ ] mc1.20.2 on 1.20.4
- [ ] mc1.20.2 on 1.20.5
- [ ] mc1.20.2 on 1.21
- [ ] mc1.20.2 on 1.21.5
- [ ] mc1.20.2 on 1.21.6
- [ ] mc1.20.2 on lastest release

# v2.1 todo
- [ ] edit docs
- [ ] Add Signed Binary TP(to avoid numbers like 1023 takes too long)
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
   - Show specific player amount in TPA menu according to the currently server player and even server settings
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
- [ ] 在编辑公共传送点时
   - 检测比如name, desc这些字符串的变化
   - 考虑直接应用更改 或者在更改后更改对应按钮的外观 或者直接将更改结果拟显示在目标槽位
   - 增加这些更改之后的提示就像选择槽位时一样
- [ ] 1.20.2+的情况下 公共传送点的默认名称应该为 warp_number + 槽位index
- [ ] 语言的index键应该在reload的时候被添加而不是语言的yml里
- [ ] 传送过程有可能会触发Caves & Cliffs成就
- [ ] Warps 菜单中 补全指令的tooltip 缺省了数字作为指令的一部分
- [ ] trigger记分板显示名最好可以带颜色
- [ ] make objective tpa default -1 so that /trigger tpa will make tpa 0
- [ ] 上述问题解决之后 id就可以从1开始了
- [ ] 考虑是否要在新版本直接使用宏函数/数据存储替代基于tags的recver_test/reqer_test
- [ ] tpa.lang_temp -> tpa.selected_language(tpa.slct_lang)
- [ ] 尝试execute at, execute position子指令能不能把二分法的approach缩减到一个1tick
- [ ] 考虑使用调试模组 Sniffer BV14TmrB1EhA