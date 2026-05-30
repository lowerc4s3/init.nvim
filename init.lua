-- [nfnl] init.fnl
vim.loader.enable()
vim.pack.add({"https://github.com/Olical/nfnl"})
do
  local builtins = {"gzip", "zip", "zipPlugin", "tar", "tarPlugin", "getscript", "getscriptPlugin", "vimball", "vimballPlugin", "2html_plugin", "logipat", "rrhelper", "spellfile_plugin", "matchit"}
  for _, plugin in ipairs(builtins) do
    vim.g[("loaded_" .. plugin)] = 1
  end
end
require("core")
require("pack")
require("lsp")
vim.cmd.colorscheme("oxocarbon")
return require("highlights")
