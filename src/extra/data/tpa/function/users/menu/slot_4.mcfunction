tellraw @s ["[", {interpret: true, storage: "tpa:tpa", nbt: "temp.users.results[3].name", color: "white"}, " | UID ", {interpret: true, storage: "tpa:tpa", nbt: "temp.users.results[3].uid", color: "gray"}, "] ", \
    {text: "[Set name]", color: "green", click_event: {action: "run_command", command: "/function tpa:users/menu/setname_4"}}, " ", \
    {text: "[Set UUID]", color: "green", click_event: {action: "run_command", command: "/function tpa:users/menu/setuuid_4"}}, " ", \
    {text: "[Remove]", color: "red", click_event: {action: "run_command", command: "/function tpa:users/menu/remove_4"}}, " ", \
    {text: "[Up]", color: "light_purple", click_event: {action: "run_command", command: "/function tpa:users/menu/moveup_4"}}, " ", \
    {text: "[Down]", color: "light_purple", click_event: {action: "run_command", command: "/function tpa:users/menu/movedown_4"}}]
