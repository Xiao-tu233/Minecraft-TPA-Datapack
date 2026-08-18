# Parent function: tpa:tpa_menu

execute unless predicate tpa:available run data modify storage tpa:tpa temp.menu.book.tooltip set from storage tpa:tpa loaded_lang.book_unavail
execute if predicate tpa:available run function tpa:menu/book/available