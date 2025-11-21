#> tpa:tick.mcfunction
scoreboard players enable @a tpa
scoreboard players enable @a help
scoreboard players enable @a language
scoreboard players enable @a tpaccept
scoreboard players enable @a idfix
scoreboard players enable @a back
scoreboard players enable @a cancel_req
scoreboard players enable @a lang_menu
scoreboard players enable @a tpamenu
scoreboard players enable @a to_mute
scoreboard players enable @a search_id
scoreboard players enable @a tpahere

execute as @a[scores={tpa=1..}] run function tpa:tpa
execute as @a[scores={tpaccept=1..}] run function tpa:tpaccept
execute as @a unless score @s tpaccept_toggle matches 0..1 run scoreboard players set @s tpaccept_toggle 0
execute as @a[scores={tpaccept=-1}] run function tpa:tpadeny
execute as @a[scores={cancel_req=1..}] run function tpa:cancel_req
execute as @a[scores={lang_menu=1..}] run function tpa:lang_menu
execute as @a[scores={tpamenu=1..}] run function tpa:tpamenu
execute as @a[scores={to_mute=1..}] run function tpa:mute
execute as @a unless score @s mute matches 0..1 run scoreboard players set @s mute 0
execute as @a[scores={search_id=1..}] run function tpa:search_id
execute as @a[scores={tpahere=1..}] run function tpa:tpahere
# Before 1.20.2:
# execute as @a[nbt={SelectedItem:{components:{"minecraft:custom_data": {isSearchIdBook: 1b}}}},scores={detect_input_name=1}] # if data entity @s SelectedItem.components.minecraft:writable_book_content.pages[0] # run function tpa:search_id_detected

# tag requester
tag @a[scores={tp_to=2..}] add tp_reqer
tag @a[scores={tp_here=2..}] add tp_reqer
tag @a[scores={tp_to=..1,tp_here=..1}] remove tp_reqer
execute as @a[scores={idfix=1..}] run function tpa:idfix


# time out detect
# timer[@a[tag=tp_to]] -= 1
# timer[@a[tag=tp_here]] -= 1
scoreboard players remove @a[tag=tp_reqer] timer 1
# only timer matches 0 will be selected to make sure -1 score holder won't be told time out
execute as @a[scores={timer=0},tag=tp_reqer] run function tpa:time_out


# offline detect
execute store result score #player_online_to_compare tpa_variables if entity @a
execute unless score #player_online_to_compare tpa_variables = #player_online tpa_variables if score #remove_offline tpa_config matches 1 run function tpa:idfix
scoreboard players operation #player_online tpa_variables = #player_online_to_compare tpa_variables
scoreboard players set #player_online_to_compare tpa_variables 0

# execute as @a[scores={help=1..}] run schedule function tpa:help 1t replace
execute as @a[scores={help=1..}] run function tpa:help

# detect if back is enabled
execute if score #back tpa_config matches 1 as @a[scores={back=1..}] run function tpa:back
execute if score #back tpa_config matches 0 as @a[scores={back=1..}] run function tpa:langtell/langtell_41

execute as @a[scores={language=3..}] run scoreboard players set @s language 0
execute as @a unless score @s player_id matches -1 unless score @s player_id matches 2.. run function tpa:giveid
execute if score #tp_spec tpa_config matches 1 as @a[gamemode=spectator,tag=!spec] run function tpa:spec
execute if score #tp_spec tpa_config matches 1 as @a[gamemode=!spectator,tag=spec] run function tpa:unspec
