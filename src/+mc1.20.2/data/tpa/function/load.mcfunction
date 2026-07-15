# TPA load function: run when datapack loads

scoreboard objectives remove tpa.variables
scoreboard objectives add tpa.variables dummy
scoreboard objectives add tpa.config dummy
#<--!Script Version Inserting Locator-->
execute unless score #version tpa.config matches 210 run function tpa:initialize

execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug§r: Adding 42 objectives... (1/6)"]
scoreboard objectives add tpa trigger
scoreboard objectives add back trigger
scoreboard objectives add tpaccept trigger
scoreboard objectives add tpa.help trigger
scoreboard objectives add tpa.tpaccept trigger
scoreboard objectives add tpa.tpaccept_toggle trigger
scoreboard objectives add tpa.tpa trigger
scoreboard objectives add tpa.tpahere trigger
scoreboard objectives add tpa.simple_menu trigger
scoreboard objectives add tpa.tp_here dummy
scoreboard objectives add tpa.cancel_req trigger
scoreboard objectives add tpa.uid dummy
scoreboard objectives add tpa.is_online dummy
scoreboard objectives add tpa.spec dummy
scoreboard objectives add tpa.back trigger
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
scoreboard objectives add tpa.selected_language dummy
scoreboard objectives add tpa.warp trigger
# For only 1.20.4-
scoreboard objectives add tpa.available dummy
# For only 1.20.2-
scoreboard objectives add tpa.output_ dummy
# For only 1.21.6+
scoreboard objectives add tpa.dialog trigger
execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug§r: Objectives have been added. (1/6)"]
execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug§r: Resetting online player scores... (2/6)"]
scoreboard players set #global_current tpa.player_id 1
execute unless score #global_current tpa.uid = #global_current tpa.uid run scoreboard players set #global_current tpa.uid 1
scoreboard players set @a tpa.tpaccept 0
scoreboard players set @a tpa.if_death 0
scoreboard players set @a tpa.pos 0
scoreboard players set @a tpa.search_id.key 0
scoreboard players set @a tpa.search_id.capslock 0
execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug§r: Online player scores have been reset. (3/6)"]

execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug§r: Initializing data storage... (3/6)"]
data modify storage tpa:tpa back set value {}
data modify storage tpa:tpa requests set value []
data modify storage tpa:tpa request_menu.menus set value []
data modify storage tpa:tpa request_selector.req set value []
data modify storage tpa:tpa request_selector.recv set value []
data remove storage tpa:tpa search_id
data remove storage tpa:tpa book
data remove storage tpa:tpa temp


execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug§r: Data storage has been initialized. (4/6)"]

execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug§r: Removing tags... (4/6)"]
tag @a remove not_match
tag @a remove to_modify
tag @a remove id
kill @e[type=text_display, tag=tpa.license_displayer]
execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug§r: Tags are removed. (5/6)"]

execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug§r: Initializing variables... (5/6)"]
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
execute if score #carpet_fake_player_fix tpa.config matches 0 run tag @a remove tpa.fake_player
execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug§r: Variables initialized. (6/6)"]

# Load language file
scoreboard players operation #target_lang tpa.variables = #language tpa.config
function tpa:load_lang

tellraw @a [\
    {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.header"}, {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.load_done"}, {interpret: true, storage: "tpa:tpa", nbt: "option.version_range"}, {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.load_done_extra"},\
    {interpret: true, storage: "tpa:tpa", nbt: "option.version", hover_event:{action:"show_text",value:{interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.load_version_hoverevent"}}}\
]

tellraw @a [\
    {text:"§9Discord",hover_event:{action:"show_text", "value":"https://discord.gg/QgkpxsFahw"},click_event:{action:"open_url", url:"https://discord.gg/QgkpxsFahw"}}," • ",\
    {text:"§cYouTube",hover_event:{action:"show_text", "value":"https://www.youtube.com/channel/UCMOgi9XLPgVjLJRV6-YqQmg"},click_event:{action:"open_url", url:"https://www.youtube.com/channel/UCMOgi9XLPgVjLJRV6-YqQmg"}}," • ",\
    {text:"§bBilibili",hover_event:{action:"show_text", "value":"https://space.bilibili.com/433412367"},click_event:{action:"open_url", url:"https://www.bilibili.com/space/433412367"}}," • ",\
    {text:"§0Github",hover_event:{action:"show_text", "value":"https://github.com/Xiao-tu233/Minecraft-TPA-Datapack"},click_event:{action:"open_url", url:"https://github.com/Xiao-tu233/Minecraft-TPA-Datapack"}}\
]

# Show the publish date, with local format
function tpa:load/date_format
tellraw @a [\
    {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.header"}, {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.load_date_check[0]"}, \
    {interpret: true, storage: "tpa:tpa", nbt: "temp.option.dates[]", "separator": ""}, "(UTC+8)", {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.load_date_check[1]"}\
]

tellraw @a [{interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.header"}, {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.load_copyright_claim"}]

tellraw @a [{interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.header"}, {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.load_welcome"}]

execute if score #debug_mode tpa.config matches 1 run tellraw @a [\
    "[§bTPA§r] §6 Debug§r: Debug Mode has been automatically disabled due to reload. Click here to re-enable it: ", \
    {\
        text: "§6[§rRe-enable§6]", \
        hover_event: {action: "show_text", value: "§6Click to re-enable Debug Mode"}, \
        click_event: {action: "run_command", command: "/scoreboard players set #debug_mode tpa.config 1"}} \
]
scoreboard players set #debug_mode tpa.config 0

tellraw @a ["", \
    {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.load_button_options", color: "gold", click_event:{action:"run_command",command:"/function tpa:options"},hover_event:{action:"show_text",value:{interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.load_button_options_hoverevent"}}}," ",\
    {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.load_button_help", color: "gold", click_event:{action:"run_command",command:"/function tpa:help"},hover_event:{action:"show_text",value:{interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.load_button_help_hoverevent"}}}," ",\
    {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.load_button_update", color: "gold", click_event:{action:"run_command",command:"/function tpa:update"},hover_event:{action:"show_text",value:{interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.load_button_update_hoverevent"}}}," ",\
    {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.load_button_license", color: "gold", click_event:{action:"run_command",command:"/function tpa:license"},hover_event:{action:"show_text",value:{interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.load_button_license_hoverevent"}}} \
]

execute unless score #language tpa.config matches 1.. run tellraw @a [{interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.header"}, "检测到默认语言未设置, 请点击下方设置TPA数据包的服务器默认语言 | Detected Default language is not set, please click below to set default server language of TPA datapack:  ", {text: "[§a设置 | Set§r]", click_event:{action:"run_command",command: "/function tpa:option_lang_menu"}}]
function tpa:dimension/refresh
tellraw @a[predicate=tpa:output/show_chatbar] [{interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.reqer_first_join", click_event:{action:"run_command",command: "/trigger tpa"}}]


# Call the tick function if the option is enabled
execute if score #uses_tick_scheduling tpa.config matches 1 run function tpa:tick
