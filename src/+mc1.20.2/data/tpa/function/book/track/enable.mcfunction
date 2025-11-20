# Called by: (player) Any OP, Quoted by: tpa:options.stricter_book_check.enable_clickEvent

scoreboard players set #bookshelf_raycast_installed tpa.variables 0
execute if entity @n[tag=bs.entity, tag=bs.persistent] run scoreboard players set #bookshelf_raycast_installed tpa.variables 1

execute if score #bookshelf_raycast_installed tpa.variables matches 1 run \
    scoreboard players set #stricter_book_check tpa.config 1
execute if score #bookshelf_raycast_installed tpa.variables matches 1 run \
    return 0

# if(!is_carpet_installed)
    scoreboard players set #stricter_book_check tpa.config 0
    scoreboard players operation #target_lang tpa.variables = #language tpa.config
    function tpa:load_lang
    tellraw @a [{"storage": "tpa:tpa", "nbt": "loaded_lang.header"}, {"storage": "tpa:tpa", "nbt": "loaded_lang.option_stricter_book_check_disabled"}]
