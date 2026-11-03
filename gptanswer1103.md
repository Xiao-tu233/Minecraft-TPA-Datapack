我检查了当前 [`ja_jp.yml`](C:/Program%20Files/Minecraft/Projects/Minecraft-TPA-Datapack/scripts/lang/ja_jp.yml)。结论是：你提出的方向基本正确，但当前文件里还有几处不是单纯措辞问题，而是方向或语义反了。

**1. 玩家名加 `さん`**

这个规则可以采用，但只适用于确实是玩家名的占位符，不是所有 `%s`：

- 玩家名：`%sさん`
- 维度名、Home ID、Warp 名称、语言名、坐标：不要加 `さん`

当前还缺少 `さん` 的主要位置：

- `reqer_change_chatbar` 的两个玩家名
- `reqer_deny_tpa`
- `reqer_deny_tpahere`
- `reqer_req_invalid`
- `reqer_req_tpa`
- `reqer_req_tpahere`
- `reqer_req_tpahere_actionbar`
- `reqer_req_tpahere_chatbar`
- `reqer_timeout`
- `tpa_menu_hoverevent`

例如：

```text
%sさんにテレポートリクエストを送信しました
クリックして%sさんにテレポートリクエストを送信
```

而以下这些不应加：

```text
home_act: %s  // Home 编号
here_dim_postion_hoverevent: %s  // 维度名
warp_teleport: %s  // Warp 名
lang_selected: %s  // 语言名
```

**2. `こちら / そちら / あちら` 的使用**

建议按“当前看到消息的玩家”决定，不要按功能名称机械替换：

| 场景 | 更自然的表达 |
|---|---|
| TPA 请求者请求前往对方位置 | `そちらへテレポートするリクエスト` |
| TPA 接收者收到请求，目标是自己这里 | `こちらへテレポートするリクエスト` |
| TPAHere 请求者请求对方来自己这里 | `こちらへテレポートするリクエスト` |
| TPAHere 接收者收到请求，要去发送者那里 | `そちらへテレポートするリクエスト` |

不过在完整句子中，下面这种写法比 `こちらへのテレポートリクエスト` 更自然：

```text
%sさんのところへテレポートするリクエスト
```

`そちら` 和 `こちら` 适合按钮标签或简短提示；详细通知最好直接写“%sさんのところ”，避免视角歧义。

`**あちら` 不建议大量使用。它表示“那边/第三方那里”，在当前这些一对一通知中通常没有必要。第三方请求列表最好直接写：

```text
%sさんから%sさんのところへのリクエスト
```

**3. `拒否する / 承認する / キャンセルする`**

这三个都是他动词用法，通常带 `を`：

```text
リクエストを拒否する
リクエストを承認する
リクエストをキャンセルする
```

对应的被动形式是：

```text
リクエストが拒否されました
リクエストが承認されました
リクエストがキャンセルされました
```

如果要明确“被某人拒绝”，可以写：

```text
%sさんにリクエストを拒否されました
```

这里的 `を拒否されました` 属于“受害/遭遇被动”，必须有 `%sさんに`，不能单独写：

```text
リクエストを拒否されました
```

更推荐：

- 接收者点击拒绝后：`%sさんからのリクエストを拒否しました`
- 请求者收到拒绝：`%sさんにリクエストを拒否されました`
- 系统中性通知：`リクエストが拒否されました`

`拒否してしまいました` 表示“我不小心/遗憾地拒绝了”。它带有后悔语气，不适合普通系统通知。`拒否していました` 则是“当时正在拒绝/一直处于拒绝状态”，也不适合这里。

同理：

```text
キャンセルしていました
```

不是“请求被取消了”。应该使用：

```text
リクエストがキャンセルされました
```

如果强调玩家主动取消：

```text
%sさんがリクエストをキャンセルしました
```

**4. 当前核心功能中的明显问题**

这些需要优先修正：

- [`ja_jp.yml:7`](C:/Program%20Files/Minecraft/Projects/Minecraft-TPA-Datapack/scripts/lang/ja_jp.yml:7)  
  `前回の位置を見つかりしませんでした` 不正确。  
  建议：`前回の位置が見つかりませんでした`

- [`ja_jp.yml:8`](C:/Program%20Files/Minecraft/Projects/Minecraft-TPA-Datapack/scripts/lang/ja_jp.yml:8)  
  `自分の前の位置` 会被理解为“我前方的位置”。  
  建议：`前回の位置が削除されました`

- [`ja_jp.yml:9`](C:/Program%20Files/Minecraft/Projects/Minecraft-TPA-Datapack/scripts/lang/ja_jp.yml:9)  
  `皆んな` 不自然且用字不统一。  
  建议：`全プレイヤーの前回の位置をリセットしました`

- [`ja_jp.yml:21`](C:/Program%20Files/Minecraft/Projects/Minecraft-TPA-Datapack/scripts/lang/ja_jp.yml:21)  
  `你TPAメニュー` 混入了中文。  
  建议：`TPAメニューの本`

- [`ja_jp.yml:201`](C:/Program%20Files/Minecraft/Projects/Minecraft-TPA-Datapack/scripts/lang/ja_jp.yml:201)  
  `%sさんのこちらへの...` 视角和句法都不自然。  
  建议：`%sさんのところへテレポートするリクエストを承認しました`

- [`ja_jp.yml:217-218`](C:/Program%20Files/Minecraft/Projects/Minecraft-TPA-Datapack/scripts/lang/ja_jp.yml:217)  
  TPAHere 接收者收到请求时，直接写 `こちらへの` 容易混淆。  
  建议：`%sさんのところへテレポートするリクエストが届きました`

- [`ja_jp.yml:224`](C:/Program%20Files/Minecraft/Projects/Minecraft-TPA-Datapack/scripts/lang/ja_jp.yml:224)  
  这句基本自然，但可以改成更明确的：  
  `%sさんからのテレポートリクエストが期限切れになりました`

- [`ja_jp.yml:230`](C:/Program%20Files/Minecraft/Projects/Minecraft-TPA-Datapack/scripts/lang/ja_jp.yml:230)  
  语义方向反了。现在的 `%sさんのところへテレポート中` 表示请求者要去对方那里，但 TPAHere 实际是对方来到请求者这里。  
  建议：`%sさんがこちらへテレポート中...`  
  或：`%sさんにこちらへテレポートしてもらっています...`

- [`ja_jp.yml:245-246`](C:/Program%20Files/Minecraft/Projects/Minecraft-TPA-Datapack/scripts/lang/ja_jp.yml:245)  
  `reqer_change_chatbar` 的第二个玩家名缺少 `さん`。

- [`ja_jp.yml:249-251`](C:/Program%20Files/Minecraft/Projects/Minecraft-TPA-Datapack/scripts/lang/ja_jp.yml:249)  
  当前存在明显缺词：`%sテレポートリクエスト`、`%sリクエスト` 都不成立。  
  推荐：

  ```text
  %sさんにテレポートリクエストを拒否されました
  %sさんにこちらへのテレポートリクエストを拒否されました
  ```

- [`ja_jp.yml:263-267`](C:/Program%20Files/Minecraft/Projects/Minecraft-TPA-Datapack/scripts/lang/ja_jp.yml:263)  
  缺少 `さん`，且 `あなたの位置へテレポートさせる` 很像机器翻译。  
  建议：

  ```text
  %sさんにテレポートリクエストを送信しました。承認を待っています
  %sさんにこちらへのテレポートをリクエストしました。承認を待っています
  ```

- [`ja_jp.yml:271`](C:/Program%20Files/Minecraft/Projects/Minecraft-TPA-Datapack/scripts/lang/ja_jp.yml:271)  
  `あなたのリクエストを承認しなかったプレイヤー` 可以改成：  
  `§bリクエストを承認しなかったプレイヤー`

- [`ja_jp.yml:350`](C:/Program%20Files/Minecraft/Projects/Minecraft-TPA-Datapack/scripts/lang/ja_jp.yml:350)  
  当前缺少助词，应该是：  
  `クリックして%sさんにテレポートリクエストを送信`

- [`ja_jp.yml:368`](C:/Program%20Files/Minecraft/Projects/Minecraft-TPA-Datapack/scripts/lang/ja_jp.yml:368)  
  `下は...` 不自然，末尾的 `{` 也不应出现在日语句子中。建议改为完整句：

  ```text
  以下はプレイヤーのデータパックIDとゲーム内名です。IDをクリックすると、そのプレイヤーのところへテレポートするリクエストを送信します。
  ```

- [`ja_jp.yml:374`](C:/Program%20Files/Minecraft/Projects/Minecraft-TPA-Datapack/scripts/lang/ja_jp.yml:374)  
  含有 `あなた`，建议：

  ```text
  以下はプレイヤーのデータパックIDとゲーム内名です。IDをクリックすると、そのプレイヤーにこちらへのテレポートをリクエストします。
  ```

- [`ja_jp.yml:422`](C:/Program%20Files/Minecraft/Projects/Minecraft-TPA-Datapack/scripts/lang/ja_jp.yml:422)  
  `メーニュを入る` 是明显错误。  
  建议：`クリックしてワープの説明編集メニューを開く`

- [`ja_jp.yml:435`](C:/Program%20Files/Minecraft/Projects/Minecraft-TPA-Datapack/scripts/lang/ja_jp.yml:435)  
  `他のプレイヤー（UID:%s）はワープが編集しています` 语法错误。  
  建议：`他のプレイヤー（UID:%s）がこのワープを編集中です`

- [`ja_jp.yml:453`](C:/Program%20Files/Minecraft/Projects/Minecraft-TPA-Datapack/scripts/lang/ja_jp.yml:453)  
  `'%1$sを%2$s'` 缺少谓语。  
  建议：`%1$sを%2$sに設定しました`

- [`ja_jp.yml:457`](C:/Program%20Files/Minecraft/Projects/Minecraft-TPA-Datapack/scripts/lang/ja_jp.yml:457)  
  `テレポートされました：%s` 很不自然。  
  建议：`%sへテレポートしました`

- [`ja_jp.yml:66`](C:/Program%20Files/Minecraft/Projects/Minecraft-TPA-Datapack/scripts/lang/ja_jp.yml:66)  
  Home 设置消息的占位符顺序目前不对。  
  当前类似 `ホーム#を%1$s設定しました%2$s`，应为：

  ```text
  ホーム#%1$sを%2$sに設定しました
  ```

总的建议是：`さん` 可以统一采用；`拒否/承認/キャンセル` 应按“谁执行、谁收到结果”分别使用主动句或被动句；`しまいました` 和 `していました` 不适合作为普通系统完成通知；`あちら` 不应作为 `こちら/そちら` 的机械替代，很多地方直接写 `%sさんのところ` 会更自然、更不容易产生视角错误。