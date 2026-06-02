-- [nfnl] fnl/lib/nvim.fnl
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local hi
local function _1_(...)
  return vim.api.nvim_set_hl(0, ...)
end
hi = _1_
return {autocmd = autocmd, augroup = augroup, hi = hi}
