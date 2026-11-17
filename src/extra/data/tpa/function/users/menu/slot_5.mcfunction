tellraw @s ["[", {interpret: true, storage: "tpa:tpa", nbt: "temp.users.results[4].name", color: "white"}, " | UID ", {interpret: false, storage: "tpa:tpa", nbt: "temp.users.results[4].uid", color: "gray"}, "] ", \
    {text: "[Set name]", color: "green", click_event: {action: "run_command", command: "/function tpa:users/menu/setname_5"}}, " ", \
    {text: "[Set UUID]", color: "green", click_event: {action: "run_command", command: "/function tpa:users/menu/setuuid_5"}}, " ", \
    {text: "[Remove]", color: "red", click_event: {action: "run_command", command: "/function tpa:users/menu/remove_5"}}, " ", \
    {text: "[Up]", color: "light_purple", click_event: {action: "run_command", command: "/function tpa:users/menu/moveup_5"}}, " ", \
    {text: "[Down]", color: "light_purple", click_event: {action: "run_command", command: "/function tpa:users/menu/movedown_5"}}]
