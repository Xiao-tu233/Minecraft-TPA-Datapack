# Public macro template for showing an inline dialog.
# @macro: {dialog: minecraft:dialog(Inline Dialog)}
$dialog show @s $(dialog)
$execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug§r: Showing ", {text: "dialog", hover_event: {action: "show_text", value: "Click to copy raw nbt of dialog "}, click_event: {action: "copy_to_clipboard", value: '$(dialog)'}}]