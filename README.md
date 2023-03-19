**WIP**

# Overview

My Neovim configuration.

![Neovim](documentation/media/neovim.gif)

# Table of contents

- [Installation](#installation)
- [Shortcuts](#shortcuts)

## Installation

```bash
bash install.sh
```

## shortcuts

| map                     | description                                                                            |
|-------------------------|----------------------------------------------------------------------------------------|
| Ctrl+v                  | block Mode                                                                             |
| Ctrl+r                  | redo changes                                                                           |
| z+c                     | [folding] collapse block (move the cursor to the end of the line to restore the block) |
| <leader>/               | [editor] comment lines                                                                 |
| <leader>b               | [editor] create new buffer                                                             |
| Ctrl+n                  | [cursor] select ocurrences                                                             |
| <leader>sh              | [split] split window horizontal                                                        |
| <leader>sv              | [split] split window vertical                                                          |
| <C-A-S-Left>            | [split] resize window left                                                             |
| <C-A-S-Right>           | [split] resize window right                                                            |
| <C-A-S-Down>            | [split] resize window down                                                             |
| <C-A-S-Up>              | [split] resize window up                                                               |
| <C-S-Left>              | [split] focus window left                                                              |
| <C-S-Right>             | [split] focus window right                                                             |
| <C-S-Down>              | [split] focus window down                                                              |
| <C-S-Up>                | [split] focus window up                                                                |
| Ctrl+d                  | [multi-cursor] find next ocurrence                                                     |
| [selected] n            | [multi-cursor] select next ocurrence                                                   |
| [selected] N            | [multi-cursor] select previous ocurrence                                               |
| [selected] q            | [multi-cursor] skip current and get next occurrence                                    |
| [selected] Q            | [multi-cursor] remove current cursor/selection                                         |
| [selected] [            | [multi-cursor] select next cursor                                                      |
| [selected] ]            | [multi-cursor] select previous cursor                                                  |
| [selected] Shift+Arrows | [multi-cursor] select one character at a time                                          |
| Ctrl+Up                 | [multi-cursor] create Up cursors                                                       |
| Ctrl+Down               | [multi-cursor] create Down cursors                                                     |
| Ctrl+t                  | [nvterm] open toggle terminal                                                          |
| <leader>cc              | [blankline] go to current context                                                      |
| r                       | [nvimtree] rename from explorer                                                        |
| <leader>e               | [nvimtree] focus explorer                                                              |
| <leader>t               | [nvimtree] toggle explorer                                                             |
| <leader>ff              | [telescope] find file                                                                  |
| <leader>fw              | [telescope] find word                                                                  |
| <leader>fb              | [telescope] find buffer                                                                |
| <leader>tk              | [telescope] find shortcuts                                                             |
| <leader>gc              | [telescope] find git commits                                                           |
| <leader>gs              | [telescope] find git status                                                            |
| <leader>ra              | [lsp] rename variable                                                                  |
| <leader>gd              | [lsp] go to definition                                                                 |
| <C-o>                   | [lsp] go back                                                                          |
| <leader>gr              | [lsp] find references                                                                  |
| <leader>K               | [lsp] display hover help popup                                                         |
| <leader>f               | [lsp] display diagnostics popup                                                        |
| <leader>q               | [lsp] find diagnostics window                                                          |
