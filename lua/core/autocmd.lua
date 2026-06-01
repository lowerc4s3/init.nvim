-- [nfnl] fnl/core/autocmd.fnl
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local group = augroup("NuvimAutocmds", {clear = true})
local function _1_()
  return vim.keymap.set({"n"}, "q", "<Cmd>close<CR>", {desc = "Close help", buf = 0, silent = true})
end
autocmd("FileType", {group = group, pattern = {"help", "qf", "man"}, desc = "quit help pages with 'q'", callback = _1_})
local function _2_()
  return vim.hl.on_yank({higroup = "Visual"})
end
return autocmd("TextYankPost", {group = group, callback = _2_})
