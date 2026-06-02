-- [nfnl] fnl/navigation/buffers.fnl
vim.pack.add({"https://github.com/ahkohd/buffer-sticks.nvim"})
do
  local opts = {list = {keys = {close_buffer = "<C-d>", move_up = "<C-k>", move_down = "<C-j>"}, filter = {keys = {move_up = "<C-k>", move_down = "<C-j>"}, title = "/"}}, winblend = 100, filter = {names = {"^$"}}, highlights = {active = {link = "Normal"}, list_selected = {link = "@function"}, alternate = {link = "Comment"}, inactive = {link = "Comment"}, active_modified = {link = "DiagnosticWarn"}, alternate_modified = {link = "DiagnosticWarn"}, inactive_modified = {link = "DiagnosticWarn"}, label = {link = "Bold"}, filter_title = {link = "Comment"}, filter_selected = {link = "@function"}}}
  require("buffer-sticks").setup(opts)
end
local function _1_()
  return _G.BufferSticks.jump()
end
return vim.keymap.set({"n"}, "<Tab>", _1_, {desc = "jump to buffer", silent = true})
