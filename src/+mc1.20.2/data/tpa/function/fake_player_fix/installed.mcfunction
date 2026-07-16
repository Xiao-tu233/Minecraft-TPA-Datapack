scoreboard players set #carpet_fake_player_fix tpa.config 1
execute as @a run function tpa:fake_player_fix/tag {cmd: "script run query(player(), 'player_type') == 'fake'"}
execute store result score ##fake_player_fix.tagged_players tpa.variables if entity @a[tag=tpa.fake_player]
execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug§r: Enabled Carpet Fake Player Fix, and tagged", {score: {name: "#fake_player_fix.tagged_players", objective: "tpa.variables"}}, " fake player(s)."]