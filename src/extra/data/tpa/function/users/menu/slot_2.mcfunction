tellraw @s ["[", {interpret: true, storage: "tpa:tpa", nbt: "temp.users.results[1].name", color: "white"}, " | UID ", {interpret: false, storage: "tpa:tpa", nbt: "temp.users.results[1].uid", color: "gray"}, "] ", \
    {text: "[Set name]", color: "green", click_event: {action: "run_command", command: "/function tpa:users/menu/setname_2"}}, " ", \
    {text: "[Set UUID]", color: "green", click_event: {action: "run_command", command: "/function tpa:users/menu/setuuid_2"}}, " ", \
    {text: "[Remove]", color: "red", click_event: {action: "run_command", command: "/function tpa:users/menu/remove_2"}}, " ", \
    {text: "[Up]", color: "light_purple", click_event: {action: "run_command", command: "/function tpa:users/menu/moveup_2"}}, " ", \
    {text: "[Down]", color: "light_purple", click_event: {action: "run_command", command: "/function tpa:users/menu/movedown_2"}}]
