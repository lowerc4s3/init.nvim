-- [nfnl] fnl/editor.fnl
local _local_1_ = require("lib.nvim")
local hi = _local_1_.hi
vim.pack.add({"https://github.com/tpope/vim-repeat", "https://codeberg.org/andyg/leap.nvim", "https://github.com/nvim-mini/mini.jump", "https://github.com/nvim-mini/mini.surround", "https://github.com/kawre/neotab.nvim", "https://github.com/VonHeikemen/ts-enable.nvim"})
require("mini.jump").setup()
hi("MiniJump", {link = "CurSearch"})
vim.keymap.set({"n", "x", "o"}, "s", "<Plug>(leap)", {desc = "leap in current window", silent = true})
vim.keymap.set({"n"}, "S", "<Plug>(leap-from-window)", {desc = "leap to another window", silent = true})
vim.keymap.set({"x", "o"}, "ar", "<Plug>(leap-remote-text-object)", {desc = "select remote outer text object", silent = true})
vim.keymap.set({"x", "o"}, "ar", "<Plug>(leap-remote-inner-text-object)", {desc = "select remote inner text object", silent = true})
do
  local surround = require("mini.surround")
  local opts = {mappings = {add = "gs", delete = "gsd", replace = "gsr", find = "", find_left = "", highlight = "", suffix_last = "", suffix_next = ""}, respect_selection_type = true}
  surround.setup(opts)
end
do
  local neotab = require("neotab")
  local opts = {tabkey = "", reverse_key = ""}
  neotab.setup(opts)
end
local opts = {auto_init = true, highlights = true, folds = true}
vim.g.ts_enable = opts
return nil
