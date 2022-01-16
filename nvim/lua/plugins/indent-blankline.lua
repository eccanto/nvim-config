-- indent-blankline character
vim.g.indent_blankline_char = "•"

-- Disable indent-blankline on these pages
vim.g.indent_blankline_filetype_exclude = {
  "help",
  "terminal",
  "dashboard",
  "packer",
  "lsp-installer",
  "lspinfo",
  "vista_kind"
}

vim.g.indent_blankline_buftype_exclude = { "terminal" }

vim.g.indent_blankline_show_trailing_blankline_indent = false
vim.g.indent_blankline_show_first_indent_level = false
vim.cmd("autocmd CursorMoved * IndentBlanklineRefresh")

-- whitespaces
vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("lead:.")
vim.opt.listchars:append("trail:.")

