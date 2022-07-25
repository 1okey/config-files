# Vim

### Normal mode

| Description 				                | Command 				|
|---------------------------------------|---------------------------------------|
| search for next occurence of **word**     | `/word`|
| search for next previous of **word**      | `?word`|
| next occurence                            | `n`|
| previous occurence                            | `N`|
| replace **word** with **replacement**     | `%s/word/replacement/\<flags>`|
| **Navigation**  ||
| start of line                             | `0`|
| end of line                               | `$`|
| move to start of file                     | `gg`|
| move to end of file                       | `G`|
| next occurence                            | `Ctrl + D`|
| previous occurence                        | `Ctrl + U`|
| **Manipulation**  ||
| copy line                                 | `yy`|
| paste before                              | `p`|
| paste after                               | `P`|

---

# Tmux

### CLI 

| Description 				                    | Command 				|
|---------------------------------------|---------------------------------------|
| create and enter new session named **first**  | `tmux new-session -s first`|
| create without attaching                      | `tmux new-session -s first -d`|
| attach to session names first                 | `tmux attach -t first`|
| delete session names first                    | `tmux kill-session -t first`|
| kill all sessions but the current             | `tmux kill-session -a`|
| send command to session **first** pane **0**  | `tmux send -t first.0 "command" ENTER`|

### In session

| Description 				                    | Command 				|
|---------------------------------------|---------------------------------------|
| detach from current session           | `Ctrl+b d`|
