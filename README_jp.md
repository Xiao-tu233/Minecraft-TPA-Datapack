
---

# Minecraft-TPA-Datapack

---

[![Minecraft Website](https://img.shields.io/badge/Minecraft-green)](https://www.minecraft.net/)
[![License](https://img.shields.io/github/license/MCDReforged/MCDReforged.svg)](https://github.com/Xiao-tu233/Minecraft-TPA-Datapack/edit/main/LICENSE)

オプション依存: [![Carpet mod](https://img.shields.io/badge/Carpet-Mod-green)](https://modrinth.com/mod/carpet), [![Bookshelf Datapack](https://img.shields.io/badge/Book-Shelf-green)](https://github.com/mcbookshelf/bookshelf)

[English(United States)](https://github.com/Xiao-tu233/Minecraft-TPA-Datapack/blob/main/README.md) · [简体中文(中国大陆)](https://github.com/Xiao-tu233/Minecraft-TPA-Datapack/blob/main/README_zhcn.md) · [正體中文(臺灣)](https://github.com/Xiao-tu233/Minecraft-TPA-Datapack/blob/main/README_zhtw.md) · **日本語(日本)** · [その他の言語](https://github.com/Xiao-tu233/Minecraft-TPA-Datapack/blob/main/languages.md) 


TPA データパックは、非 OP プレイヤーでも簡単に互いにテレポートできる Minecraft データパックです。また、Back、Home、Warp、複数言語対応などの追加機能も提供されています。

詳細情報や意見を提供したい場合は、ぜひ私たちのソーシャルメディアをフォローしてください！

[![Discord](https://img.shields.io/badge/Discord-blue)](https://discord.gg/QgkpxsFahw) · [![YouTube](https://img.shields.io/badge/YouTube-red)](https://www.youtube.com/channel/UCMOgi9XLPgVjLJRV6-YqQmg) · [![Bilibili](https://img.shields.io/badge/Bilibili-aqua)](https://www.bilibili.com/space/433412367) · [![Bilibili](https://img.shields.io/badge/Bilibili-_space-aqua)](https://space.bilibili.com/433412367) · ![QQ グループ](https://img.shields.io/badge/QQ-_%E7%BE%A4-white):814709389

## 特徴

* `/function tpa:options` コマンドで全ての選項を編集可能です。設定ミスによる悪い体験を心配する必要はありません。
* インストールは非常に簡単です：データパックを使用します。データパックは Minecraft に簡単に導入できるコンテンツ形式で、拡張やローダーは不要です。
* 他のデータパック／MOD／プラグイン／資源包との互換性も積極的に確認しています。そのため、TPA データパックが原因でない可能性のあるバグでも、再現方法とともに報告可能です。
* 2 つのバージョンを提供しています：**完全版** と **軽量版**。完全版にはすべての機能が含まれており、軽量版は基本機能のみを含むので、利用者のニーズに応じて選択できます。

## 動作原理

Minecraft 1.13 以降、バニラ画面を通じて動作します。

## ダウンロードするバージョンの選び方

下表で、Minecraft のバージョンに対応するデータパックのファイルサフィックスを確認してください。
**Minecraft バージョンとデータパックファイルサフィックス対応表**

| ゲームバージョン| 完全版 | 軽量版 |
| :-- | --: | --: |
| 1.13 - 1.14.4 | +mc1.13 | light+mc1.13 |
| 1.15 - 1.20.1 | +mc1.15 | light+mc1.13 |
| 1.20.2 - 1.20.6 | +mc1.20.2 | light+mc1.13 |
| 1.21 - 1.21.4 | +mc1.20.2 | light+mc1.21 |
| 1.21.5 - | +mc1.20.2 | light+mc1.21.5 |

軽量版 最新バージョン：v2.0.6
完全版 最新バージョン：v2.0.6

1. 現在のゲームバージョンを確認します。
2. 完全版または軽量版を選択します。違いは以下の通りです：

   * 軽量版は基本機能のみ：テレポートと選單。
   * 完全版は全ての機能を含みます：Back、Home、Warp、複数言語対応（将来的にさらに追加予定あり）。
3. *Releases* ページからダウンロードします。

例：
Minecraft バージョンが 1.20.1 で、完全版を使用したい場合、ファイル名 `TPA_datapack-v2.0.6+mc1.15.zip` を選択します。

## インストール方法

他のデータパックと基本的に同じです。すでに知っている場合は読み飛ばしてください。

### クラウドサーバーの場合

1. ホスティングサーバーの端末を開きます。
2. *檔案管理* と書かれたボタンをクリックします。
3. 以下の手順はローカルサーバーの手順と同じです。

### ローカルサーバーの場合

1. サーバー JAR ファイルがあるフォルダを開きます。
2. `world` フォルダがあれば、`./world/datapacks/` に移動します。
3. フォルダがない場合、または第 4 ステップでうまくいかない場合、`server.properties -> level-name` を確認して正しい世界フォルダを探します。
4. データパックファイルを `datapacks` フォルダに入れます。
5. サーバーを起動して `/reload` を実行し、`/datapack list` で認識されていることを確認します。

### シングルプレイヤーの場合

1. ワールドを終了します。
2. ワールド選択画面で対象の世界を選択します。
3. 左下の `編集` ボタンをクリックします。
4. `世界フォルダを開く` ボタンをクリックします。もしあれば、第 8 ステップをスキップします。
5. ワールド選択画面に戻り、タイトル下の灰色の文字を覚えておきます。
6. メインメニューから `オプション... -> 資源包... -> パックフォルダを開く...` を選択します。
7. 上位フォルダ（通常 `.minecraft`）に移動し、`saves` フォルダを開き、先ほどの灰色文字に対応するフォルダに移動します（パス例: `../saves/(世界名)/datapacks`）。
8. `datapacks` フォルダにデータパックファイルを入れます。
9. 世界に入り、`/datapack list` で認識されていることを確認します。

### 新しい世界を作成する場合

1. `その他 -> データパック -> パックフォルダを開く` をクリックします。
2. データパックファイルを入れます。
3. 世界を作成します。
4. `/datapack list` で認識されていることを確認します。

## 使用方法

詳細な使用方法は Wiki を参照してください：[wiki](https://github.com/Xiao-tu233/Minecraft-TPA-Datapack/wiki)

## 結び

TPA データパックをご利用いただきありがとうございます！
最新バージョン：完全版 v2.0.6、軽量版 v2.0.6
最終編集日：2025 年(令和7年) 11 月 11 日
翻訳：ChatGPT Requested by Xiao_tu233
---
