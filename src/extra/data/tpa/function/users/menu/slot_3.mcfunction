tellraw @s ["[", {interpret: true, storage: "tpa:tpa", nbt: "temp.users.results[2].name", color: "white"}, " | UID ", {interpret: true, storage: "tpa:tpa", nbt: "temp.users.results[2].uid", color: "gray"}, "] ", \
    {text: "[Set name]", color: "green", click_event: {action: "run_command", command: "/function tpa:users/menu/setname_3"}}, " ", \
    {text: "[Set UUID]", color: "green", click_event: {action: "run_command", command: "/function tpa:users/menu/setuuid_3"}}, " ", \
    {text: "[Remove]", color: "red", click_event: {action: "run_command", command: "/function tpa:users/menu/remove_3"}}, " ", \
    {text: "[Up]", color: "light_purple", click_event: {action: "run_command", command: "/function tpa:users/menu/moveup_3"}}, " ", \
    {text: "[Down]", color: "light_purple", click_event: {action: "run_command", command: "/function tpa:users/menu/movedown_3"}}]
