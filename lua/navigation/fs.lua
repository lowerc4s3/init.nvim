-- [nfnl] fnl/navigation/fs.fnl
vim.pack.add({"https://github.com/nvim-mini/mini.icons", "https://github.com/stevearc/oil.nvim"})
do
  local opts = {keymaps = {gS = {"actions.change_sort", mode = "n"}, q = {"actions.close", mode = "n"}}, delete_to_trash = true, watch_for_changes = true, constrain_cursor = "name"}
  require("oil").setup(opts)
end
return vim.keymap.set({"n"}, "-", "<Cmd>Oil<CR>", {desc = "open parent dir", silent = true})
