# TPA load function: run when datapack loads

scoreboard objectives remove tpa.variables
scoreboard objectives add tpa.variables dummy
scoreboard objectives add tpa.config dummy
execute unless score #version tpa.config matches 206 run function tpa:initialize

# Load language file
scoreboard players operation #target_lang tpa.variables = #language tpa.config
function tpa:load_lang

tellraw @a [{storage: "tpa:tpa", nbt: "loaded_lang.header"}, {storage: "tpa:tpa", nbt: "loaded_lang.load_title"}]

tellraw @a [{storage: "tpa:tpa", nbt: "loaded_lang.header"}, {storage: "tpa:tpa", nbt: "loaded_lang.load_add_objectives"}]
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
scoreboard objectives add tpa.uid dummy
scoreboard objectives add tpa.is_online dummy
scoreboard objectives add tpa.spec dummy
scoreboard objectives add tpa.idfix trigger
scoreboard objectives add tpa.idfix_cd dummy
scoreboard objectives add tpa.back trigger
scoreboard objectives add tpa.extended_menu trigger
scoreboard objectives add tpa.mute trigger
scoreboard objectives add tpa.output trigger
scoreboard objectives add tpa.search_id trigger
scoreboard objectives add tpa.search_id.key trigger
scoreboard objectives add tpa.search_id.capslock dummy
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
scoreboard objectives add tpa.warp trigger
# For only 1.20.4-
scoreboard objectives add tpa.available dummy
# For only 1.20.2-
scoreboard objectives add tpa.output_ dummy
scoreboard objectives add tpa.dialog trigger
# scoreboard objectives add tpa.head_gestures dummy
# scoreboard objectives add tpa.yaw dummy
# scoreboard objectives add tpa.pitch dummy
# scoreboard objectives add tpa.yaw.origin dummy
# scoreboard objectives add tpa.pitch.origin dummy
# scoreboard objectives add tpa.first_extreme dummy
# scoreboard objectives add tpa.second_extreme dummy
# scoreboard objectives add tpa.hg.interval_timer dummy
# scoreboard objectives add tpa.hg.sequence_timer dummy
tellraw @a [{storage: "tpa:tpa", nbt: "loaded_lang.header"}, {storage: "tpa:tpa", nbt: "loaded_lang.load_added_objectives"}]
tellraw @a [{storage: "tpa:tpa", nbt: "loaded_lang.header"}, {storage: "tpa:tpa", nbt: "loaded_lang.load_reset_scores"}]
scoreboard players set #global_current tpa.player_id 2
execute unless score #global_current tpa.uid = #global_current tpa.uid run scoreboard players set #global_current tpa.uid 2
execute if score #compact_ids tpa.config matches 0 run scoreboard players set @a tpa.player_id 1
scoreboard players set @a tpa.tp_to 0
scoreboard players set @a tpa.tp_here 0
scoreboard players set @a tpa.tpaccept 0
scoreboard players set @a tpa.req_timer 0
scoreboard players set @a tpa.if_death 0
scoreboard players set @a tpa.pos 0
scoreboard players set @a tpa.search_id.key 0
scoreboard players set @a tpa.search_id.capslock 0
tellraw @a [{storage: "tpa:tpa", nbt: "loaded_lang.header"}, {storage: "tpa:tpa", nbt: "loaded_lang.load_did_reset_scores"}]

tellraw @a [{storage: "tpa:tpa", nbt: "loaded_lang.header"}, {storage: "tpa:tpa", nbt: "loaded_lang.load_init_storage"}]
data modify storage tpa:tpa back set value {}
data remove storage tpa:tpa search_id
data remove storage tpa:tpa book
data remove storage tpa:tpa temp

tellraw @a [{storage: "tpa:tpa", nbt: "loaded_lang.header"}, {storage: "tpa:tpa", nbt: "loaded_lang.load_initted_storage"}]

tellraw @a [{storage: "tpa:tpa", nbt: "loaded_lang.header"}, {storage: "tpa:tpa", nbt: "loaded_lang.load_remove_tags"}]
tag @a remove not_match
tag @a remove to_modify
tag @a remove id
kill @e[type=text_display, tag=tpa.license_displayer]
tellraw @a [{storage: "tpa:tpa", nbt: "loaded_lang.header"}, {storage: "tpa:tpa", nbt: "loaded_lang.load_removed_tags"}]

tellraw @a [{storage: "tpa:tpa", nbt: "loaded_lang.header"}, {storage: "tpa:tpa", nbt: "loaded_lang.load_init_vars"}]
# constants
scoreboard players set #-1 tpa.variables -1
scoreboard players set #2 tpa.variables 2
scoreboard players set #3 tpa.variables 3
scoreboard players set #4 tpa.variables 4
scoreboard players set #5 tpa.variables 5
scoreboard players set #9 tpa.variables 9
scoreboard players set #14 tpa.variables 14
scoreboard players set #16 tpa.variables 16
scoreboard players set #20 tpa.variables 20
scoreboard players set #100 tpa.variables 100
# Variables initializations
scoreboard players set #commands_not_match tpa.variables 0
scoreboard players set #debug_mode tpa.config 0
execute if score #carpet_fake_player_fix tpa.config matches 0 run tag @a remove tpa.fake_player
tellraw @a [{storage: "tpa:tpa", nbt: "loaded_lang.header"}, {storage: "tpa:tpa", nbt: "loaded_lang.load_initted_vars"}]

tellraw @a [\
    {storage: "tpa:tpa", nbt: "loaded_lang.header"}, {storage: "tpa:tpa", nbt: "loaded_lang.load_done"}, {storage: "tpa:tpa", nbt: "option.version_range"}, {storage: "tpa:tpa", nbt: "loaded_lang.load_done_extra"},\
    {storage: "tpa:tpa", nbt: "option.version", hover_event:{action:"show_text",value:{storage: "tpa:tpa", nbt: "loaded_lang.load_version_hoverevent"}}}\
]

# Show the publish date, with local format
function tpa:load_date_format
tellraw @a [\
    {storage: "tpa:tpa", nbt: "loaded_lang.header"}, {storage: "tpa:tpa", nbt: "loaded_lang.load_date_check_left_part"}, \
    {storage: "tpa:tpa", nbt: "temp.option.dates[]", "separator": ""}, "(UTC+8)", {storage: "tpa:tpa", nbt: "loaded_lang.load_date_check_right_part"}\
]
tellraw @a [{storage: "tpa:tpa", nbt: "loaded_lang.header"}, {storage: "tpa:tpa", nbt: "loaded_lang.load_welcome"}]
tellraw @a [{storage: "tpa:tpa", nbt: "loaded_lang.header"}, {storage: "tpa:tpa", nbt: "loaded_lang.load_copyright_claim"}]
tellraw @a [{storage: "tpa:tpa", nbt: "loaded_lang.header"}, {storage: "tpa:tpa", nbt: "loaded_lang.load_author"}]
tellraw @a [\
    {storage: "tpa:tpa", nbt: "loaded_lang.header"}, " ", \
    {text:"§9Discord",hover_event:{action:"show_text", "value":"https://discord.gg/QgkpxsFahw"},click_event:{action:"open_url", url:"https://discord.gg/QgkpxsFahw"}}," • ",\
    {text:"§cYouTube",hover_event:{action:"show_text", "value":"https://www.youtube.com/channel/UCMOgi9XLPgVjLJRV6-YqQmg"},click_event:{action:"open_url", url:"https://www.youtube.com/channel/UCMOgi9XLPgVjLJRV6-YqQmg"}}," • ",\
    {text:"§bBilibili",hover_event:{action:"show_text", "value":"https://space.bilibili.com/433412367"},click_event:{action:"open_url", url:"https://www.bilibili.com/space/433412367"}}," • ",\
    {text:"§rQQ群",hover_event:{action:"show_text", "value":"点击复制群号: 814709389"},click_event:{action:"copy_to_clipboard", value:"814709389"}}, " • ", \
    {text:"§0Github",hover_event:{action:"show_text", "value":"https://github.com/Xiao-tu233/Minecraft-TPA-Datapack"},click_event:{action:"open_url", url:"https://github.com/Xiao-tu233/Minecraft-TPA-Datapack"}}\
]
tellraw @a [\
    {storage: "tpa:tpa", nbt: "loaded_lang.header"}, \
    {storage: "tpa:tpa", nbt: "loaded_lang.load_button_options", color: "gold", click_event:{action:"run_command",command:"/function tpa:options"},hover_event:{action:"show_text",value:{storage: "tpa:tpa", nbt: "loaded_lang.load_button_options_hoverevent"}}}," ",\
    {storage: "tpa:tpa", nbt: "loaded_lang.load_button_help", color: "gold", click_event:{action:"run_command",command:"/function tpa:help"},hover_event:{action:"show_text",value:{storage: "tpa:tpa", nbt: "loaded_lang.load_button_help_hoverevent"}}}," ",\
    {storage: "tpa:tpa", nbt: "loaded_lang.load_button_update", color: "gold", click_event:{action:"run_command",command:"/function tpa:update"},hover_event:{action:"show_text",value:{storage: "tpa:tpa", nbt: "loaded_lang.load_button_update_hoverevent"}}}," ",\
    {storage: "tpa:tpa", nbt: "loaded_lang.load_button_license", color: "gold", click_event:{action:"run_command",command:"/function tpa:license"},hover_event:{action:"show_text",value:{storage: "tpa:tpa", nbt: "loaded_lang.load_button_license_hoverevent"}}}]

execute unless score #language tpa.config matches 1.. run tellraw @a [{storage: "tpa:tpa", nbt: "loaded_lang.header"}, "检测到默认语言未设置, 请点击下方设置TPA数据包的服务器默认语言 | Detected Default language is not set, please click below to set default server language of TPA datapack:  ", {text: "[§a设置 | Set§r]", click_event:{action:"run_command",command: "/function tpa:option_lang_menu"}}]
function tpa:dimension/refresh
tellraw @a[predicate=tpa:output/show_chatbar] [{storage:"tpa:tpa", nbt:"loaded_lang.reqer_first_join", click_event:{action:"run_command",command: "/trigger tpa"}}]


# Call the tick function if the option is enabled
execute if score #uses_tick_scheduling tpa.config matches 1 run function tpa:tick
