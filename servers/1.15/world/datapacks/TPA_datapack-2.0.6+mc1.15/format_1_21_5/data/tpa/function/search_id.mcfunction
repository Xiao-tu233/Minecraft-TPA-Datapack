scoreboard players set @s tpa.search_id 0
function tpa:load_lang
execute if score #search_id tpa.variables matches 1 run function tpa:sounds/no
execute if score #search_id tpa.config matches 1 run tellraw @s[scores={tpa.output=1..2}] [\
    {storage: "tpa:tpa", nbt: "temp.lang.header"}, \
    {storage: "tpa:tpa", nbt: "temp.lang.search_id_disabled"}, \
    ". " \
]
execute if score #search_id tpa.config matches 1 run title @s[scores={tpa.output=1..2}] actionbar [{storage: "tpa:tpa", nbt: "temp.lang.search_id_disabled"}]
execute if score #search_id tpa.config matches 1 run return 0

execute store result score #is_key_installed tpa.variables if score #version key.cfg matches 1..
execute unless score #is_key_installed tpa.variables matches 1.. run \
    tellraw @s "[§bTPA§r] Search ID now needs dependency of datapack of ingame keyboard."
execute if score #is_key_installed tpa.variables matches 1.. run \
    data modify storage key:key temp.suggest_command set value '/tpa '
execute if score #is_key_installed tpa.variables matches 1.. run \
    function key:open_chatbar