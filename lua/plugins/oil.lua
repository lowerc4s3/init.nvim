-- [nfnl] fnl/plugins/oil.fnl
local function _1_(_, opts)
  local oil = require("oil")
  return oil.setup(opts)
end
return {src = "https://github.com/stevearc/oil.nvim", dependencies = {src = "https://github.com/nvim-mini/mini.icons"}, opts = {keymaps = {gS = {"actions.change_sort", mode = "n"}, q = {"actions.close", mode = "n"}}, delete_to_trash = true, watch_for_changes = true, constrain_cursor = "name"}, config = _1_, keys = {{"-", "<Cmd>Oil<CR>", desc = "open parent dir", modes = "n", silent = true}}, lazy = false}
