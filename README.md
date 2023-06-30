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
| .                       | repeat last native command                                                             |
| cs<char><new-char>      | change delimiter, example: cs"' to change " by '                                       |
| ds<char>                | delete delimiter, example: ds" to change "text" to text                                |
| ysiw<char>              | to wrap a word with a delimiter, example: ysiw" to get "text"                          |
| yss<char>               | to wrap the entire line with a delimiter, example: yss" to get "this is a text"        |
| z+c                     | [folding] collapse block (move the cursor to the end of the line to restore the block) |
| z+i                     | [folding] invert foldenable (expand/collapse all)                                      |
| <leader>/               | [telescope] `find` Grep (cwd)                                                          |
| <leader>,               | [telescope] `find` Switch Buffer                                                       |
| <leader><space>         | [telescope] `find` Files (root dir)                                                    |
| <leader>ff              | [telescope] `find` Files (cwd)                                                         |
| <leader>fb              | [telescope] `find` Buffers                                                             |
| <leader>fr              | [telescope] `find` Recent (cwd)                                                        |
| <leader>gc              | [telescope] `git` commits                                                              |
| <leader>gs              | [telescope] `git` status                                                               |
| <leader>sg              | [telescope] `search` Grep (cwd)                                                        |
| <leader>sR              | [telescope] `search` Resume                                                            |
| <leader>sb              | [telescope] `search` Buffer                                                            |
| <leader>sc              | [telescope] `search` Command History                                                   |
| <leader>sm              | [telescope] `search` Jump to Mark                                                      |
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
| r                       | [nvimtree] rename from explorer                                                        |
| <leader>e               | [nvimtree] focus explorer                                                              |
| <leader>t               | [nvimtree] toggle explorer                                                             |
| <leader>ff              | [telescope] find file                                                                  |
| <leader>er              | [lsp] rename variable                                                                  |
| <leader>gd              | [lsp] go to definition                                                                 |
| <leader>gb              | [lsp] go back                                                                          |
