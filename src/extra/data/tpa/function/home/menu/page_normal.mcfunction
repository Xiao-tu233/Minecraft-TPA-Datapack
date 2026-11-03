# Parent function: tpa:home/menu/has_home
data modify storage tpa:tpa temp.output.start_index set string storage tpa:tpa temp.home_page_entries[0].id
data modify storage tpa:tpa temp.output.en_dash set value "-"
data modify storage tpa:tpa temp.output.end_index set string storage tpa:tpa temp.home_page_entries[-1].id
data modify storage tpa:tpa temp.output.index_format set from storage tpa:tpa loaded_lang.home_selector_index_format
data modify storage tpa:tpa temp.output.index set from storage tpa:tpa loaded_lang.home_selector_index