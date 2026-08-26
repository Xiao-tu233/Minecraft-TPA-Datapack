# tpa.book States: 0 - Not triggered, 1 - Requested, 2 - Given book, 3 - Triggered with Given book, -1 - Book Missing(Not Using currently)

function tpa:load_lang
execute if score #book tpa.config matches 1 run function tpa:book/disabled
execute if score #book tpa.config matches 0 run function tpa:book/enabled