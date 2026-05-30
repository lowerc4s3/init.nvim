-- [nfnl] fnl/core/options.fnl
local opt = vim.opt
opt.expandtab = true
opt.smarttab = true
opt.autoindent = true
opt.smartindent = true
do
  local spaces = 4
  opt.tabstop = spaces
  opt.softtabstop = spaces
  opt.shiftwidth = spaces
end
opt.ignorecase = true
opt.smartcase = true
opt.virtualedit = {"block"}
opt.splitright = true
opt.splitbelow = true
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.timeoutlen = 1000
opt.swapfile = false
opt.updatetime = 5000
opt.undofile = true
opt.sessionoptions:prepend("globals")
opt.termguicolors = true
opt.number = true
opt.relativenumber = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.cursorline = true
opt.title = true
opt.winborder = "none"
opt.completeopt = {"menu", "menuone", "popup", "noselect"}
opt.conceallevel = 2
opt.wrap = false
opt.linebreak = true
opt.foldlevel = 999
opt.guicursor:prepend({"a:Cursor"})
do
  local ui = require("vim._core.ui2")
  ui.enable({msg = {target = "msg"}})
end
opt.cmdheight = 0
opt.ruler = false
opt.showmode = false
opt.showcmd = false
opt.laststatus = 2
opt.signcolumn = "yes"
opt.shortmess:append({S = true}, "s", true)
opt.spelllang = "en_us,ru"
local esc
local function _1_(_241)
  return vim.fn.escape(_241, ";,.\"|\\]")
end
esc = _1_
local en = esc("`qwertyuiop[]asdfghjkl;'zxcvbnm")
local ru = esc("\209\145\208\185\209\134\209\131\208\186\208\181\208\189\208\179\209\136\209\137\208\183\209\133\209\138\209\132\209\139\208\178\208\176\208\191\209\128\208\190\208\187\208\180\208\182\209\141\209\143\209\135\209\129\208\188\208\184\209\130\209\140")
local en_caps = esc("~QWERTYUIOP{}ASDFGHJKL:\"ZXCVBNM<>")
local ru_caps = esc("\195\139\208\153\208\166\208\163\208\154\208\149\208\157\208\147\208\168\208\169\208\151\208\165\208\170\208\164\208\171\208\146\208\144\208\159\208\160\208\158\208\155\208\148\208\150\208\173\208\175\208\167\208\161\208\156\208\152\208\162\208\172\208\145\208\174")
opt.langmap = (ru_caps .. ";" .. en_caps .. "," .. ru .. ";" .. en)
return nil
