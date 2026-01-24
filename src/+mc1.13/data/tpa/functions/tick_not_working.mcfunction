# Called by: (Player) Any Operator

# Reactivate if tick temporarily disabled
execute if score #frequency tpa.config matches 0 run scoreboard players set #frequency tpa.config 20

# Disable command block output to avoid spamming "Executing function tpa:tick"
gamerule commandBlockOutput false
give @s minecraft:repeating_command_block{display:{Name:"\"§r§b在合适的地方把它放下\""}, BlockEntityTag: {Command: "function tpa:tick", conditionMet: 1b, auto: 1b}}
tellraw @a ["你现在正在调用Tick不工作函数 因此你应该遇到了Tick函数不工作的情况 你现在可以实现以下两种方式的其中一种:"]
tellraw @a ["        1. 设置使用/schedule指令调用Tick函数", {"text": "§b[设置]", "hoverEvent": {"action": "show_text", "value": {"text": "§b点击设置/schedule指令调用Tick函数"}}, "clickEvent": {"action":  "run_command", "value": "/scoreboard players set #uses_tick_scheduling tpa.config 1"}}]
tellraw @a ["   或者 2. 把你手中的命令方块放到隐蔽的位置 以避免被破基岩机破坏"]

