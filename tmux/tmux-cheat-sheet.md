## Core

`<prefix>:` - enter command mode
`<prefix>d` - detach from session
`<prefix>R` - source tmux.conf
`<prefix>I` - install TPM packages

## Sessions

`tmux new -s session-name` - create new named session
`tmux kill-session session-name` - close session
`tmux list-sessions` or `<prefix>s` - list all sessions
`tmux attach` - attach to last active session
`<prefix>$` - rename session

## Windows

`<prefix>c` - create a new window
`<prefix>&` - close window
`<prefix>w` - show all windows in all sessions
`<prefix>,` - rename current window
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
