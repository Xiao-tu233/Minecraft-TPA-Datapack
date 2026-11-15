# Users 存储接口

主数据为 `storage tpa:tpa users`，使用复合标签列表，无元数据占位项：

```snbt
[{uid: 12, uuid: [I; 1, 2, 3, 4], name: "CurrentName", previous_names: ["OldName"]}]
```

`uid` 是长期关联键，列表位置只是菜单显示位置。旧用户可暂缺 UUID；
新增用户必须提供 UUID。在线状态继续由计分板维护。
流程通过条件调用普通子函数分支，不使用宏函数或 `return` 命令。

## 查询和写入

| 函数 | 输入 | 行为 |
| --- | --- | --- |
| `tpa:users/get` | `temp.users.input.uid` | 按 UID 精确读取 |
| `tpa:users/find_uuid` | `temp.users.input.uuid` | 按原生四整数 UUID 精确读取 |
| `tpa:users/find_name` | `temp.users.input.name`；可选 `include_previous_names: 1b` | 返回当前名/历史名候选，不自动确认身份 |
| `tpa:users/get_range` | `temp.users.input.start`、`end` | 按包含两端的 1 起始列表位置取菜单条目 |
| `tpa:users/add` | `temp.users.candidate.{uid,uuid,name,previous_names?}` | 检查 UID、UUID 未占用后追加；调用方分配 UID |
| `tpa:users/set` | `temp.users.candidate.{uid,uuid,name}` | 更新已存在的 UID，或给未绑定的 UID 补 UUID |

精确查询和写入的唯一结果为 `temp.users.result`；所有查询候选为
`temp.users.results`。每次调用清理上次结果，计分板 `#users.result tpa.variables`：

- `0`：未找到。
- `1`：成功；范围查询可以包含多项。
- `2`：匹配不唯一，或写入发生 UID / UUID 冲突。没有唯一 `result`。
- `3`：输入不符合接口约定，或存储尚未迁移。

`set` 不追加不存在的 UID，不允许更换已经绑定的 UUID；保留现有其他字段和
历史名字。改名会把原名去重加入 `previous_names`。它不接受通过 candidate
覆盖历史名字。`add/set` 会使用 `temp.users.input.uuid` 作为内部查询参数。

这些函数只处理数据，不修改执行者的 `tpa.uid`，不分配全局 UID，
不自动认领旧 Home，也不提供用户删除/身份合并操作。

## 设置菜单分页

`users_pages` 独立保存 `[{uid: 查看者UID, page: 页码}, ...]`，不会混入用户记录。
分页函数以 `@s` 为查看者，每页 5 项，空列表保留第 1 页：

- `users/page/get`：读页码，缺失时默认 1，过期页码回退并保存。
- `users/page/set`：保存 `#users.page.candidate tpa.variables`，自动限制到合法页。
- `users/page/create`：将当前查看者页码设为 1，不重复追加。
- `users/page/next`、`users/page/previous`：读取并保存下一页/上一页。

输出为 `#users.page.result`、`#users.total_pages`、`#users.total`。
翻页函数不调用尚未实现的菜单渲染函数；菜单调用方在翻页后负责渲染。

`users/resolve_slot` 接收 `#users tpa.variables` 的 `-3..-7` 五个相对槽位，
解析为当前页用户，返回 `#users.selected_uid` 和 `temp.users.result`。
`users/select_index` 接收正数绝对列表位置。末页空槽返回状态 0 和 selected_uid 0。
`-2`、`-8` 由未来菜单分发层分别调用上一页/下一页接口。

设置操作必须使用解析得到的 UID；列表位置不能作为长期身份保存。
未来若支持改变用户列表顺序或删除记录，应在打开菜单时保存显示快照，
点击时按快照 UID 定位，避免显示后列表变化选中其他用户。

## 接入边界和验证

目前只实现数据层和分页层，尚未接入 `on_join`、`first_join` 或旧数据迁移。
现有 `users: ["", "PlayerName", ...]` 不能直接使用这些接口；查询/写入返回 3，
保留原数据。需要先由独立迁移流程转换，不能把同名自动视为 UUID 绑定证据。

`python -B scripts/tests/test_users_storage.py` 使用有限命令解释器运行真实
mcfunction 文件，检查状态转换和存储不变量；不替代游戏内命令解析和 NBT 类型验证。
