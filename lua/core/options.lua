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
  o.winborder = "none"
  o.guicursor:prepend({"a:Cursor"})
  o.ruler = false
  o.showmode = false
  o.showcmd = false
  o.laststatus = 2
  o.shortmess:append({S = true, s = true})
  local esc
  local function _1_(_241)
    return vim.fn.escape(_241, ";,.\"|\\]")
  end
  esc = _1_
  local en = esc("`qwertyuiop[]asdfghjkl;'zxcvbnm")
  local ru = esc("\209\145\208\185\209\134\209\131\208\186\208\181\208\189\208\179\209\136\209\137\208\183\209\133\209\138\209\132\209\139\208\178\208\176\208\191\209\128\208\190\208\187\208\180\208\182\209\141\209\143\209\135\209\129\208\188\208\184\209\130\209\140")
  local en_caps = esc("~QWERTYUIOP{}ASDFGHJKL:\"ZXCVBNM<>")
  local ru_caps = esc("\195\139\208\153\208\166\208\163\208\154\208\149\208\157\208\147\208\168\208\169\208\151\208\165\208\170\208\164\208\171\208\146\208\144\208\159\208\160\208\158\208\155\208\148\208\150\208\173\208\175\208\167\208\161\208\156\208\152\208\162\208\172\208\145\208\174")
  o.langmap = (ru_caps .. ";" .. en_caps .. "," .. ru .. ";" .. en)
end
local ui2 = require("vim._core.ui2")
return ui2.enable({enable = true, msg = {target = "msg"}})
