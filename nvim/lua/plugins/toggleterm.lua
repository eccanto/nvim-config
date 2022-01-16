local present, toggle_term = pcall(require, "toggleterm")
if not present then
    return
end

toggle_term.setup {
  open_mapping = "<c-t>",
  hide_numbers = false, -- hide the number column in toggleterm buffers
  shade_terminals = false,
  start_in_insert = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  persist_size = true,
  direction = "float",
  close_on_exit = true, -- close the terminal window when the process exits
  float_opts = {
    border = "curved",
    width = 220,
    height = 50,
    winblend = 3,
    highlights = {
      border = "Normal",
      background = "Normal",
    }
  }
}

local Terminal  = require('toggleterm.terminal').Terminal

-- ipython
local python = Terminal:new({ cmd = "ipython", hidden = true })

function _python_toggle()
    python:toggle()
end

-- lazygit
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

function _lazygit_toggle()
    lazygit:toggle()
end

-- mdr

function _mdr_toggle()
    local filepath = vim.api.nvim_buf_get_name(0)
    local mdr = Terminal:new({ cmd = "mdr " .. filepath, hidden = true })

    mdr:toggle()
end

