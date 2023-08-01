## Movement

`G` - move to the end of the file
`gg` move to the start of the file
`%` - move to the matching ), ] or }
`e` - end of the current word
`w` - start of the next word
`b` - start of the previous word
`$` - end of current line
`zz` - bring current line to the center of the screen
`^` or `0` - start of the current line
`*` - move to the next occurence of the current word
`#` - move to the previous occurence of the current word
`t{symbol}` - move till the next occurence of the symbol on the right
`T{symbol}` - move right after the previous occurence of the symbol on the left
`f{symbol}` - move to the next occurence of the symbol on the right
`f{symbol}` - move to the previous occurence of the symbol on the left
`Ctrl + b` - move screen up one screen
`Ctrl + f` - move screen down one screen
`Ctrl + u` - move up half a screen
`Ctrl + d` - move down half a screen
`Ctrl + y` - move screen up one line
`Ctrl + e` - move screen down one line

## Inserting

`i` - insert before the cursor
`I` - insert at the start of the line
`a` - append after the cursor
`A` - append at the end of the line
`r` - replace the character under the cursor
`R` - replaces characters with the new ones
`o` - open a new line under the current line
`O` - open a new line above the current line

## Modification

`x` - delete one symbol
`u` - undo the last command
`Ctrl + R` - redo the last command
`>` and `<` - indent the selected piece of code in visual mode
`>>` and `<<` indent the selected line in normal mode
`g~` - swap case
`gu` - make lowercase
`gU` - make uppercase

## Copy and paste

`y` - yank (copy)
`yy` - yank line
`p` - put before the cursor
`P` - put after the cursor

## Substitute

`:s` - substitute command
`:s/one/two` - change "one" to "two" once in the line
`:s/one/two/g` - change "one" to "two" in the whole line
`:%s/one/two/g` - change in the whole file
`:%s/one/two/gc` - change in the whole file with the prompt for each occurrence

## Search

`/` - enable search
`n` - jump to the next occurrence
`N` - jump to the previous occurrence
`/string\c` - search and ignore the case

## Selecting text objects

All commands in this section are preceeded with `va` or `vi`. `v` here is to enter the visual mode and `a` or `i` indicate whether we want to include the "wrapping" content or not.
For example, `va(` will select the nearest parens block, inlcuding the parens, which can be spelled as "select A parens block". `vi(` will do almost the same but exclude both parens and only select the content inside of them. This can be spelled as "select Inner content between parens".

`w` - word
`s` - sentence
`(` or `{` or `[` or `"` or `'` or `<` - contents inside
`t` - html, xml, jsx tag, self-closing tags are not included
