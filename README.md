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
| Ctrl+v                  | block mode                                                                             |
| Ctrl+r                  | redo changes                                                                           |
| .                       | repeat last native command                                                             |
| cs<char><new-char>      | change delimiter, example: cs"' to change " by '                                       |
| ds<char>                | delete delimiter, example: ds" to change "text" to text                                |
| ysiw<char>              | to wrap a word with a delimiter, example: ysiw" to get "text"                          |
| yss<char>               | to wrap the entire line with a delimiter, example: yss" to get "this is a text"        |
| <leader>mp              | [preview] open `markdown` preview                                                      |
| <leader>mP              | [preview] stop `markdown` preview                                                      |
| s                       | [leap] jump to word (require 2 chars)                                                  |
| f/F                     | [leap] find, move the cursor to next ocurrence                                         |
| t/T                     | [leap] till, move the cursor to next ocurrence (to the char just before)               |
| z+c                     | [folding] collapse block (move the cursor to the end of the line to restore the block) |
| z+i                     | [folding] invert foldenable (expand/collapse all)                                      |
| <leader>sr              | [spectre] `find` and `replace`                                                         |
| <leader>/               | [telescope] `find` Grep (cwd)                                                          |
| <leader>,               | [telescope] `find` Switch Buffer                                                       |
| <leader>r               | [telescope] Resume                                                                     |
| <leader><space>         | [telescope] `search` files (root dir)                                                  |
| <leader>sb              | [telescope] `search` buffers                                                           |
| <leader>sf              | [telescope] `search` files                                                             |
| <leader>sg              | [telescope] `search` grep                                                              |
| <leader>so              | [telescope] `search` old files                                                         |
| <C-A-S-Left>            | [split] resize window left                                                             |
| <C-A-S-Right>           | [split] resize window right                                                            |
| <C-A-S-Down>            | [split] resize window down                                                             |
| <C-A-S-Up>              | [split] resize window up                                                               |
| <C-S-Left>              | [split] focus window left                                                              |
| <C-S-Right>             | [split] focus window right                                                             |
| <C-S-Down>              | [split] focus window down                                                              |
| <C-S-Up>                | [split] focus window up                                                                |
| <leader>wv              | [split] open vertical window                                                           |
| <leader>wh              | [split] open horizontal window                                                         |
| <leader>wc              | [split] close window                                                                   |
| <leader>wd              | [split] open diagnostics window                                                        |
| Ctrl+d                  | [multi-cursor] find next ocurrence                                                     |
| [selected] ~            | [multi-cursor] change case (lower to upper or lower to upper)                          |
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
| r                       | [nvimtree] rename from explorer                                                        |
| <leader>tf              | [nvimtree] focus explorer                                                              |
| <leader>tt              | [nvimtree] toggle explorer                                                             |
| <leader>ff              | [telescope] find file                                                                  |
| <leader>er              | [editor] rename variable                                                               |
| <leader>ec              | [editor] comment selected lines                                                        |
| <leader>gd              | [editor] go to definition                                                              |
| <leader>gb              | [editor] go back                                                                       |
| <leader>fj              | [format] format JSON file                                                              |
