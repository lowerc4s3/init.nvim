-- [nfnl] fnl/plugins/treesitter.fnl
local function _1_()
  vim.g.ts_enable = {auto_init = true, highlights = true, folds = true}
  return nil
end
return {src = "https://github.com/VonHeikemen/ts-enable.nvim", version = "v2.x", init = _1_}
