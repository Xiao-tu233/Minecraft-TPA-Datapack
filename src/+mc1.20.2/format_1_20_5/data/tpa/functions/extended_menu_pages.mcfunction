#! Originally named tpa:langtell/langtell_25, tpa:extended_menu_pagen
# Parent Function: tpa:extended_menu_argument_page_location
function tpa:load_lang
function tpa:sounds/levelup
tellraw @s [{"storage": "tpa:tpa", "nbt": "loaded_lang.extended_menu_title"}]
$function tpa:iddisplay {"id_1":$(index_0)2,"id_2":$(index_0)3,"id_3":$(index_0)4,"id_4":$(index_0)5,"id_5":$(index_0)6,"direction":"tpa"}
$function tpa:iddisplay {"id_1":$(index_0)7,"id_2":$(index_0)8,"id_3":$(index_0)9,"id_4":$(index_1)0,"id_5":$(index_1)1,"direction":"tpa"}
$function tpa:iddisplay {"id_1":$(index_1)2,"id_2":$(index_1)3,"id_3":$(index_1)4,"id_4":$(index_1)5,"id_5":$(index_1)6,"direction":"tpa"}
$function tpa:iddisplay {"id_1":$(index_1)7,"id_2":$(index_1)8,"id_3":$(index_1)9,"id_4":$(index_2)0,"id_5":$(index_2)1,"direction":"tpa"}
$function tpa:iddisplay {"id_1":$(index_2)2,"id_2":$(index_2)3,"id_3":$(index_2)4,"id_4":$(index_2)5,"id_5":$(index_2)6,"direction":"tpa"}
$function tpa:iddisplay {"id_1":$(index_2)7,"id_2":$(index_2)8,"id_3":$(index_2)9,"id_4":$(index_3)0,"id_5":$(index_3)1,"direction":"tpa"}
$function tpa:iddisplay {"id_1":$(index_3)2,"id_2":$(index_3)3,"id_3":$(index_3)4,"id_4":$(index_3)5,"id_5":$(index_3)6,"direction":"tpa"}
$function tpa:iddisplay {"id_1":$(index_3)7,"id_2":$(index_3)8,"id_3":$(index_3)9,"id_4":$(index_4)0,"id_5":$(index_4)1,"direction":"tpa"}
$function tpa:iddisplay {"id_1":$(index_4)2,"id_2":$(index_4)3,"id_3":$(index_4)4,"id_4":$(index_4)5,"id_5":$(index_4)6,"direction":"tpa"}
$function tpa:iddisplay {"id_1":$(index_4)7,"id_2":$(index_4)8,"id_3":$(index_4)9,"id_4":$(index_5)0,"id_5":$(index_5)1,"direction":"tpa"}

$tellraw @s ["======================( ", \
{text:"§b<§r",click_event:{"action":"run_command","value":"/trigger tpa.extended_menu set $(previous)"},hover_event:{"action":"show_text","value":[{storage: "tpa:tpa", nbt: "loaded_lang.extended_menu_previous_page"},"§b($(previous))"]}}, \
{text:" $(page) ",click_event:{"action":"suggest_command","value":"/trigger tpa.extended_menu set "}},\
{text:"§b>§r",click_event:{"action":"run_command","value":"/trigger tpa.extended_menu set $(next)"},hover_event:{"action":"show_text","value":[{storage: "tpa:tpa", nbt: "loaded_lang.extended_menu_next_page"},"§b($(next))"]}}, \
" )======================"]