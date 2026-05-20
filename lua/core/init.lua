-- [nfnl] fnl/core/init.fnl
require("core.keymaps")
require("core.options")
require("core.autocmd")
if vim.g.neovide then
  return require("core.neovide")
else
  return nil
end
