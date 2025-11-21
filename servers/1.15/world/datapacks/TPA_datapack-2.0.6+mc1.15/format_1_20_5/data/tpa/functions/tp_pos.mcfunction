scoreboard players set @s tpa.pos 0
function tpa:load_lang
execute store result score #is_key_installed tpa.variables if score #version key.cfg matches 1..
execute unless score #is_key_installed tpa.variables matches 1.. run \
    tellraw @s "[§bTPA§r] Teleport specific position now needs dependency of datapack of ingame keyboard."
execute if score #is_key_installed tpa.variables matches 1.. run \
    data modify storage key:key temp.suggest_command set value '/tpa '
execute if score #is_key_installed tpa.variables matches 1.. run \
    function key:open_chatbar