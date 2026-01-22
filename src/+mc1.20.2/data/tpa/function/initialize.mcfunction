# Parent function: tpa:load
# Update detect
execute if score #version tpa.config matches ..205 run scoreboard players set #is_updated_from_205 tpa.config 1

# Language Initialization
data modify storage tpa:tpa lang set value []
function tpa:init_storage_lang
function tpa_extra:init_storage_lang

scoreboard players set #version tpa.config 206
data modify storage tpa:tpa option.version set value "v2.0.6"
data modify storage tpa:tpa option.version_range set value "1.20.2 - 1.21.11"
function tpa:set_game_version
scoreboard players set #tp_spec tpa.config 0
execute if score #is_updated_from_205 tpa.config matches 1 run scoreboard players operation #compact_ids tpa.config = #remove_offline tpa.config
execute unless score #is_updated_from_205 tpa.config matches 0 run scoreboard players set #compact_ids tpa.config 0
execute if score #is_updated_from_205 tpa.config matches 1 run data remove storage tpa:tpa version
execute if score #is_updated_from_205 tpa.config matches 1 run data remove storage tpa:tpa game_version
execute if score #is_updated_from_205 tpa.config matches 1 run data remove storage tpa:tpa version_range
scoreboard players set #carpet_fake_player_fix tpa.config 0
scoreboard players set #back tpa.config 0
scoreboard players set #search_id tpa.config 0
scoreboard players set #book tpa.config 0
scoreboard players set #player_lang tpa.config 0
scoreboard players set #uses_tick_scheduling tpa.config 0
scoreboard players set #stricter_book_check tpa.config 0
scoreboard players set #home tpa.config 3
scoreboard players set #tp_pos tpa.config 0
scoreboard players set #tp_pos_cooldown tpa.config 36000
scoreboard players set #time_out tpa.config 6000
scoreboard players set #idfix_cooldown tpa.config 6000
scoreboard players set #warp tpa.config 0
scoreboard players set #dimension tpa.config 3
scoreboard players set #frequency tpa.config 20
execute if score #frequency tpa.config matches 0 run scoreboard players set #frequency tpa.config 20
scoreboard players set #language tpa.config 0

# Advanced options
scoreboard players set #sequence_timer tpa.config 30

# Default max_command_sequence_length if which was set so small
execute store result score #max_command_sequence_length tpa.variables run gamerule maxCommandChainLength
execute if score #max_command_sequence_length tpa.variables matches ..65535 run gamerule maxCommandChainLength 65536

# For v2.0.5-, 1.15-1.20.1, it's 2, for 1.20.2+ it's 1, for v2.0.6+, 1.15-1.20.1 it's 3
scoreboard players set #home_storage_format tpa.config 1

# For only 1.15 - 1.20.1

scoreboard players set #uses_string_dimension tpa.config 1
scoreboard players set #uses_binary_teleport tpa.config 0
execute if score #is_updated_from_205 tpa.config matches 1 run scoreboard players operation #anchor_search_retries tpa.config = #teleport_threshold_retry tpa.config
execute unless score #is_updated_from_205 tpa.config matches 1 run scoreboard players set #anchor_search_retries tpa.config 150
execute if score #is_updated_from_205 tpa.config matches 1 run scoreboard players operation #max_anchor_summons_attempts tpa.config = #teleport_threshold_retry_summon tpa.config
execute unless score #is_updated_from_205 tpa.config matches 1 run scoreboard players set #max_anchor_summons_attempts tpa.config 5

# Init data storage
data modify storage tpa:tpa warp set value [{}]
data modify storage tpa:tpa option.dimension set value [{id: 0, namespaceid: "minecraft:overworld", color: "green"}, {id: -1, namespaceid: "minecraft:the_nether", color: "red"}, {id: 1, namespaceid: "minecraft:the_end", color: "light_purple"}]


# |  # | 维度名称（示例）                              | 来源模组                                | 常见命名空间 ID / 常见整数 ID（若有）                                  | 推荐颜色 (HEX) | 备注                                                       |
# | -: | ------------------------------------- | ----------------------------------- | -------------------------------------------------------- | ---------: | -------------------------------------------------------- |
# |  1 | Overworld（主世界）                        | Vanilla                             | `minecraft:overworld` / `0`                              |  `#6FCF97` | 必支持（基础）。                                                 |
# |  2 | Nether（下界）                            | Vanilla                             | `minecraft:the_nether` / `-1`                            |  `#FF6F59` | 必支持（基础）。                                                 |
# |  3 | The End（末地）                           | Vanilla                             | `minecraft:the_end` / `1`                                |  `#9B51E0` | 必支持（基础）。                                                 |
# |  4 | Twilight Forest（暮色森林）                 | The Twilight Forest                 | `twilightforest:twilight_forest` / 常见默认整数 `7`            |  `#5E7B7C` | 旧版常为 `7`，但可配置。([Feed The Beast][1])                      |
# |  5 | The Betweenlands（幽冥沼泽）                | The Betweenlands                    | `betweenlands:betweenlands` / 常见默认整数 `20`                |  `#3B5D33` | 大型独立维度，配置可改。([The Betweenlands Wiki][2])                 |
# |  6 | Aether（天界 / Aether II）                | Aether / Aether II                  | `aether:aether`（或 `aether:aether_dimension`） / 常见整数视版本而定 |  `#AECFF2` | 天空/浮岛主题维度（多版本差异）。                                        |
# |  7 | Galacticraft — Moon（月球）               | Galacticraft (+ Planets)            | `galacticraft:moon` / 常见整数 `-28`（示例）                     |  `#7C9CEB` | Galacticraft 常见多个行星维度（Moon/Mars/Venus/...）。([饲养野兽维基][3]) |
# |  8 | Galacticraft — Mars（火星）               | Galacticraft                        | `galacticraft:mars` / 常见整数（可变）                           |  `#D56B4A` | 同上。([饲养野兽维基][3])                                         |
# |  9 | Galacticraft — Venus（金星）              | Galacticraft                        | `galacticraft:venus` / 常见整数（可变）                          |  `#F1C27D` | 同上。([饲养野兽维基][3])                                         |
# | 10 | Galacticraft — SpaceStation（空间站）      | Galacticraft                        | `galacticraft:space_station` / 常见整数（可变）                  |  `#9FB4FF` | 多模组包会包含 SpaceStation。([饲养野兽维基][3])                       |
# | 11 | Abyssal Wasteland（深渊荒原）               | AbyssalCraft                        | `abyssalcraft:abyssal_wasteland` / 常见整数 `50`（示例）         |  `#6B2833` | AbyssalCraft 系列维度（可配置）。([SevTech: Ages Wiki][4])         |
# | 12 | Atum（古埃及主题）                           | Atum / Atum 2                       | `atum:atum` / 有时存在默认整数 ID（取决版本）                          |  `#D9B56A` | 沙漠/神殿主题维度。                                               |
# | 13 | DivineRPG — Eden / 等多个                | DivineRPG                           | `divinerpg:eden`（等多个） / 多个整数 ID（旧版）                      |  `#8FE0C2` | DivineRPG 内含若干独立维度（需按具体维度列出）。                            |
# | 14 | The Erebus                            | Erebus                              | `erebus:erebus` / 可能有整数 ID（取决版本）                         |  `#5A3E2B` | 昆虫/远古丛林主题维度。                                             |
# | 15 | The Midnight（午夜）                      | The Midnight                        | `themidnight:the_midnight`                               |          — | 黑暗、梦魇主题维度（命名空间常见）。                                       |
# | 16 | Undergarden（地下花园）                     | Undergarden                         | `undergarden:undergarden`                                |  `#25412E` | 新型地下/菌类维度（常见 modid）。                                     |
# | 17 | Dimensional Doors — Limbo（临界 / Limbo） | Dimensional Doors                   | `dimdoors:limbo`（或 `dimensionaldoors:limbo`）             |  `#B08AEB` | DimDoors 常带 Limbo / 门相关维度。                               |
# | 18 | Blue Skies（天空模组）                      | Blue Skies                          | `blue_skies:<...>`（具体维度名需确认）                             |  `#A0E7FF` | 多浮空/幻想天空维度（模组内多个维度）。                                     |
# | 19 | The Beneath（Beneath）                  | The Beneath                         | `beneath:beneath`                                        |  `#483C2D` | 地底/暗黑主题维度（模组不同实现）。                                       |
# | 20 | The Midnight / The Maw 等（同类）          | （若干「午夜/梦魇」模组）                       | `themidnight:<name>` / 视模组而定                             |  `#18202B` | 不同模组命名不同，需按 mod 查。                                       |
# | 21 | Underdark / Deeper & Darker（地下深渊）     | Deeper & Darker / DeeperAndDarker   | `deeperdarker:darklands`（示例）                             |  `#111111` | 新兴大型地下维度，模组差异大。                                          |
# | 22 | Voidscape / Voidcraft                 | Voidscape                           | `voidscape:voidscape`                                    |  `#0B2341` | 虚空类维度（小众模组）。                                             |
# | 23 | The Promised Land（BOP / 额外）           | Biomes O' Plenty / 扩展               | `biomesoplenty:promised_land`（若存在） / 参 pack 配置           |  `#C8D337` | BOP 部分扩展包会加维度（需按 pack 确认）。                               |
# | 24 | Extra Utilities — Deep Dark（示例）       | Extra Utilities / Extra Utilities 2 | `extrautils:deep_dark` / 旧包可能为整数                         |  `#1E1E1E` | 仅示例，Deep/深层地下类维度常见。                                      |
# | 25 | Advent of Ascension（AoA）— 多个维度        | Advent of Ascension (AoA)           | `aoa3:<dimension_name>`（大量维度）                            |  `#E29F6A` | AoA 含大量自家维度（强烈建议按 mod 列出你要支持的那些）。                        |
# | 26 | Atum / Atum 2（已列） — 另一实例              | Atum2（如 `atum:the_sands`）           | `atum:<dimension>`                                       |  `#CDAA6E` | 若包里包含 Atum，请列出实际维度名与 ID。                                 |
# | 27 | The Aether Legacy / Aether II（另一个实现）  | Aether Legacy                       | `aether_legacy:aether`（示例）                               |  `#D8F0FF` | 不同 Aether 复刻版命名各异。                                       |
# | 28 | Erebus 小维度 / 扩展                       | Erebus（子维度）                         | `erebus:<sub_dim>`                                       |  `#6B4C3B` | 有些模组内部有多个子维度/子区。                                         |
# | 29 | Atum / The Betweenlands 等的副维度         | （举例）                                | `modid:dimension_name`（按包确认）                             |  `#9FAF8B` | 许多模组会包含额外“子维度”或小区。                                       |
# | 30 | 自定义 / 服务器专用维度（示例）                     | 定制模组 / 服务器插件                        | 格式通常是 `modid:...` 或 整数 ID（旧版）                            |  `#AAAAAA` | 保留项：给服务器运维自定义填写。                                         |