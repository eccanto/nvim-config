-- Function for make mapping easier.
local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend("force", options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Map leader key to space.
vim.g.mapleader = " "


-- Set cl for clearing highlights after searching word in file.
map("n", "cl", ":noh<CR>")


-- Split navigations.
map("n", "<A-j>", "<C-w><C-j>")
map("n", "<A-k>", "<C-w><C-k>")
map("n", "<A-l>", "<C-w><C-l>")
map("n", "<A-h>", "<C-w><C-h>")


-- Buffer resizing.
map("n", "<C-h>", ":call ResizeLeft(3)<CR><Esc>")
map("n", "<C-l>", ":call ResizeRight(3)<CR><Esc>")
map("n", "<C-k>", ":call ResizeUp(1)<CR><Esc>")
map("n", "<C-j>", ":call ResizeDown(1)<CR><Esc>")


-- Buffer switching.
map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>")
map("n", "<Tab>", ":BufferLineCycleNext<CR>")


-- Buffer closing.
map("n", "<leader>bc", ":BufferLinePickClose<CR>")


-- Buffer moving.
map("n", "<leader>bl", ":BufferLineMoveNext<CR>")
map("n", "<leader>bh", ":BufferLineMovePrev<CR>")


-- Don't copy the replaced text after pasting.
map("v", "p", '"_dP')


-- Jk for going to normal mode while you are in insert mode.
map("i", "jk", "<ESC>")

-- With this you can use > < multiple time for changing indent when you visual selected text.
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Packer
map('n', '<leader>pi', ':PackerInstall<CR>')
map('n', '<leader>pu', ':PackerUpdate<CR>')
map('n', '<leader>pr', ':PackerClean<CR>')
map('n', '<leader>ps', ':PackerSync<CR>')
map('n', '<leader>pc', ':PackerCompile<CR>')

-- NvimTree toggle
map("n", "<leader>nt", ":NvimTreeToggle<CR>")


-- Telescope
map("n", "<Leader>tg", ":Telescope live_grep<CR>")
map("n", "<Leader>tm", ":Telescope media_files<CR>")
map("n", "<Leader>ts", ":Telescope git_status<CR>")
map("n", "<Leader>tc", ":Telescope git_commits<CR>")
map("n", "<Leader>tf", ":Telescope find_files<CR>")
map("n", "<Leader>td", ":Telescope find_directories<CR>")
map("n", "<Leader>tb", ":Telescope buffers<CR>")
map("n", "<Leader>tt", ":Telescope help_tags<CR>")
map("n", "<Leader>to", ":Telescope oldfiles<CR>")
map("n", "<Leader>th", ":Telescope colorscheme<CR>")


-- Dashboard
map("n", "<Leader>do", ":Dashboard<CR>")
map("n", "<Leader>dn", ":DashboardNewFile<CR>")
map("n", "<Leader>dm", ":DashboardJumpMarks<CR>")
map("n", "<C-x>l", ":SessionLoad<CR>")
map("n", "<C-x>s", ":SessionSave<CR>")
map("n", "<C-s>", ":w<CR>")
map("n", "<C-w>", ":bd<CR>")


-- tabs
map("n", "<C-m>", ":tabedit %<CR>")
map("n", "<C-x>", ":tabclose<CR>")


-- Lsp
local lsp_opts = { noremap=true, silent=true }
map("n", "gD", ":lua vim.lsp.buf.declaration()<CR>", lsp_opts)
map("n", "gd", ":lua vim.lsp.buf.definition()<CR>", lsp_opts)
map("n", "<leader>k", ":lua vim.lsp.buf.hover()<CR>", lsp_opts)
map("n", "gi", ":lua vim.lsp.buf.implementation()<CR>", lsp_opts)
map("n", "<C-k>", ":lua vim.lsp.buf.signature_help()<CR>", lsp_opts)
map("n", "<leader>wa", ":lua vim.lsp.buf.add_workspace_folder()<CR>", lsp_opts)
map("n", "<leader>wr", ":lua vim.lsp.buf.remove_workspace_folder()<CR>", lsp_opts)
map("n", "<leader>wl", ":lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", lsp_opts)
map("n", "<leader>D", ":lua vim.lsp.buf.type_definition()<CR>", lsp_opts)
map("n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>", lsp_opts)
map("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>", lsp_opts)
map("n", "gr", ":lua vim.lsp.buf.references()<CR>", lsp_opts)
map("n", "<leader>e", ":lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", lsp_opts)
map("n", "[d", ":lua vim.lsp.diagnostic.goto_prev()<CR>", lsp_opts)
map("n", "]d", ":lua vim.lsp.diagnostic.goto_next()<CR>", lsp_opts)
map("n", "<leader>q", ":lua vim.lsp.diagnostic.set_loclist()<CR>", lsp_opts)


-- ToggleTerm
function _G.set_terminal_keymaps()
  map("t", "<esc>", "<C-\\><C-n>")
  map("t", "<A-h>", "<c-\\><c-n><c-w>h")
  map("t", "<A-j>", "<c-\\><c-n><c-w>j")
  map("t", "<A-k>", "<c-\\><c-n><c-w>k")
  map("t", "<A-l>", "<c-\\><c-n><c-w>l")

  map("n", "<C-h>", "<c-\\><C-n>:call ResizeLeft(3)<CR>")
  map("n", "<C-j>", "<c-\\><C-n>:call ResizeDown(1)<CR>")
  map("n", "<C-k>", "<c-\\><C-n>:call ResizeUp(1)<CR>")
  map("n", "<C-l>", "<c-\\><C-n>:call ResizeRight(3)<CR>")
end
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

-- ToggleTerm - lazy functions
map("n", "<leader>cp", "<cmd>lua _python_toggle()<CR>")
map("n", "<leader>cl", "<cmd>lua _lazygit_toggle()<CR>")
map("n", "<leader>cm", "<cmd>lua _mdr_toggle()<CR>")

-- Remove unnecessary white spaces.
map("n", "<leader>cw", ":StripWhitespace<CR>")


-- TrueZen focus mode.
map("n", "<leader>fs", ":TZFocus<CR>")


-- comment
map("n", "ct", ":CommentToggle<CR>")
map("v", "ct", ":'<,'>CommentToggle<CR>")


-- Code formatter.
map("n", "<leader>fr", ":Neoformat<CR>", lsp_opts)

-- any-jump
map("n", "<leader>jd", ":AnyJump<CR>")             -- Jump to definition under cursor
map("v", "<leader>jd", ":AnyJumpVisual<CR>")       -- Jump to definition under cursor
map("n", "<leader>jb", ":AnyJumpBack<CR>")         -- open previous opened file (after jump)
map("n", "<leader>jo", ":AnyJumpLastResults<CR>")  -- open last closed search window again

-- markdown
map("n", "<leader>m", ":PreviewMarkdown right<CR>")

