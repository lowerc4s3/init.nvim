-- [nfnl] fnl/core/keymaps.fnl
do
  local g = vim.g
  g.mapleader = " "
  g.maplocalleader = ","
end
vim.keymap.set({"n", "v"}, "<Space>", "<Nop>", {silent = true})
vim.keymap.set({"n"}, "<Esc>", "<Cmd>nohlsearch<CR>", {desc = "disable search hl", silent = true})
vim.keymap.set({"n"}, "<C-h>", "<C-w>h", {desc = "move to the left window", silent = true})
vim.keymap.set({"n"}, "<C-j>", "<C-w>j", {desc = "move to the lower window", silent = true})
vim.keymap.set({"n"}, "<C-k>", "<C-w>k", {desc = "move to the upper window", silent = true})
vim.keymap.set({"n"}, "<C-l>", "<C-w>l", {desc = "move to the right window", silent = true})
vim.keymap.set({"i"}, "<C-h>", "<Left>", {desc = "move left", silent = true})
vim.keymap.set({"i"}, "<C-j>", "<Down>", {desc = "move down", silent = true})
vim.keymap.set({"i"}, "<C-k>", "<Up>", {desc = "move up", silent = true})
return vim.keymap.set({"i"}, "<C-l>", "<Right>", {desc = "move right", silent = true})
