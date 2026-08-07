# AGENTS.md

## 项目目标

Minecraft-TPA-Datapack 是一个原版 Minecraft 数据包。它面向非 OP 玩家提供
TPA / TPAHere 请求传送，并扩展了接受、拒绝、取消、自动接受、Back、Home、
Warp、坐标传送、位置广播、语言选择、传送书、菜单、Dialog 和 Carpet 假人兼容。

本项目同时维护完整版本和 Light 版本，以及多个 Minecraft 版本的实现。当前开发
焦点是完整版本的 `src/+mc1.20.2`，目标游戏环境为 **Minecraft 1.20.2 到
26.2**。除非任务明确要求，**不要修改其它版本目录**。

状态基线：`main` 分支，`d5845db0`（`menu stastic check added`），2026-08-07。

## 当前架构

### 源码版本布局

```text
src/
  +mc1.13/          # 1.13-1.14.4 完整版
  +mc1.15/          # 1.15-1.20.1 完整版兼容实现
  +mc1.20.2/        # 当前主版本；1.20.2-26.2
  light+mc1.*/      # Light 版本
  lang_extra/       # 额外语言包
scripts/
  lang/              # 语言 YAML 源文件与同步脚本
  deploy.py          # 向本地 servers/ 部署数据包
servers/             # 本地测试服务器目录
```

`src/+mc1.20.2/pack.mcmeta` 声明当前完整包为 `v2.1`，并通过
`format_*` overlay 覆盖不同数据包格式的差异。修改主版本时必须同时检查对应
overlay 是否覆盖了同一资源；不要把仅适用于较新格式的语法误放到基础目录。

README 仍有 `v2.0.6`、`26.1` 等旧版本描述，和 `pack.mcmeta` 的 v2.1 / 26.2
状态不完全一致。文档更新是发布阻塞项，不能仅凭 README 判断当前实现状态。

### 数据包启动与运行流

```text
data/minecraft/tags/function/load.json  -> tpa:load
data/minecraft/tags/function/tick.json  -> tpa:tick

tpa:load
  -> 建立计分板、初始化 storage、加载语言、显示加载信息
  -> 版本不一致时调用 tpa:initialize
  -> 可按配置调度 tpa:tick

tpa:tick
  -> 分批处理未初始化在线玩家（tpa:on_join）
  -> enable trigger 计分项
  -> 更新请求、死亡 Back 记录与个人设置
  -> 分发 TPA / TPAHere / 接受 / 拒绝 / Home / Warp 等输入
```

新版命名空间目录使用 `data/.../function/`（单数）；旧版本目录通常使用
`data/.../functions/`（复数）。这是跨版本修改时最常见的路径错误之一。

### 主要模块

主实现位于 `src/+mc1.20.2/data/tpa/function/`：

- 请求：`tpa/`、`tpahere/`、`requests/`、`request_menu/`、`tpaccept/`、
  `tpadeny/`、`cancel_req/`
- 菜单与输出：`tpa_menu.mcfunction`、`tpahere_menu.mcfunction`、`menu/`、
  `output/`、`dialog/`
- 玩家与身份：`initialize.mcfunction`、`on_join.mcfunction`、
  `first_join.mcfunction`、`get_name.mcfunction`、`fake_player_fix/`
- 传送功能：`back/`、`home/`、`warp/`、`here/`、`tp_pos/`、`teleport/`
- 支撑设施：`language/`、`dimension/`、`book/`、`sounds/`、`load/`、
  `options/`

核心状态分布在三个地方：

- 计分板：玩家触发器、`tpa.uid`、在线状态和临时数值；
- `storage tpa:tpa`：请求、菜单缓存、语言、配置镜像与临时对象；
- 玩家 tag / 谓词：可用性、假人检测、临时选择器上下文。

`storage tpa:tpa temp` 是共享临时空间。调用链必须保留正确的 `execute as @s`
上下文并在同步流程内使用它；不要把同一临时路径留给下一名玩家异步消费。

### 请求与菜单模型

玩家长期身份以 `tpa.uid` 为主，不能重新引入仅依赖旧玩家编号的关联方式。
请求数据和多请求选择器保存在 storage 中；接收者相关选择器使用
`request_selector.recv`。

请求菜单在打开、翻页和刷新传送菜单/传送书时重建缓存：

- 候选玩家列表：`temp.request_menu.players`
- 当前菜单快照：`temp.current_request_menu`
- 显示列表：`temp.request_menu.display_list`

显示列表固定为 39 个元素：偶数索引 `0, 2, ..., 38` 是最多 20 个玩家名，
奇数索引是灰色 `|` 分隔符。菜单槽位的触发值为：

```text
-2       上一页
-3..-22  当前页 20 个候选槽位
-23      下一页
```

在 Minecraft range 语法中必须写 `-22..-3`，不能写 `-3..-22`。

`tpa` / `tpa.tpa` 与 `tpa.tpahere` 的正数仍表示解析后的目标编号；负数只用于
请求菜单导航和槽位选择。改动其中任一项时必须同步检查
`tpa:tick`、`tpa:request_menu/tpa`、`tpa:request_menu/tpahere` 及其分发函数。

## 已完成任务

以下为近期提交和 TODO 已勾选项反映的完成状态：

- 建立以 UID 为中心的玩家初始化流程；数据包重载时在线玩家会逐个进入
  `tpa:on_join`，以便正确写入玩家列表，而不是只统一赋分。
- 请求系统已支持多请求场景的接受、取消和拒绝；拒绝按钮、声音和输出已加入。
- 请求菜单已改为缓存列表加固定 20 槽位渲染，并支持空列表 `0/0` 状态、
  翻页与不可用翻页按钮。
- TPA / TPAHere 菜单、Home、Back、Here 和部分输出流程已进行结构化拆分；
  常用输出统一趋向 `tpa:output/one_arg` 和 `tpa:output/standard`。
- 菜单按钮权限边框规则已定义并已在部分菜单落地：
  无点击事件为灰色、无需 OP 为白色、需要 OP 为金色。
- `tpa:available` 等谓词、Carpet 假人兼容、书容器相关谓词和
  1.21.5 以前的兼容路径已进行过修复。
- `simple_menu` 的旧功能已从主要流程中移除；仍保留同名 trigger 的兼容痕迹时，
  不应擅自把它当作新功能入口。
- 语言格式化已支持 `%s` / `%1$s` 形式的参数顺序，并生成参数拆分及
  `_format` 信息。

## 未完成任务

### 近期应优先处理

- 请求菜单 `tpa:request_menu/display/tpahere` 需要复查：当前文件存在重复的
  候选列表 `tellraw`，且分隔符奇数索引的 storage 组件缺少 `interpret: true`。
  先修复并在游戏内确认 TPAHere 菜单只输出一次。
- 为主版本建立并实际执行测试矩阵：1.20.2、1.20.4、1.20.5、1.21、1.21.5、
  1.21.6 及最新正式版；旧版本矩阵也尚未完成。
- 更新 README / 发布文档，使 v2.1、支持范围和实际功能一致。
- 继续检查 Home、Warp、菜单按钮状态和请求流程在重载、多人并发、假人开启时的
  回归。

### 架构与体验待办

- 完成 ID / UID / 玩家显示列表的整体重构，明确所有持久数据的身份键。
- 为“复合标签列表按特定键查找”的重复逻辑建立通用 `List` 抽象或统一函数组。
- 将 Home / Warp 的命令存储更新逻辑提取为独立更新函数。
- 决定并记录 Home 的长期数据结构策略：
  低版本使用 `[{uid, homes:[...]}]` 加哨兵遍历；高版本可用
  `home.<uid>.<home>` 动态路径。当前不要做无测试的大规模格式迁移。
- 重写 Dialog；在明确开始此任务前不要顺手调整 `dialog/`。
- 改进传送安全性和体验：安全落点、延迟/移动中断、传送锚点或二分传送方案。
- 继续处理日语语序、维度本地化、菜单书格式、Warp 菜单与动态按钮体验。

## 关键设计决定

### 版本与兼容性

- 当前任务默认仅修改 `src/+mc1.20.2`。
- 若任务同时影响 `1.15-1.20.1`，优先维持旧版可执行的列表加哨兵遍历方案；
  不要把宏函数、`return` 或新版 NBT 文本组件格式直接复制进旧版路径。
- 主版本可以使用其目标格式支持的机制，但应把版本特有实现隔离在适当 overlay，
  并保留清晰的调用边界。
- 不要把 JSON 文本组件和 1.21.5 之后的 NBT 文本组件格式混用。兼容旧版的
  路径仍应输出旧格式。

### 语言与输出

- `scripts/lang/zh_cn.yml` 是基础语言源；`en_us.yml`、`ja_jp.yml`、
  `zh_tw.yml` 等通过 `scripts/lang/sync_lang.py` 补齐并同步。
- `tpa:init_storage_lang` 和 `tpa_extra:init_storage_lang` 是生成文件。修改语言键
  时编辑 YAML 后运行同步脚本，**不要手写这些生成的 `.mcfunction` 文件**。
- 新输出优先调用 `tpa:output/standard` 或 `tpa:output/one_arg`。使用
  `one_arg` 且参数来自计分板时，先把分数存入 `temp.output.arg`，再转换为字符串：

```mcfunction
execute store storage tpa:tpa temp.output.arg int 1 run scoreboard players get #value tpa.variables
data modify storage tpa:tpa temp.output.arg set string storage tpa:tpa temp.output.arg
```

- 从 `loaded_lang` 或 storage 读取可解释文本时，保留 `interpret: true`；
  省略它会显示原始 JSON/SNBT，而不是预期文本。

### 菜单交互

- 禁用按钮没有点击事件，hover 直接说明不可用原因；不要依赖“点击后才报错”。
- 按钮外侧方括号由调用处硬编码，语言键只保存按钮正文，避免各语言重复定义边框。
- 按钮边框色统一为：无点击事件灰色；普通可用白色；需要 OP 金色。
- 翻页按钮边框白色、正文青色；翻页后仍显示相应的菜单标题。
- 请求列表只显示游戏名并以灰色 `|` 分隔，不在名称前额外显示 trigger 数字。

### 玩家、假人与文本解析

- `tpa:on_join` 的逐人处理不可改回批量“只重置分数”的模式：批量赋 UID 不会保证
  玩家被追加到 users / 身份列表。
- `tpa:get_name` 依赖带 `tpa.text_display` tag 的 `text_display` 实体和共享
  `temp.name`；调用时必须保证 `@s` 是目标玩家。加载函数会尝试生成该实体。
- Carpet 假人修复通过 `tpa:fake_player_fix/tag` 的宏参数调用；修改该流程时必须同时
  验证开启和关闭配置时普通玩家都满足 `tpa:available`。

## 下一步计划

1. 修复并手工测试 `request_menu/display/tpahere` 的重复渲染与 `interpret` 问题。
2. 以两名以上玩家、超过 20 名候选、无候选、跨页、多个待接收请求、自动接受、
   拒绝和取消为场景，回归请求系统。
3. 在 1.20.2 和一个最新目标版本先跑基础测试，再扩展到完整版本矩阵。
4. 在行为稳定后更新 README、发布说明和 TODO 的版本状态。
5. 再开始 List 抽象、Home/Warp 存储策略和 Dialog 重写等较大重构，避免与请求系统
   回归混在同一个改动中。

## 容易踩坑的地方

- `scripts/deploy.py` 会删除目标服务器中的同名数据包目录后重新复制源码。它是部署
  操作，不是普通的验证命令。
- `load.mcfunction` 会重置部分计分板、storage 和 tag；重载刷屏或状态丢失时先检查
  这里以及 `on_join`，不要只看菜单函数。
- tick 会先处理一名尚未初始化的玩家并暂停常规流程一个 tick。这个节流是为了让
  用户列表写入按玩家完成，不能在不了解副作用时删掉。
- trigger 计分项需要在 tick 中不断 `enable`。新增 `/trigger` 命令若没有对应 enable
  和分发逻辑，按钮会表现为“只能点一次”或完全无效。
- `storage tpa:tpa temp`、`request_selector.req`、`request_selector.recv` 的写入顺序
  很重要。循环列表时先确认哨兵、移除当前元素、再决定是否 append，避免死循环或
  丢失请求。
- Minecraft 的 range 写法要求由小到大，例如 `-22..-3`；反写会导致数据包解析错误。
- `text_display` 不只用于视觉显示，也被用作文本组件/名字解析桥梁。不要因“看似多余”
  而删除、改 tag 或在加载时无条件重复生成。
- `format_*` overlay 会覆盖基础路径的同名资源。修改后若游戏行为没有变化，先检查
  是否被 overlay 替换。
- 语言源文件是 UTF-8。PowerShell 输出偶有乱码，不代表文件编码损坏；不要据此重写
  全部语言文件。
- 工作区可能包含用户尚未提交的改动。只改与任务直接相关的文件，不要 reset、revert
  或顺手格式化无关内容。
