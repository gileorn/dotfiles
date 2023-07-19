## Core

- Session is the main entity
- Session may have many windows
- Window may have many panes

<!-- ## Search -->
<!---->
<!-- `/` - search forward -->
<!-- `?` - search backward -->
<!-- `n` - next keyword occurance -->
<!-- `N` - previous keyword occurance -->

## Sessions

`tmux new -s session-name` - create new named session
`tmux kill-session session-name` - kill session
`tmux list-sessions` or `<prefix>s` - list all sessions
`tmux attach` - attach to last active session

## Windows

`<prefix>c` - create a new window
`<prefix>&` - kill window
`<prefix>w` - show all windows in all sessions
`swap-window -s 2 -t 1` - swap windows, where (s) is source (t) is target

## Panes

`<prefix>x` - close active pane
`<prefix>%` - create a vertical split with a new pane
`<prefix>"` - create a horizontal split with a new pane
`<prefix><space>` - switch between panes layout (horizontal and vertical)
`<prefix>q` - see panes numbers
`<prefix>{` or `<prefix>}` - swap panes
`<prefix>z` - make pane fill the whole window
`<prefix>!` - create a window from the current pane
