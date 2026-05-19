-- [nfnl] fnl/core/init.fnl
require("core.keymaps")
require("core.options")
if vim.g.neovide then
  return require("core.neovide")
else
  return nil
end
