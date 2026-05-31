-- [nfnl] fnl/plugins/mini-jump.fnl
local function _1_()
  require("mini.jump").setup()
  return vim.api.nvim_set_hl(0, "MiniJump", {link = "CurSearch"})
end
return {src = "https://github.com/nvim-mini/mini.jump", config = _1_}
