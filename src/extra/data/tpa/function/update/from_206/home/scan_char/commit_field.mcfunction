# Parent function: tpa:update/from_206/home/scan_char/comma, tpa:update/from_206/home/scan_char/right_bracket
# Keep the value as SNBT while it is copied. This preserves numeric values and
# also keeps quoted strings such as the old dim field valid for macro expansion.
$data modify storage tpa:tpa temp.args.current.$(current_key) set value $(token)
data modify storage tpa:tpa temp.args.token set value ""
