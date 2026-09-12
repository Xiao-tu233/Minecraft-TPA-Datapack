# Parent function: tpa:output/warp/menu
data modify storage tpa:tpa temp.output.buttons.disabled.previous_page.brackets set value ["[", "]"]
data modify storage tpa:tpa temp.output.buttons.disabled.previous_page.label set from storage tpa:tpa temp.output.button_previous_page
data modify storage tpa:tpa temp.output.buttons.enabled.previous_page.brackets set value ["", ""]
data modify storage tpa:tpa temp.output.buttons.enabled.previous_page.label set value ""