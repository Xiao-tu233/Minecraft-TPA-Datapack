# Parent function: tpa:home/menu/has_home
data modify storage tpa:tpa temp.output.index set from storage tpa:tpa loaded_lang.home_selector_page_empty
# Use the dedicated no-range format: only total_slots is inserted.
data modify storage tpa:tpa temp.output.index_format set value 2
