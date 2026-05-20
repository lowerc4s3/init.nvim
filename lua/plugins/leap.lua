-- [nfnl] fnl/plugins/leap.fnl
local function _1_()
  vim.keymap.set({"n", "x", "o"}, "s", "<Plug>(leap)", {silent = true})
  vim.keymap.set({"n"}, "S", "<Plug>(leap-from-window)", {silent = true})
  vim.keymap.set({"x", "o"}, "ar", "<Plug>(leap-remote-text-object)", {silent = true})
  return vim.keymap.set({"x", "o"}, "ir", "<Plug>(leap-remote-inner-text-object)", {silent = true})
end
return {src = "https://codeberg.org/andyg/leap.nvim", dependencies = "tpope/vim-repeat", config = _1_}
