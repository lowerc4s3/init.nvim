-- [nfnl] fnl/plugins/buffer-sticks.fnl
local function _1_()
  return _G.BufferSticks.jump()
end
return {src = "https://github.com/ahkohd/buffer-sticks.nvim", keys = {"<Tab>", _1_, desc = "Jump to buffer", modes = "n", silent = true}, opts = {list = {keys = {close_buffer = "<C-d>", move_up = "<C-k>", move_down = "<C-j>"}, filter = {keys = {move_up = "<C-k>", move_down = "<C-j>"}, title = "/"}}, winblend = 100, preview = {enabled = false}, filter = {names = {"^$"}}, highlights = {active = {link = "Normal"}, active_modified = {link = "DiagnosticWarn"}, alternate = {link = "Comment"}, alternate_modified = {link = "DiagnosticWarn"}, filter_selected = {link = "@function"}, filter_title = {link = "Comment"}, inactive = {link = "Comment"}, inactive_modified = {link = "DiagnosticWarn"}, label = {link = "Bold"}, list_selected = {link = "@function"}}}, lazy = false}
