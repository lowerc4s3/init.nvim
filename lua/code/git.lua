-- [nfnl] fnl/code/git.fnl
vim.pack.add({"https://github.com/lewis6991/gitsigns.nvim", "https://github.com/dlyongemallo/diffview.nvim", "https://github.com/NeogitOrg/neogit"})
do
  local opts = {disable_hint = true}
  require("neogit").setup(opts)
end
vim.keymap.set({"n"}, "<Leader>gg", "<Cmd>Neogit<CR>", {desc = "open neogit tab", silent = true})
vim.keymap.set({"n"}, "<Leader>gl", "<Cmd>Neogit log<CR>", {desc = "view log", silent = true})
vim.keymap.set({"n"}, "<Leader>gp", "<Cmd>Neogit pull<CR>", {desc = "pull", silent = true})
return vim.keymap.set({"n"}, "<Leader>gP", "<Cmd>Neogit push<CR>", {desc = "push", silent = true})
