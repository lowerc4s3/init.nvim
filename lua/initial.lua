-- [nfnl] fnl/initial.fnl
vim.pack.add({"https://github.com/Wansmer/langmapper.nvim"})
local langmapper = require("langmapper")
local opts
local function _1_()
  return "langmapped"
end
opts = {custom_desc = _1_}
return langmapper.setup(opts)
