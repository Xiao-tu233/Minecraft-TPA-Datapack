# Parent function: tpa:update/home

data modify storage tpa:tpa temp.args.current_char set string storage tpa:tpa temp.args.not_scanned 0 1
data modify storage tpa:tpa temp.args.not_scanned set string storage tpa:tpa temp.args.not_scanned 1
$data modify storage tpa:tpa temp.args.scanned set value '$(scanned)$(current_char)'
execute store result score #option.update.not_scanned tpa.variables run data get storage tpa:tpa temp.args.not_scanned

# Char check
data modify storage tpa:tpa temp.args.snbt_syntax_template set value {left_bracket: "{", right_bracket: "}", colon: ":", comma: ",", quote: '"'}
execute store result score #option.update.not_left_bracket tpa.variables run data modify storage tpa:tpa temp.args.snbt_syntax_template.left_bracket set from storage tpa:tpa temp.args.current_char
execute store result score #option.update.not_right_bracket tpa.variables run data modify storage tpa:tpa temp.args.snbt_syntax_template.right_bracket set from storage tpa:tpa temp.args.current_char
execute store result score #option.update.not_colon tpa.variables run data modify storage tpa:tpa temp.args.snbt_syntax_template.colon set from storage tpa:tpa temp.args.current_char
execute store result score #option.update.not_comma tpa.variables run data modify storage tpa:tpa temp.args.snbt_syntax_template.comma set from storage tpa:tpa temp.args.current_char
execute store result score #option.update.not_quote tpa.variables run data modify storage tpa:tpa temp.args.snbt_syntax_template.quote set from storage tpa:tpa temp.args.current_char

execute if score #option.update.in_string tpa.variables matches 0 run function tpa:update/home/scan_char/out_string
execute if score #option.update.in_string tpa.variables matches 1 run function tpa:update/home/scan_char/in_string

execute if score #option.update.not_scanned tpa.variables matches 1.. run function tpa:update/home/scan_char with storage tpa:tpa temp.args