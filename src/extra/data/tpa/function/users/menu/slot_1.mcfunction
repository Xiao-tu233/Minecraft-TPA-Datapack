tellraw @s ["[", {interpret: true, storage: "tpa:tpa", nbt: "temp.users.results[0].name", color: "white"}, " | UID ", {interpret: true, storage: "tpa:tpa", nbt: "temp.users.results[0].uid", color: "gray"}, "] ", \
    {text: "[Set name]", color: "green", click_event: {action: "run_command", command: "/function tpa:users/menu/setname_1"}}, " ", \
    {text: "[Set UUID]", color: "green", click_event: {action: "run_command", command: "/function tpa:users/menu/setuuid_1"}}, " ", \
    {text: "[Remove]", color: "red", click_event: {action: "run_command", command: "/function tpa:users/menu/remove_1"}}, " ", \
    {text: "[Up]", color: "light_purple", click_event: {action: "run_command", command: "/function tpa:users/menu/moveup_1"}}, " ", \
    {text: "[Down]", color: "light_purple", click_event: {action: "run_command", command: "/function tpa:users/menu/movedown_1"}}]
