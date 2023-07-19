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
`Ctrl + b` - move screen up one screen
`Ctrl + f` - move screen down one screen
`Ctrl + u` - move up half a screen
`Ctrl + d` - move down half a screen
`Ctrl + y` - move screen up one line
`Ctrl + e` - move screen down one line
`Ctrl + h/j/k/l` - switch between open splits or panes

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
