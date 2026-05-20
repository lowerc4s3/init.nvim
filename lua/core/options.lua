-- [nfnl] fnl/core/options.fnl
do
  local o = vim.opt
  o.expandtab = true
  o.smarttab = true
  o.autoindent = true
  do
    local spaces = 4
    o.tabstop = spaces
    o.softtabstop = spaces
    o.shiftwidth = spaces
  end
  o.splitright = true
  o.splitbelow = true
  o.number = true
  o.relativenumber = true
  o.clipboard = "unnamedplus"
  o.mouse = "a"
  o.ignorecase = true
  o.smartcase = true
  o.updatetime = 5000
  o.timeoutlen = 1000
  o.scrolloff = 8
  o.sidescrolloff = 8
  o.foldlevel = 999
  o.wrap = false
  o.spelllang = "en_us,ru"
  o.sessionoptions:prepend("globals")
  o.termguicolors = true
  o.cursorline = true
  o.title = true
  o.guicursor:prepend({"a:Cursor"})
  o.ruler = false
  o.showmode = false
  o.showcmd = false
  o.laststatus = 2
  o.shortmess:append({S = true, s = true})
end
local ui2 = require("vim._core.ui2")
return ui2.enable({enable = true, msg = {target = "msg"}})
