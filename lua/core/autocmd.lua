-- [nfnl] fnl/core/autocmd.fnl
local autocmd = vim.api.nvim_create_autocmd
local function _1_()
  return vim.keymap.set({"n"}, "q", ":close<CR>", {desc = "Close help", buf = 0, silent = true})
end
return autocmd("FileType", {pattern = {"help", "qf", "man"}, desc = "quit help pages with 'q'", callback = _1_})
