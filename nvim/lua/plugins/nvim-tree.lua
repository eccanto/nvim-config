local present, nvimtree = pcall(require, "nvim-tree")
if not present then
    return
end
local tree_cb = require"nvim-tree.config".nvim_tree_callback

nvimtree.setup {
  open_on_tab = false,
  update_cwd = true,
  actions = {
    open_file = {
        quit_on_open = false,
        window_picker = {
            exclude = {
                filetype = {'packer', 'vista_kind', 'toggleterm'},
                buftype = {'terminal'},
            },
        },
    },
  },
  renderer = {
    indent_markers = {
        enable = true,
    },
    highlight_git = true,
    highlight_opened_files = "icon",
    add_trailing = false,
  },
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  git = {
    enable = true,
    ignore = false,
    timeout = 500,
  },
  filters = {
    custom = {
      ".git",
      "node_modules",
      ".cache",
      "__pycache__"
    }
  },
  view = {
    width = "20%",
    side = "left",
    adaptive_size = true,
    mappings = {
      list = {
       {key = "<S-h>", cb = ":call ResizeLeft(3)<CR>"},
       {key = "<C-h>", cb = tree_cb("toggle_dotfiles")},
      }
    }
  }
}
