# Parent function: tpa:output/warp/menu
data modify storage tpa:tpa temp.output.buttons.disabled.next_page.brackets set value ["[", "]"]
data modify storage tpa:tpa temp.output.buttons.disabled.next_page.label set from storage tpa:tpa temp.output.button_next_page
data modify storage tpa:tpa temp.output.buttons.enabled.next_page.brackets set value ["", ""]
data modify storage tpa:tpa temp.output.buttons.enabled.next_page.label set value ""