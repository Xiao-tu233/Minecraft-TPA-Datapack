# Users 存储接口

主数据为 `storage tpa:tpa users`，使用复合标签列表，无元数据占位项：

```snbt
[{uid: 12, uuid: [I; 1, 2, 3, 4], name: "CurrentName", previous_names: ["OldName"]}]
```

`uid` 是长期关联键，列表位置不代表 UID 或新菜单的槽位。记录可暂缺 UUID；
新增用户必须提供 UUID。在线状态继续由计分板维护。
流程通过条件调用普通子函数分支，不使用宏函数或 `return` 命令。

## 查询和写入

| 函数 | 输入 | 行为 |
| --- | --- | --- |
| `tpa:users/get` | `temp.users.input.uid` | 按 UID 精确读取 |
| `tpa:users/find_uuid` | `temp.users.input.uuid` | 按原生四整数 UUID 精确读取 |
| `tpa:users/find_name` | `temp.users.input.name`；可选 `include_previous_names: 1b` | 返回当前名/历史名候选，不自动确认身份 |
| `tpa:users/add` | `temp.users.candidate.{uid,uuid,name,previous_names?}` | 检查 UID、UUID 未占用后追加；调用方分配 UID |
| `tpa:users/set` | `temp.users.candidate.{uid,uuid,name}` | 更新已存在的 UID，或给未绑定的 UID 补 UUID |
| `tpa:users/set_uuid` | `temp.users.candidate.{uid,uuid}` | 管理接口：更换 UUID，拒绝占用其他 UID 已绑定的 UUID |
| `tpa:users/remove` | `temp.users.input.uid` | 删除离线用户的索引记录；不注销身份或删除关联数据 |

精确查询的唯一结果为 `temp.users.result`；所有查询候选为
`temp.users.results`。每次调用清理上次结果，计分板 `#users.result tpa.variables`：

- `0`：未找到。
- `1`：成功。
- `2`：匹配不唯一，或写入发生 UID / UUID 冲突。没有唯一 `result`。
- `3`：输入不符合接口约定，或存储尚未迁移。
- `4`：`remove` 的目标当前在线，拒绝删除。

`set` 不追加不存在的 UID，不允许更换已经绑定的 UUID；保留现有其他字段和
历史名字。改名会把原名去重加入 `previous_names`。它不接受通过 candidate
覆盖历史名字。`add/set` 会使用 `temp.users.input.uuid` 作为内部查询参数。

这些函数只处理数据，不修改执行者的 `tpa.uid`，不分配全局 UID，
不自动认领旧 Home，也不提供 UID 改号、互换或身份合并操作。
`remove` 删除该 UID 的用户记录和 `users_pages` 页码，但不清除计分板 UID、
Home、Back 等关联数据；玩家再次上线时，缺失的记录会被 `ensure` 补回。

## 设置菜单分页

`users_pages` 独立保存 `[{uid: 查看者UID, page: 页码}, ...]`，不会混入用户记录。
分页函数以 `@s` 为查看者。保留以下页码存储基础，供菜单重写使用：

- `users/page/get`：读页码，缺失时默认 1，过期页码回退并保存。
- `users/page/set`：保存 `#users.page.candidate tpa.variables`，自动限制到合法页。
- `users/page/create`：将当前查看者页码设为 1，不重复追加。
- `users/page/next`、`users/page/previous`：读取并保存下一页/上一页。

输出为 `#users.page.result`、`#users.total_pages`、`#users.total`。
翻页函数不调用尚未实现的菜单渲染函数；菜单调用方在翻页后负责渲染。

**当前分页边界尚待重写。** `page/refresh` 仍按记录数计算每页 5 条、至少 1 页，
不能直接用于显示 UID 空槽。新菜单应按明确的 UID 上限计算页数，
再对当前页固定 UID 范围调用 `users/get`；未命中的 UID 显示填入按钮。
如果允许填入最高 UID 之后的空槽，还需提供访问该槽位的入口。

旧的物理位置范围查询、槽位解析、上下移动、列表重排和编辑界面已移除。
`users/menu` 仅保留新对话框骨架，暂不渲染；高级设置中的入口保留。
新菜单由维护者重写：显示姓名和 UID、点击标签复制姓名；复制 UUID；设置姓名、
UUID、UID；UID 冲突确认互换；空 UID 槽填入及移除操作。

提交修改时应重新校验目标 UID、UUID 及冲突对象，避免旧菜单操作到已变化的记录。
跨命令等待用户确认的数据应按操作者隔离，不能只依赖共享 `temp`。

## 接入边界和验证

`first_join` 分配 UID 后调用 `users/add`；已有 UID 的玩家通过 `on_join` 调用
`users/ensure`，按 UUID 查找，缺失时追加并输出 debug，存在时刷新姓名并保留历史名。
因此手工设置的姓名可能在下次登录时被实际游戏名覆盖；显示别名若需长期保留，应另设字段。

当前 `ensure/update` 使用玩家计分板上的 UID 进行写入。仅修改 users 中的 UID
不能完成身份改号；实现改号或互换时必须确定计分板、离线玩家重连、UID 分配上限及
Home/Back 等关联数据的处理策略。空槽填入已有用户也属于 UID 改号，不应复制出重复 UUID。

2.0.6 没有本模块的复合记录，升级初始化为空列表，不迁移旧名称列表。
数据接口仍拒绝 `users: ["", "PlayerName", ...]` 这样的旧字符串列表并返回 3，
不会在查询时自动转换或清空它；同名不能自动视为 UUID 绑定证据。

`python -B scripts/tests/test_users_storage.py` 使用有限命令解释器运行真实
mcfunction 文件，检查状态转换和存储不变量；不替代游戏内命令解析和 NBT 类型验证。
