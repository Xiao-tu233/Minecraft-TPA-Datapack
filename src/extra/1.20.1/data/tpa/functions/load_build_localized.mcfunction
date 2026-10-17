# Parent function: tpa:load_date_format
execute if score #date_format tpa.variables matches 1 run data modify storage tpa:tpa temp.option.dates append from storage tpa:tpa loaded_lang.load_date_check_year_prefix
execute if score #date_format tpa.variables matches 1 run data modify storage tpa:tpa temp.option.dates append from storage tpa:tpa config.publish_date.year
execute if score #date_format tpa.variables matches 1 run data modify storage tpa:tpa temp.option.dates append from storage tpa:tpa loaded_lang.load_date_check_year_suffix
execute if score #date_format tpa.variables matches 1 run data modify storage tpa:tpa temp.option.dates append from storage tpa:tpa loaded_lang.load_date_check_year_local_prefix
execute if score #date_format tpa.variables matches 1 if score #lang_id tpa.variables matches 3 run data modify storage tpa:tpa temp.option.dates append from storage tpa:tpa config.publish_date.year_tw
execute if score #date_format tpa.variables matches 1 if score #lang_id tpa.variables matches 4 run data modify storage tpa:tpa temp.option.dates append from storage tpa:tpa config.publish_date.year_jp
execute if score #date_format tpa.variables matches 1 run data modify storage tpa:tpa temp.option.dates append from storage tpa:tpa loaded_lang.load_date_check_year_local_suffix
execute if score #date_format tpa.variables matches 2 run data modify storage tpa:tpa temp.option.dates append from storage tpa:tpa loaded_lang.load_date_check_month_prefix
execute if score #date_format tpa.variables matches 2 run data modify storage tpa:tpa temp.option.dates append from storage tpa:tpa config.publish_date.month
execute if score #date_format tpa.variables matches 2 run data modify storage tpa:tpa temp.option.dates append from storage tpa:tpa loaded_lang.load_date_check_month_suffix
execute if score #date_format tpa.variables matches 3 run data modify storage tpa:tpa temp.option.dates append from storage tpa:tpa loaded_lang.load_date_check_day_prefix
execute if score #date_format tpa.variables matches 3 run data modify storage tpa:tpa temp.option.dates append from storage tpa:tpa config.publish_date.day
execute if score #date_format tpa.variables matches 3 run data modify storage tpa:tpa temp.option.dates append from storage tpa:tpa loaded_lang.load_date_check_day_suffix