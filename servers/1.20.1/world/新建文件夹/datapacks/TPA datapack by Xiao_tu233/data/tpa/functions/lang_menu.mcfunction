#> tpa:lang_menu.mcfunction
execute if score #debug_mode tpa_config matches 1 run tellraw @a "[§bTPA§r] §6 Debug: §rNow executing: §atpa:lang_menu"
tellraw @a ["[§bTPA§r] ",{"text":"§rEnglish(US)","clickEvent":{"action":"run_command","value":"/trigger language set 0"}}," • ",{"text":"§r简体中文(中国大陆)","clickEvent":{"action":"run_command","value":"/trigger language set 1"}}," • ",{"text":"§r繁體中文(臺灣)","clickEvent":{"action":"run_command","value":"/trigger language set 2"}}]

scoreboard players set @s lang_menu 0