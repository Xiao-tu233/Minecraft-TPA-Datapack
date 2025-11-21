data remove storage tpa:tpa lang
function tpa:init_storage_lang
# else:
execute if score #is_lang_extra_installed tpa.config matches 1 \
    run function tpa_extra:init_storage_lang

scoreboard objectives remove tpa.variables
scoreboard objectives add tpa.variables dummy
scoreboard objectives add tpa.config dummy
data remove storage tpa:tpa temp
scoreboard players operation #target_lang tpa.variables = #language tpa.config
function tpa:load_lang
execute if score #language tpa.config matches 0 run data modify storage tpa:tpa temp.lang set from storage tpa:tpa lang[0]
tellraw @a [{storage: "tpa:tpa", nbt: "temp.lang.header"}, {storage: "tpa:tpa", nbt: "temp.lang.load_title"}]

tellraw @a [{storage: "tpa:tpa", nbt: "temp.lang.header"}, {storage: "tpa:tpa", nbt: "temp.lang.load_add_objectives"}]
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
scoreboard objectives add tpa.is_online dummy
scoreboard objectives add tpa.spec dummy
scoreboard objectives add tpa.idfix trigger
scoreboard objectives add tpa.idfix_cd dummy
scoreboard objectives add tpa.back trigger
# scoreboard objectives add tpa.config dummy
# scoreboard objectives remove tpa.variables
# scoreboard objectives add tpa.variables dummy
scoreboard objectives add tpa.extended_menu trigger
scoreboard objectives add tpa.mute trigger
scoreboard objectives add tpa.output trigger
scoreboard objectives add tpa.search_id trigger
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
tellraw @a [{storage: "tpa:tpa", nbt: "temp.lang.header"}, {storage: "tpa:tpa", nbt: "temp.lang.load_added_objectives"}]
tellraw @a [{storage: "tpa:tpa", nbt: "temp.lang.header"}, {storage: "tpa:tpa", nbt: "temp.lang.load_reset_scores"}]
scoreboard players set #global_current tpa.player_id 1
scoreboard players set @a tpa.tp_to 0
scoreboard players set @a tpa.tp_here 0
scoreboard players set @a tpa.tpaccept 0
scoreboard players set @a tpa.req_timer 0
scoreboard players set @a tpa.if_death 0
scoreboard players set @a tpa.pos 0
tellraw @a [{storage: "tpa:tpa", nbt: "temp.lang.header"}, {storage: "tpa:tpa", nbt: "temp.lang.load_did_reset_scores"}]

tellraw @a [{storage: "tpa:tpa", nbt: "temp.lang.header"}, {storage: "tpa:tpa", nbt: "temp.lang.load_init_storage"}]
data remove storage tpa:tpa back
# data remove storage tpa:tpa extended_menu
# data remove storage tpa:tpa search_id
# data remove storage tpa:tpa book
# data remove storage tpa:tpa pos
# data remove storage tpa:tpa temp
# data remove storage tpa:tpa lang
# execute unless score #is_lang_extra_installed tpa.config matches 1 \
#     run function tpa:init_storage_lang
# # else:
# execute if score #is_lang_extra_installed tpa.config matches 1 \
#     run function tpa_extra:init_storage_lang

tellraw @a [{storage: "tpa:tpa", nbt: "temp.lang.header"}, {storage: "tpa:tpa", nbt: "temp.lang.load_initted_storage"}]

tellraw @a [{storage: "tpa:tpa", nbt: "temp.lang.header"}, {storage: "tpa:tpa", nbt: "temp.lang.load_remove_tags"}]
tag @a remove not_match
tag @a remove to_modify
tag @a remove tpa_book
tag @a remove id
tellraw @a [{storage: "tpa:tpa", nbt: "temp.lang.header"}, {storage: "tpa:tpa", nbt: "temp.lang.load_removed_tags"}]

tellraw @a [{storage: "tpa:tpa", nbt: "temp.lang.header"}, {storage: "tpa:tpa", nbt: "temp.lang.load_init_vars"}]
scoreboard players set #debug_mode tpa.config 0
scoreboard players set #version tpa.config 205
data remove storage tpa:tpa version
data modify storage tpa:tpa version set value "v2.0.5"
data modify storage tpa:tpa game_version set value "1.21.5"
execute unless score #tp_spec tpa.config = #tp_spec tpa.config run scoreboard players set #tp_spec tpa.config 0
execute unless score #remove_offline tpa.config = #remove_offline tpa.config run scoreboard players set #remove_offline tpa.config 0
execute unless score #carpet_fake_player_fix tpa.config = #carpet_fake_player_fix tpa.config run scoreboard players set #carpet_fake_player_fix tpa.config 0
execute unless score #back tpa.config = #back tpa.config run scoreboard players set #back tpa.config 0
execute unless score #search_id tpa.config = #search_id tpa.config run scoreboard players set #search_id tpa.config 0
execute unless score #book tpa.config = #book tpa.config run scoreboard players set #book tpa.config 0
execute unless score #player_lang tpa.config = #player_lang tpa.config run scoreboard players set #player_lang tpa.config 0
execute unless score #home tpa.config = #home tpa.config run scoreboard players set #home tpa.config 3
execute unless score #tp_pos tpa.config = #tp_pos tpa.config run scoreboard players set #tp_pos tpa.config 0
execute unless score #tp_pos_cooldown tpa.config = #tp_pos_cooldown tpa.config run scoreboard players set #tp_pos_cooldown tpa.config 36000
execute unless score #time_out tpa.config = #time_out tpa.config run scoreboard players set #time_out tpa.config 6000
execute unless score #idfix_cooldown tpa.config = #idfix_cooldown tpa.config run scoreboard players set #idfix_cooldown tpa.config 6000
execute unless score #frequency tpa.config = #frequency tpa.config run scoreboard players set #frequency tpa.config 20
execute if score #frequency tpa.config matches 0 run scoreboard players set #frequency tpa.config 20
execute unless score #language tpa.config = #language tpa.config run scoreboard players set #language tpa.config 0
# constants
scoreboard players set #-1 tpa.variables -1
scoreboard players set #5 tpa.variables 5
scoreboard players set #10 tpa.variables 10
scoreboard players set #14 tpa.variables 14
scoreboard players set #20 tpa.variables 20
# Variables initializations
scoreboard players set #commands_not_match tpa.variables 0
execute if score #carpet_fake_player_fix tpa.config matches 0 run tag @a remove fake_player
tellraw @a [{storage: "tpa:tpa", nbt: "temp.lang.header"}, {storage: "tpa:tpa", nbt: "temp.lang.load_initted_vars"}]

tellraw @a [\
    {storage: "tpa:tpa", nbt: "temp.lang.header"}, {storage: "tpa:tpa", nbt: "temp.lang.load_done"},\
    {storage: "tpa:tpa", nbt: "version", hover_event:{action:"show_text",value:{storage: "tpa:tpa", nbt: "temp.lang.load_version_hoverevent"}}}\
]
tellraw @a [{storage: "tpa:tpa", nbt: "temp.lang.header"}, {storage: "tpa:tpa", nbt: "temp.lang.load_welcome"}]
tellraw @a [{storage: "tpa:tpa", nbt: "temp.lang.header"}, {storage: "tpa:tpa", nbt: "temp.lang.load_copyright_claim"}]
tellraw @a [{storage: "tpa:tpa", nbt: "temp.lang.header"}, {storage: "tpa:tpa", nbt: "temp.lang.load_author"}]
tellraw @a [\
    {storage: "tpa:tpa", nbt: "temp.lang.header"}, " ", \
    {text:"§9Discord",hover_event:{action:"show_text",value:"https://discord.gg/QgkpxsFahw"},click_event:{action:"open_url",url:"https://discord.gg/QgkpxsFahw"}}," • ",\
    {text:"§cYouTube",hover_event:{action:"show_text",value:"https://www.youtube.com/channel/UCMOgi9XLPgVjLJRV6-YqQmg"},click_event:{action:"open_url",url:"https://www.youtube.com/channel/UCMOgi9XLPgVjLJRV6-YqQmg"}}," • ",\
    {text:"§bBilibili",hover_event:{action:"show_text",value:"https://space.bilibili.com/433412367"},click_event:{action:"open_url",url:"https://www.bilibili.com/space/433412367"}}," • ",\
    {text:"§rQQ群",hover_event:{action:"show_text",value:"点击复制群号: 814709389"},click_event:{action:"copy_to_clipboard",value:"814709389"}}, " • ", \
    {text:"§0Github",hover_event:{action:"show_text",value:"https://github.com/Xiao-tu233/Minecraft-TPA-Datapack"},click_event:{action:"open_url",url:"https://github.com/Xiao-tu233/Minecraft-TPA-Datapack"}}\
]
tellraw @a [\
    {storage: "tpa:tpa", nbt: "temp.lang.header"}, \
    {storage: "tpa:tpa", nbt: "temp.lang.load_button_options", color: "gold", click_event:{action:"run_command",command:"/function tpa:options"},hover_event:{action:"show_text",value:{storage: "tpa:tpa", nbt: "temp.lang.load_button_options_hoverevent"}}}," ",\
    {storage: "tpa:tpa", nbt: "temp.lang.load_button_help", color: "gold", click_event:{action:"run_command",command:"/function tpa:help"},hover_event:{action:"show_text",value:{storage: "tpa:tpa", nbt: "temp.lang.load_button_help_hoverevent"}}}," ",\
    {storage: "tpa:tpa", nbt: "temp.lang.load_button_update", color: "gold", click_event:{action:"run_command",command:"/function tpa:update"},hover_event:{action:"show_text",value:{storage: "tpa:tpa", nbt: "temp.lang.load_button_update_hoverevent"}}}," ",\
    {storage: "tpa:tpa", nbt: "temp.lang.load_button_license", color: "gold", click_event:{action:"run_command",command:"/function tpa:license"},hover_event:{action:"show_text",value:{storage: "tpa:tpa", nbt: "temp.lang.load_button_license_hoverevent"}}}]

execute unless score #language tpa.config matches 1.. run tellraw @a [\
    {\
        storage: "tpa:tpa", \
        nbt: "temp.lang.header" \
    }, \
    "检测到默认语言未设置, 请点击下方设置TPA数据包的服务器默认语言 | Detected Default language is not set, please click below to set default server language of TPA datapack:  ", \
    {\
        text: "[§a设置 | Set§r]", \
        click_event: {action: "run_command", command: "/function tpa:option_lang_menu"}\
    }\
]

#! 超级大饼:
# update langauge supportive
# Not using the official tick interface, instead use schedule function 

# v2.0.5 Change log:
# - 重写了低频率模式
# - 重写了传送主逻辑 修复了2.0.4的bug
# - 假人现在会拥有-1的ID 而不是2.0.4-的null
# - 语言的显示现在透过 storage 而不是独立函数
# - 优化了设置菜单
# - 重新加入了语言系统
# - 支持ingame keyboard input数据包作为依赖来键入指令
#    - 对于搜索ID和传送坐标为强依赖
#    - 对于其他功能为可选依赖
# - 减少了一些宏函数中宏参数的代入是以提升性能
# - 移除了休眠模式
# - 重写了包括展开菜单在内的众多功能
# - 传送点菜单中的传送点名称颜色现在与维度颜色相同而不是水蓝色
# - TPA菜单中的数字现在可以被点击
# - 
# 14. realize 1.15+ back, tp_pos, here
# Make fake player seporator a single datapack
# Support more versions by editting pack.mcmeta

# in 2.0.6:
# 传送前摇 落地空气检测
# public tp spot
# make head nods and shakes detectable
# support tab fills in keyboard